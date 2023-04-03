---
---

```js
/* exported Script */
/* globals console, _, s */

/** Global Helpers
 *
 * console - A normal console instance
 * _       - An underscore instance
 * s       - An underscore string instance
 */

class Script {
    /**
     * @params {object} request
     */
    process_incoming_request({ request }) {
      // request.url.hash
      // request.url.search
      // request.url.query
      // request.url.pathname
      // request.url.path
      // request.url_raw
      // request.url_params
      // request.headers
      // request.user._id
      // request.user.name
      // request.user.username
      // request.content_raw
      // request.content
  
      // console is a global helper to improve debug
      console.log(request.content);
      console.log(request.content.attachments);
  
      return {
        content:{
          emoji: request.content.emoji,
          text: request.content.text,
          "attachments": request.content.attachments
         }
      };
  
      // return {
      //   error: {
      //     success: false,
      //     message: 'Error example'
      //   }
      // };
    }
  }
```
