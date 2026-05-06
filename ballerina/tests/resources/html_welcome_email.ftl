<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Welcome to ${companyName}</title>
  <style>
    body { margin: 0; padding: 0; background-color: #f5f5f5; font-family: Arial, sans-serif; }
    .wrapper { max-width: 620px; margin: 40px auto; background: #ffffff; border-radius: 8px;
               box-shadow: 0 2px 8px rgba(0,0,0,0.08); overflow: hidden; }
    .header { background-color: ${brandColor}; padding: 36px 32px; text-align: center; }
    .header h1 { color: #ffffff; margin: 0 0 8px 0; font-size: 26px; letter-spacing: 0.5px; }
    .header p { color: rgba(255,255,255,0.85); margin: 0; font-size: 15px; }
    .body { padding: 36px 32px; color: #333333; line-height: 1.7; }
    .body p { margin: 0 0 16px 0; }
    .tier-banner { border-left: 4px solid ${brandColor}; background: #f0f7ff;
                   padding: 14px 18px; margin: 20px 0; border-radius: 0 4px 4px 0; }
    .tier-banner.free { border-left-color: #9e9e9e; background: #fafafa; }
    .badge { display: inline-block; padding: 2px 10px; border-radius: 10px;
             font-size: 11px; font-weight: bold; letter-spacing: 0.5px; vertical-align: middle; }
    .badge-premium { background: #ffd700; color: #333333; }
    .badge-standard { background: #e0e0e0; color: #555555; }
    .info-box { background: #f8f9fa; border: 1px solid #e9ecef; border-radius: 6px;
                padding: 18px 20px; margin: 20px 0; font-size: 14px; line-height: 2.1; }
    .info-box code { background: #e8eaf6; padding: 1px 6px; border-radius: 3px; font-size: 13px; }
    .section-heading { font-size: 16px; font-weight: bold; color: ${brandColor};
                       margin: 28px 0 12px 0; border-bottom: 1px solid #e0e0e0; padding-bottom: 6px; }
    .cta { text-align: center; margin: 28px 0; }
    .cta a { display: inline-block; background-color: ${brandColor}; color: #ffffff;
             padding: 13px 32px; border-radius: 5px; text-decoration: none;
             font-weight: bold; font-size: 15px; letter-spacing: 0.3px; }
    .api-box { background: #1e1e2e; color: #cdd6f4; border-radius: 6px;
               padding: 16px 20px; margin: 16px 0; font-family: monospace;
               font-size: 13px; line-height: 1.9; }
    .api-box .key { color: #89b4fa; }
    .api-box .val { color: #a6e3a1; }
    table.checklist { width: 100%; border-collapse: collapse; margin: 12px 0; font-size: 14px; }
    table.checklist th { background: #f0f0f0; text-align: left; padding: 8px 12px;
                         border: 1px solid #ddd; font-size: 13px; }
    table.checklist td { padding: 8px 12px; border: 1px solid #ddd; }
    .done { color: #2e7d32; font-weight: bold; }
    .pending { color: #ef6c00; }
    .footer { background: #f5f5f5; padding: 24px 32px; text-align: center;
              font-size: 12px; color: #9e9e9e; line-height: 1.8; border-top: 1px solid #e0e0e0; }
    .footer a { color: #9e9e9e; text-decoration: underline; }
  </style>
</head>
<body>
  <div class="wrapper">

    <div class="header">
      <h1>Welcome to ${companyName}!</h1>
      <p>Your <strong>${planName}</strong> account is ready to use</p>
    </div>

    <div class="body">
      <p>Hi <strong>${firstName} ${lastName}</strong>,</p>
      <p>
        Thank you for joining <strong>${companyName}</strong>. Your account was activated on
        <strong>${activatedDate}</strong> and is ready to use right away.
      </p>

      <#-- Conditional tier banner based on subscription level -->
<#if isPremium>
      <div class="tier-banner">
        <span class="badge badge-premium">PREMIUM</span>
        <strong> All features unlocked.</strong>
        You have access to ${premiumFeatureCount} premium capabilities,
        ${storageGb} GB of storage, and priority support
        with a <strong>${supportSla}</strong> response SLA.
      </div>
<#else>
      <div class="tier-banner free">
        <span class="badge badge-standard">STANDARD</span>
        <strong> Free tier active.</strong>
        Upgrade to <strong>${companyName} Pro</strong> to unlock advanced analytics,
        higher usage limits, and dedicated support.
        <a href="${upgradeUrl}">View plans</a>
      </div>
</#if>

      <div class="section-heading">Your Account Details</div>
      <div class="info-box">
        <strong>Username</strong>   : <code>${username}</code><br>
        <strong>Email</strong>      : ${email}<br>
        <strong>Plan</strong>       : ${planName}<br>
        <strong>Account ID</strong> : <code>${accountId}</code><br>
        <strong>Region</strong>     : ${region}<br>
        <strong>Time Zone</strong>  : ${timezone}<br>
        <strong>Member Since</strong>: ${activatedDate}
      </div>

      <#-- API section — only rendered when hasApiAccess is true -->
<#if hasApiAccess>
      <div class="section-heading">API Access</div>
      <p>Your plan includes programmatic access to the ${companyName} API:</p>
      <div class="api-box">
        <span class="key">endpoint  </span> : <span class="val">${apiBaseUrl}</span><br>
        <span class="key">version   </span> : <span class="val">${apiVersion}</span><br>
        <span class="key">auth      </span> : <span class="val">Bearer token (manage in Settings)</span><br>
        <span class="key">rate limit</span> : <span class="val">${rateLimitRpm} requests / minute</span>
      </div>
      <p>Full API reference: <a href="${apiDocsUrl}">${apiDocsUrl}</a></p>
</#if>

      <div class="section-heading">Getting Started</div>
      <ol>
        <li>Log in at <a href="${loginUrl}">${loginUrl}</a></li>
        <li>Verify your email address (check inbox for <strong>${email}</strong>)</li>
        <li>Complete your profile under <strong>Account Settings</strong></li>
        <li>Read the <a href="${docsUrl}">Quick Start Guide</a></li>
<#if hasApiAccess>
        <li>Generate your first API key under <strong>Settings / API Keys</strong></li>
</#if>
        <li>Join our community at <a href="${communityUrl}">${communityUrl}</a></li>
      </ol>

      <div class="section-heading">Onboarding Checklist</div>
      <table class="checklist">
        <tr><th>#</th><th>Task</th><th>Status</th></tr>
        <tr><td>1</td><td>Create account</td><td class="done">Done</td></tr>
        <tr><td>2</td><td>Verify email address</td><td class="pending">Pending</td></tr>
        <tr><td>3</td><td>Enable two-factor authentication</td><td class="pending">Pending</td></tr>
        <tr><td>4</td><td>Complete your profile</td><td class="pending">Pending</td></tr>
        <tr><td>5</td><td>Invite teammates (up to ${maxTeamMembers} on your plan)</td><td class="pending">Pending</td></tr>
        <tr><td>6</td><td>Connect your first integration</td><td class="pending">Pending</td></tr>
      </table>

      <div class="cta">
        <a href="${dashboardUrl}">Open Dashboard</a>
      </div>

      <div class="section-heading">Support</div>
      <p>
        Our support team is available <strong>${supportHours}</strong>.
        Contact us at <a href="mailto:${supportEmail}">${supportEmail}</a>
        <#if hasSupportPhone>or call us at <strong>${supportPhone}</strong></#if>.
      </p>
      <p>
        Documentation: <a href="${docsUrl}">${docsUrl}</a><br>
        System status: <a href="${statusUrl}">${statusUrl}</a><br>
        Community forum: <a href="${communityUrl}">${communityUrl}</a>
      </p>

      <p style="margin-top: 32px;">
        Welcome aboard!<br><br>
        <strong>${senderName}</strong><br>
        ${senderTitle}, ${companyName}
      </p>
    </div>

    <div class="footer">
      <#-- Auto-generated welcome email - do not reply directly to this message -->
      <p>${companyName} | ${companyAddress}</p>
      <p>
        You received this because you signed up at
        <a href="${signupUrl}">${signupUrl}</a> on ${signupDate}.
      </p>
      <p>
        <a href="${unsubscribeUrl}">Unsubscribe</a> |
        <a href="${privacyUrl}">Privacy Policy</a> |
        <a href="${termsUrl}">Terms of Service</a>
      </p>
      <p>Account: ${accountId} | Sent: ${sentAt}</p>
    </div>

  </div>
</body>
</html>