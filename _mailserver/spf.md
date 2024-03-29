---
title: All about the SPF record
description: the tricks and best practices in definging SPF records
---

[Best Reference](https://www.linuxbabe.com/mail-server/setting-up-dkim-and-spf)
[Google SPF 1 - Basics](https://support.google.com/a/answer/10685031?hl=en)
[Google SPF 2 - Advanced](https://support.google.com/a/answer/10683907?sjid=16145958751574480438-EU)
[Google SPF 3 - Add your SPF record](https://support.google.com/a/answer/10684623?sjid=16145958751574480438-EU)

[](https://www.validity.com/blog/how-to-build-your-spf-record-in-5-simple-steps/)

## format

An SPF record is a line of plain text that includes a list of tags and values. The tags are called mechanisms. The values are typically IP addresses and domain names.

## what should be in the SPF

Your SPF record should include a reference to Google Workspace, and to the domains and IP addresses of all servers or services that send mail for your domain.
