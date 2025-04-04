---
title: security headers needed for REST Request Responses
---

[Docs](https://owasp.org/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/)

[Stable Docs](https://owasp.org/www-project-web-security-testing-guide/v42/4-Web_Application_Security_Testing/)

[GitHub Repo](https://github.com/OWASP/wstg/tree/master/document/4-Web_Application_Security_Testing)

[Non-OpenSource GitHub Repo](https://github.com/OWASP/www-project-web-security-testing-guide/tree/master/v41/4-Web_Application_Security_Testing)


## content security policy (CSP)

[Ref](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy)

[Docs](https://scotthelme.co.uk/content-security-policy-an-introduction/)

[Docs2](https://scotthelme.co.uk/csp-cheat-sheet/)

[Evaluate](https://csp-evaluator.withgoogle.com/)

## referrer policy

[Docs](https://scotthelme.co.uk/a-new-security-header-referrer-policy/)

## permission policy

[Docs](https://scotthelme.co.uk/goodbye-feature-policy-and-hello-permissions-policy/)

## WebServer fingerprint

[Docs](https://owasp.org/www-project-web-security-testing-guide/v42/4-Web_Application_Security_Testing/01-Information_Gathering/02-Fingerprint_Web_Server)
[Best Fix in Nginx](https://tomrichards.net/2022/08/anti-fingerprinting-configuration-for-nginx/)

[Nginx Alpine Repo](https://gitlab.alpinelinux.org/alpine/aports/-/tree/3.16-stable/main/nginx)
[Nginx Alpine headers more package](https://pkgs.alpinelinux.org/package/v3.16/main/x86_64/nginx-mod-http-headers-more)

## Webserver Metafiles

[Docs](https://owasp.org/www-project-web-security-testing-guide/v42/4-Web_Application_Security_Testing/01-Information_Gathering/03-Review_Webserver_Metafiles_for_Information_Leakage)

## test

[Good Site](https://plus.probely.app/)

## find tech of a site

[Not Bad One](https://sitereport.netcraft.com/)

## X-Frame-Options or CSP: frame-ancestors

[frame-ancestors](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy/frame-ancestors)
