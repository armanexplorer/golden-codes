---
title: All about the SPF record
description: the tricks and best practices in definging SPF records
---

[Best Reference](https://www.linuxbabe.com/mail-server/setting-up-dkim-and-spf)
[Google SPF 1 - Basics](https://support.google.com/a/answer/10685031?hl=en)
[Google SPF 2 - Advanced](https://support.google.com/a/answer/10683907?sjid=16145958751574480438-EU)
[Google SPF 3 - Add your SPF record](https://support.google.com/a/answer/10684623?sjid=16145958751574480438-EU)

[how to build the spf record](https://www.validity.com/blog/how-to-build-your-spf-record-in-5-simple-steps/)

## What is the process of SPF checking

Here's how Yahoo.com checks an email from <test@gmail.com> against SPF:

1. **Receiving the Email:** When Yahoo.com receives the email addressed to <test@yahoo.com>, it first examines the email header information. This header includes the "From" field, which in this case is <test@gmail.com>.

2. **Looking Up Gmail's SPF Record:** Yahoo.com needs to verify if the email originated from a legitimate Gmail server. To do this, it performs a DNS lookup for the SPF record of the domain name in the "From" address - gmail.com.

3. **Evaluating the SPF Record:** The SPF record for gmail.com likely includes mechanisms like:
    * **IP address listing:** It might specify a list of authorized IP addresses allowed to send emails for gmail.com.
    * **Include statements:** It might reference another SPF record hosted by Google for handling outgoing emails.

4. **Verifying Sending IP:** Yahoo.com checks the IP address from which the email arrived. This IP address should be included in the allowed list of gmail.com's SPF record or authorized by any included records.

5. **SPF Outcome:**
   * **SPF Pass:** If the email's sending IP address matches an authorized source in Gmail's SPF record, the SPF check passes. This indicates a higher chance of the email being legitimate.
   * **SPF Fail:** If there's no match or the SPF record is invalid, the SPF check fails. This raises suspicion about the email's origin.

**Additional Considerations:**

* **SPF is not foolproof:** A failing SPF check doesn't necessarily mean the email is spam. It just indicates a potential issue. Yahoo.com might use other checks like DKIM (DomainKeys Identified Mail) for further verification.
* **DMARC:**  Yahoo.com might also consider DMARC (Domain-based Message Authentication, Reporting & Conformance) policy associated with gmail.com. DMARC specifies how Yahoo.com should handle emails failing SPF checks (e.g., quarantine or reject).

By implementing SPF checks, Yahoo.com helps ensure emails claiming to be from gmail.com actually originated from their authorized servers, reducing the risk of email spoofing and phishing attacks.

For SPF checking, the receiving mail server (like Yahoo.com in your example)  uses the **From field in the email headers**, not the one in the SMTP envelope.

Here's why:

* **Email Headers:** The email header information is a standard format containing details about the email, including the sender's address (From), recipient (To), subject, and more. This information is visible to the recipient and can be easily spoofed.
* **SMTP Envelope:** The SMTP envelope, on the other hand, is used for routing the email internally between mail servers. It contains the sender's address and recipient's address but isn't directly visible to the recipient. While more secure, it's not ideal for SPF checks as it's less accessible for verification.

SPF relies on publicly available information in the DNS system. By looking up the SPF record for the domain name in the **From header**, Yahoo.com can verify if the email originated from an authorized server for that domain. This helps in identifying potential spoofing attempts where the sender address might be forged.
