---
title: definitions and examples with regex
---

## capturing and non-capturing groups

In Python's regular expressions, you can define non-capturing groups using the syntax `(?:pattern)`. This syntax allows you to group a part of your regex pattern without capturing the matched text within that group.

Here's a breakdown of how non-capturing groups work:

* **Capturing Groups:** By default, parentheses `()` in a regex define a capturing group. When a match occurs for the pattern within the parentheses, the matched text is stored and can be accessed later in the match object.
* **Non-Capturing Groups:** Using `(?:)` instead of parentheses creates a non-capturing group. The pattern within the non-capturing group still participates in the overall matching process, but the matched text is not stored as a separate group.

**Benefits of Non-Capturing Groups:**

* **Improved Readability:** Non-capturing groups can improve the readability of complex regex patterns by grouping sub-patterns without cluttering the code with unnecessary capturing groups.
* **Performance:** While minor, non-capturing groups can offer a slight performance improvement as the regex engine doesn't need to track the captured text for these groups.
* **Grouping Without Capturing:**  Sometimes you need to group a part of the pattern for logical reasons (e.g., applying quantifiers) but don't care about the specific captured text. Non-capturing groups are ideal for such scenarios.

**Here's an example to illustrate the difference:**

```python
import re

text = "This is a test string with an email example@example.com"

# Capturing group - captures the email address
pattern1 = r"(\w+@\w+\.\w+)"

# Non-capturing group - groups the domain part but doesn't capture it
pattern2 = r"This is a test string with an email (?:\w+@)(\w+\.\w+)"

match1 = re.search(pattern1, text)
match2 = re.search(pattern2, text)

# Accessing captured text (pattern1)
if match1:
  email = match1.group(1)
  print(f"Email (captured): {email}")

# No captured text for non-capturing group (pattern2)
if match2:
  print(f"Full Match (pattern2): {match2.group()}")
```

This code demonstrates that `pattern1` captures the email address using a capturing group, while `pattern2` uses a non-capturing group to group the domain part without capturing it.

## greedy and non-greedy

By default, quantifiers in Python's regular expressions (*, +, ?, {m,n}) are greedy. This means they try to match **as many characters as possible** in the string to fulfill the quantifier's requirement.

Here's how greedy matching works with common quantifiers:

* **'*' (Zero or more):** Matches the preceding element zero or more times, and it will try to match as many repetitions as possible.
* **'+' (One or more):** Matches the preceding element one or more times, again trying to consume the maximum characters possible.
* **'?' (Zero or one):** Matches the preceding element zero or one time. Since it only needs one match, greediness isn't a major factor here.
* **'{m,n}' (Range):** Matches the preceding element at least m times but no more than n times. Greed still applies within this range, trying to reach the maximum repetitions allowed (n) if possible.

Here's an example to illustrate greedy matching:

```python
import re

text = "abcbcacdefb"

# Greedy match - captures the entire string
pattern = r"a.*b"  # Matches 'a' followed by zero or more characters (greedy) then 'b'

match = re.search(pattern, text)

if match:
  print(f"Greedy Match: {match.group()}")
```

In this example, `.*` (zero or more characters) will greedily match the entire string "abcbcacdef" even though "abc" would also satisfy the pattern.

**How to Control Greediness:**

If you want to perform non-greedy matching (matching the fewest characters possible), you can add a question mark (?) after the quantifier. This modifies its behavior to be lazy:

* **'*?' (Zero or more - non-greedy):** Matches the preceding element zero or more times, but tries to match the fewest characters possible.
* **'+?' (One or more - non-greedy):** Matches the preceding element one or more times, but tries to match the fewest characters possible.
* **'{m,n}?' (Range - non-greedy):** Matches the preceding element at least m times but no more than n times. It attempts to reach the minimum repetitions allowed (m) to satisfy the pattern.

Here's the same example modified for non-greedy matching:

```python
pattern = r"a.*?b"  # Matches 'a' followed by zero or more characters (non-greedy) then 'b'

match = re.search(pattern, text)

if match:
  print(f"Non-Greedy Match: {match.group()}")
```

Now, the match will be "abc" because the non-greedy `.*?` stops matching characters as soon as it finds the first occurrence of 'b' that allows the entire pattern to match.

**Remember:**

* Greedy matching is the default behavior.
* Use `*?` after quantifiers to make them non-greedy.
