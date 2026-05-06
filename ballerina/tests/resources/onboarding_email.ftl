Welcome to ${companyName}, ${firstName} ${lastName}!

Your account has been created:
  Email    : ${email}
  Username : ${username}
  Role     : ${role}
  Team     : ${team}
<#if phone>  Phone    : ${phone}
<#else>  Phone    : (not provided)
</#if>
Login at ${loginUrl} and change your temporary password: ${tempPassword}

Your onboarding buddy is ${buddyName} (${buddyEmail}).
