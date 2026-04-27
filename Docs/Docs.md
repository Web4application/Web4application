# Vercel April 2026 security incident
Last updated April 24, 2026
By Security Team

---

We’ve identified a security incident that involved unauthorized access to certain internal Vercel systems. We are actively investigating, and we have engaged incident response experts to help investigate and remediate. We have notified law enforcement and will update this page as the investigation progresses.

In this bulletin:

*   [Updates](#updates)
*   [Who is impacted](#who-is-impacted)
*   [What we know](#what-we-know)
*   [Recommendations](#recommendations)
*   [Indicators of compromise (IOCs)](#indicators-of-compromise-iocs)
*   [Product enhancements](#product-enhancements)

## [Updates](#updates)[](#updates)

Given the current progress of our investigation and remediation efforts, we are moving to an ad hoc cadence for Security Bulletin updates. We will continue to be transparent with our customers and the community. If there are critical updates, we will alert any affected customers and will update this Security Bulletin. We have provided a security bulletin subscription at the top of this page to make monitoring easier.

| Date                   | Update                                                                                                                                                                                                     |
| ---------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| April 24, 4:22 PM PST  | No updates published.                                                                                                                                                                                      |
| April 23, 9:54 AM PST  | Further clarified [findings](#who-is-impacted) from our continued investigation.                                                                                                                           |
| April 22, 7:58 PM PST  | Published [findings](#who-is-impacted) from our continued investigation and additional details about [what we know](#what-we-know).                                                                        |
| April 20, 5:32 PM PST  | Validated npm packages [are not compromised](#what-we-know), added guidance for [multi-factor authentication](#enable-multi-factor-authentication), shipped [product enhancements](#product-enhancements). |
| April 20, 10:59 AM PST | Further clarified the [definition of compromised](#who-is-impacted) credentials and added new [Recommendations](#recommendations).                                                                         |
| April 19, 6:01 PM PST  | We published information about the [origin of the attack](#what-we-know) and added new [Recommendations](#recommendations).                                                                                |
| April 19, 11:04 AM PST | We published an [IOC](#indicators-of-compromise-iocs) to support the wider community in the investigation and vetting of potential malicious activity in their environments.                               |

## [Who is impacted](#who-is-impacted)[](#who-is-impacted)

Initially we identified a limited subset of customers whose non-sensitive environment variables stored on Vercel (those that decrypt to plaintext) were compromised. We reached out to that subset and recommended an immediate rotation of credentials.

As part of our continued investigation into the April 2026 incident, we expanded our review to include additional IOCs and conducted a broader analysis of requests to the Vercel network and environment variable read events in our logs. That review led to two separate findings:

*   First, we have identified a small number of additional accounts that were compromised as part of this incident, and we have notified the affected customers.
*   Second, we have identified a small number of customer accounts with signs of compromise that appear to be separate from the April 2026 incident. Based on our investigation to date, these compromises do not appear to have originated on Vercel systems. We have already contacted those accounts and provided them with specific corrective actions to remediate potential risk. This activity does not appear to be a continuation or expansion of the April incident, nor does it appear to be evidence of an earlier Vercel security incident.

## [What we know](#what-we-know)[](#what-we-know)

The incident originated with a compromise of Context.ai, a third-party AI tool used by a Vercel employee. The attacker used that access to take over the employee's individual Vercel Google Workspace account, which enabled them to gain access to that employee’s Vercel account. From there, they were able to pivot into a Vercel environment, and subsequently maneuvered through systems to enumerate and decrypt non-sensitive environment variables.

We assess the attacker as highly sophisticated based on their operational velocity and in-depth understanding of Vercel's product API surface. We are working with Google Mandiant, additional cybersecurity firms, industry peers, and law enforcement. We have also engaged Context.ai directly to understand the full scope of their compromise.

In collaboration with GitHub, Microsoft, npm, and Socket, our security team has confirmed that no npm packages published by Vercel have been compromised. There is no evidence of tampering, and we believe the supply chain remains safe.

## [Recommendations](#recommendations)[](#recommendations)

While we continue to take actions to protect Vercel systems and customers, here are best practices you should follow:

### [Enable multi-factor authentication](#enable-multi-factor-authentication)[](#enable-multi-factor-authentication)

Add an additional layer of security by requiring at least two methods of authentication. Learn more in our [2FA documentation](https://vercel.com/docs/two-factor-authentication).

*   Configure an [authenticator app](https://vercel.com/account/settings/authentication#two-factor-authentication).
*   Create a [passkey](https://vercel.com/account/settings/authentication#two-factor-authentication).

### [Environment variable best practices](#environment-variable-best-practices-)[](#environment-variable-best-practices-)

Deleting your Vercel projects or account is not sufficient to eliminate risk. Compromised secrets may still provide access to production systems, so you must rotate them before deleting your projects or account.

*   Review and rotate [environment variables](http://vercel.com/all-env-vars) that were not marked as “sensitive.” Those values (API keys, tokens, database credentials, signing keys, etc.) should be treated as potentially exposed and rotated as a priority.
*   Take advantage of the [sensitive environment variables](https://vercel.com/docs/environment-variables/sensitive-environment-variables) feature so that secret values are protected from being read in the future.

### [Additional recommendations](#additional-recommendations)[](#additional-recommendations)

*   Review the activity log for your account and environments for suspicious activity. You can review activity logs [in the dashboard](https://vercel.com/activity-log) or via the [CLI](https://vercel.com/docs/cli/activity).
*   Investigate [recent deployments](https://vercel.com/d?to=%2F%5Bteam%5D%2F%7E%2Fdeployments) for unexpected or suspicious looking deployments. If in doubt, delete any deployments in question.
*   Ensure that [Deployment Protection](https://vercel.com/d?to=%2F%5Bteam%5D%2F%7E%2Fsettings%2Fdeployment-protection) is set to Standard at a minimum.
*   Rotate your [Deployment Protection tokens](https://vercel.com/docs/deployment-protection/methods-to-bypass-deployment-protection/protection-bypass-automation), if set.

For help rotating your secrets or other technical support, contact us through [vercel.com/help](http://vercel.com/help).

## [Indicators of compromise (IOCs)](#indicators-of-compromise-iocs)[](#indicators-of-compromise-iocs)

Our investigation has revealed that the incident originated from a small, third-party AI tool whose Google Workspace OAuth app was the subject of a broader compromise, potentially affecting its hundreds of users across many organizations.

We are publishing the following IOC to support the wider community in the investigation and vetting of potential malicious activity in their environments. We recommend that Google Workspace Administrators and Google Account owners check for usage of this app immediately.

OAuth App: 110671459871-30f1spbu0hptbs60cb4vsmv79i7bbvqj.apps.googleusercontent.com

## [Product enhancements](#product-enhancements)[](#product-enhancements)

Our teams are actively shipping updates designed to help you strengthen your security posture.

*   Better environment variable management, with stronger defaults, improved safeguards, and in-product education
*   New team-wide management and security overview of environment variables
*   Easier to use activity log, including deep-linking to filtered views and higher information density
