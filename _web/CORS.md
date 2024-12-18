---
title: all about CORS (Cross-Origin Resource Sharing)
---

[Docs](https://developer.mozilla.org/en-US/docs/Glossary/CORS)

## request headers

[safe request headers](https://developer.mozilla.org/en-US/docs/Glossary/CORS-safelisted_request_header)

## response headers

[safe response headers](https://developer.mozilla.org/en-US/docs/Glossary/CORS-safelisted_response_header)

## test CORS

[Live Test](https://cors-test.codehappy.dev/)

## manual test

Here, we can manually tests that "<http://localhost:3000>" is allowed for CORS or not.

```bash
# test GET request
curl -I \
-H "Access-Control-Request-Method: GET" \
-H "Origin: http://localhost:3000" \
-X GET \
https://example.com/api/v1/adssafasdfsad

# test OPTIONS request
curl -I \
-H "Access-Control-Request-Method: GET" \
-H "Origin: http://localhost:3000" \
-X OPTIONS \
https://example.com/api/v1/adssafasdfsad
```

Above commands will only print headers (because of `-I`). So they should encompass `access-control-allow-origin`.
Also, you can use `--verbose` to see more logs in each request
