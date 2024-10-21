---
title: redirect by CF
---

## redirect www to non-www (apex or root)

You can use Cloudflare to redirect all traffic from the `www` subdomain to the base domain (i.e., non-www). Here’s how you can achieve this:

### Steps

1. **Log in to Cloudflare Dashboard**:
   Go to [Cloudflare](https://dash.cloudflare.com/) and log into your account.

2. **Select the domain**:
   Choose the domain where you want to configure the redirection.

3. **Page Rules**:
   - In the dashboard, go to **Page Rules** in the left sidebar.
   - Click on **Create Page Rule**.

4. **Create a forwarding rule**:
   - In the "If the URL matches" field, enter: `www.example.com/*` (replace `example.com` with your domain).
   - In the "Then the settings are" dropdown, choose **Forwarding URL** and select **301 - Permanent Redirect**.
   - In the "Destination URL" field, enter `https://example.com/$1`, ensuring to use your base domain without the `www`.

5. **Save and Deploy**:
   Click **Save and Deploy**.

Once configured, Cloudflare will redirect all `www.example.com` traffic to `example.com`. This setup is efficient because the redirect happens at Cloudflare’s edge servers before the traffic even reaches your origin server.

## redirect .org and .net to .com

To redirect traffic from `.org` and `.net` domains to your `.com` domain using Cloudflare, you can follow these steps:

### Prerequisite

You need to have all your domains (`example.org`, `example.net`, and `example.com`) added to your Cloudflare account. You’ll configure the redirects for both the `.org` and `.net` domains using Page Rules.

### Steps

1. **Log in to Cloudflare Dashboard**:
   Go to [Cloudflare](https://dash.cloudflare.com/) and log into your account.

2. **Select the .org domain**:
   - Choose the `.org` domain from your list of domains.

3. **Create a Page Rule to redirect .org to .com**:
   - Navigate to **Page Rules** in the left sidebar.
   - Click on **Create Page Rule**.
   - In the "If the URL matches" field, enter `*example.org/*` (replace `example.org` with your actual `.org` domain).
   - In the "Then the settings are" dropdown, choose **Forwarding URL** and select **301 - Permanent Redirect**.
   - In the "Destination URL" field, enter `https://example.com/$2` (replace `example.com` with your actual `.com` domain).
   - Click **Save and Deploy**.

4. **Repeat for the .net domain**:
   - Repeat the same steps as above, but this time, select the `.net` domain from your list and configure the page rule to redirect traffic from `*example.net/*` to `https://example.com/$2`.

### Example Page Rule

For `.org` domain:

- **If the URL matches**: `*example.org/*`
- **Then forward to**: `https://example.com/$2`

For `.net` domain:

- **If the URL matches**: `*example.net/*`
- **Then forward to**: `https://example.com/$2`

### Notes

- The wildcard (`*`) ensures that any subdomains or paths in `.org` or `.net` are properly redirected to the corresponding path on the `.com` domain.
- The `$2` in the destination URL captures any sub-paths or parameters from the original request and appends them to the new destination.

Once you've created the page rules for both `.org` and `.net`, all traffic to those domains will be redirected to the `.com` domain.

[ref](https://community.cloudflare.com/t/redirecting-www-to-non-www/2949)
[ref](https://community.cloudflare.com/t/redirect-the-www-to-non-www/558655)
