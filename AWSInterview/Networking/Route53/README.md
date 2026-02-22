<!-- badhondevsecops.in -->

## What is AWS Route 53

- AWS Route53 is a service from Amazon that helps manage domain names and control how internet traffic gets to your websites or other resources.
- With Route53, you can:
  - Register domain names
  - Manage DNS settings, which tell the internet where to find your site
- It also helps is controlling how traffic is routed, ensuring your website stays available, even if there are issues, by using things like:
  - Routing traffic based on where users are located.
  - Checking the health of your servers to avoid downtime

---

## Benefits of Route53

- **_Highly Reliable_** : Build on AWS's highly available infrastructure, ensuring consistent routing to web applications via distributed DNS servers.
- **_Scalable _**: Automatically scales resources during high traffic and handles large queries without user intervention
- **_Easy to use_** : User-friendly interface for DNS settings configuration; DNS queries start resolving within minutes.
- **_Health Check_** : Monitors application health and redirects traffic to healthy resources if failures are detected
- **_Flexible_** : Allows for various routing policies based on needs.
- **_Simple_** : Manages global traffic with different routing types
- **_Cost-effective_** : Pay only for the services used
- **_Secure_**: Integrates with IAM for secure access, providing permissions to authorized users only

---

## AWS DNS Record Type | How Route 53 works

ns = Name Server
soa = start of authority