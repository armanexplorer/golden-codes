---
title: make cluster of nginx web servers in sync
---


[Doc](https://docs.nginx.com/nginx/admin-guide/high-availability/zone_sync_details/)

# Data Flow
1. The functional module creates a new record (for example, a new sticky session)

2. The record is inserted into the output queue

3. The functional module may continue its normal operation. As a result, the record can be updated multiple times or even deleted (for example, locally on the node after a direct request) before being shared with other nodes.

4. Periodic timer triggers, and the zone synchronization module inspects the output queue of the functional module.

5. If the queue is not empty, the zone synchronization module asks the functional module to serialize the outgoing records and writes them into its own buffer.

6. The functional module serializes a record using its own serialization format. Typically, it includes key, timestamp, and payload.

7. The zone synchronization module consumes the output queue until it has no buffer space available or the queue is empty.

8. Finally, the zone synchronization module sends all information it has read to nodes it has established connections with, framing the records into messages that contain zone name and version details. If an error occurs and a record cannot be delivered to a node, the connection to the node is closed to be reestablished. See the explanation of the initial state of a cluster portion below.

9. The remote node receives the message and dispatches it to the appropriate functional module and zone. The functional module now has to refresh its local state using the information from the remote node (key, timestamp, and payload) by:
    - Inserting the new record at the key if no such key exists
    - Updating an existing record if the remote timestamp is newer
    - Ignoring the update if the local timestamp is newer

10. The functional module, that is capable to serialize zone state to disk (i.e. keyval with the “state” enabled) saves record timestamps to ensure proper handling of records lifetime after server restart.
