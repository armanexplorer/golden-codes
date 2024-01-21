---
---

# what are interruptable (called spot in aws) instances and how burstable or serverless can complement it?

In the context of data centers and inference serving, interruptible instances, also known as spot instances, refer to cloud computing instances that are available at a significantly lower cost compared to on-demand instances. However, they can be interrupted and reclaimed by the cloud provider with short notice when the provider needs the capacity back. These instances are suitable for fault-tolerant, flexible workloads, such as batch processing, data analysis, and scientific computing, where the work can be distributed and rescheduled if an interruption occurs[2][4].

Interruptible instances are often used to reduce costs for non-time-sensitive workloads, and various cloud providers offer them, such as AWS with its spot instances and GCP with its interruptible instances[3][5]. While they offer cost savings, it's important to design systems to handle interruptions and gracefully deal with instance reclaiming, such as using fault-tolerant and interruption-tolerant mechanisms[4].

In the context of inference serving, interruptible instances can be leveraged to reduce costs, but it's crucial to consider the potential impact of interruptions on the latency and cost of serving inference requests. Strategies such as using burstable instances as transient backups and employing serverless computing (e.g., AWS Lambda) can be considered to mitigate the effects of interruptions on inference serving[4].

Overall, interruptible instances provide a cost-effective option for certain workloads, but their suitability depends on the specific requirements and characteristics of the applications and services being run.

Citations:
[1] https://aws.amazon.com/ec2/faqs/
[2] https://www.usenix.org/system/files/atc19-zhang-chengliang.pdf
[3] https://news.ycombinator.com/item?id=36025099
[4] https://par.nsf.gov/servlets/purl/10166780
[5] https://arxiv.org/pdf/2202.02973.pdf