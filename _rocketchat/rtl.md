---
title: make rocketchat support RTL
---

[Ref](https://github.com/RocketChat/Rocket.Chat/issues/26499)

## only fix RTL

If you want to keep messages in left and just fixing RTL issue, add the following script to `workspace/settings/layotu/Custom CSS`

```css
.rcx-message-body {
  text-align: left;
}
```

## improve message box and fix RTL

To make the RTL languages ot start from right  to left, add the following script to `workspace/settings/layotu/Custom Scripts` in the `Custom Script for Logged In Users`:

```js
function setAutoDir(){
    $("div.rcx-message-container[dir!='auto'],div.rcx-message-body[dir!='auto']").attr('dir', 'auto');
    $("textarea.rc-message-box__textarea[dir!='auto']").attr('dir', 'auto');
}
setAutoDir();
var elementCount = $('.rcx-message-body').length;
var observer = new MutationObserver(function(mutations) {
   var newCount = $('.rcx-message-body').length;
   if (newCount != elementCount) {
        elementCount = newCount;
        setAutoDir();
    }
});
observer.observe(document, {attributes: false, childList: true, characterData: false, subtree:true});
```
