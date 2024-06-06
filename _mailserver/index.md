---
title: sending mail
---

## Intro - Architecture of an Email System

A typical email system consists of the following components **Mail User Agent (MUA)**, **Mail Delivery Agent (MDA)**, and **Mail Transport Agent (MTA)**.

### Mail User Agent (MUA)

The MUA is more commonly known as the email client. It is the user-facing piece of the email system. Usually, when we’re composing or reading emails, we’re interacting with the MUA. Some commonly known MUA include Outlook, Gmail, and mutt in Linux.

### Mail Delivery Agent (MDA)

MDA is the component that is responsible for accepting the email from an MTA and saving it in the recipient mailbox. It talks to the MUA using IMAP or POP3.

### Mail Transport Agent (MTA)

The MTA is the component that does the email forwarding and routing using the headers on the email. It is also known as the SMTP server as it communicates with other components in the SMTP. Its role in the email system includes (but is not limited to):

- Accepting emails from other MTA
- Forwarding the email to the appropriate MTA for further routing
- Passing the email to the MDA

## useful links

[RFC7489](https://datatracker.ietf.org/doc/html/rfc7489)

[Prevent spam, spoofing & phishing with Gmail authentication](https://support.google.com/a/answer/10583557?sjid=16145958751574480438-EU)

[Test Mail Server](https://mxtoolbox.com/SuperTool.aspx)

[The Best in Automatic IP Listing Technology](https://www.spamrats.com/lookup.php?ip={ip_address})

## PTR record

Response from MXToolBox Support:

> Your PTR record is mail-hosting.dk which is a Domain name. The RFC guidelines say that is must be a hostname such as mail.mail-hosting.dk. Most systems won't care that it is a domain, but since it's against the RFC guidelines, we show a warning.

## best clients for linux

[itsfoss](https://itsfoss.com/best-email-clients-linux/)
