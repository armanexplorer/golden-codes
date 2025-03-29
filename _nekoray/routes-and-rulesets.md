---
title: how to configure routes and rulesets in Nekoray
---

## sing-box core in unstable version of Nekoray

[Link](https://github.com/Chocolate4U/Iran-sing-box-rules?tab=readme-ov-file)

First, Download the rulesets you need from the above link:

- [geoip-ir](https://raw.githubusercontent.com/Chocolate4U/Iran-sing-box-rules/rule-set/geoip-ir.srs)
- [geosite-ir](https://raw.githubusercontent.com/Chocolate4U/Iran-sing-box-rules/rule-set/geosite-ir.srs)
- [geosite-category-ads-all (optional)](https://raw.githubusercontent.com/Chocolate4U/Iran-sing-box-rules/rule-set/geosite-category-ads-all.srs)

Then put them into the `config/rule_sets` of the Nekoray program.

Now, go to the `Routing Setting` and create new `Routing Profile` (each profile will take `rules` arrays as input) through basic settings or advanced settings.

We can fill the profile with `basic` settings like this:

- Direct:
    - ruleset:geosite-ir
    - ruleset:geoip-ir
- Block:
    - ruleset:geosite-category-ads-all

Now after clicking on OK, you will see restart program message and after that, all the things have been set. Cheers!
