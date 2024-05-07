---
title: how to have RTL in jira
---

[Reference](https://stackoverflow.com/questions/51764727/correctly-showing-rtl-languages-in-jira/78305070#78305070)

[How to customize Jira with JavaScript and CSS](https://confluence.atlassian.com/jirakb/how-to-customize-jira-with-javascript-and-css-1178874962.html)

[Use Case of customizing Jira with CSS](https://confluence.atlassian.com/jirakb/how-to-hide-elements-in-jira-using-css-or-javascript-958774526.html)

[RTL Plugin (archived)](https://marketplace.atlassian.com/archive/1213663)

## by injecting JS script in `Announcement Banner`

```html
<script>
  // Function to update the dir attribute
  function updateDirAttribute() {
    // Get all elements with the specified CSS classes
    const rtlElements = document.querySelectorAll(
      ".activity-item-summary, .editable-field p, .editable-field.inactive, .inline-edit-fields, .textarea, #summary, .summary, .description, #summary-val, #description-val p, #issue_actions_container div.action-body.flooded, .stsummary, .worklog-comment, .activity-item-description .user-content, #activity-stream, .issue-link, .link-summary, .link-content p, .issue-link, .issue-link-summary, .activity-old-val, .activity-new-val, .activity-item-description p, .rowAlternate b, .ghx-summary, .iic-widget__summary"
    );

    // Set the dir attribute to "auto" for each element
    rtlElements.forEach((element) => {
      element.setAttribute("dir", "auto");
    });
  }

  // Create a MutationObserver instance
  const observer = new MutationObserver(updateDirAttribute);

  // Configure the observer to watch for changes in the entire document
  observer.observe(document.documentElement, {
    attributes: false,
    childList: true,
    characterData: false,
    subtree: true,
  });

  // Run the initial update
  updateDirAttribute();
</script>
```
