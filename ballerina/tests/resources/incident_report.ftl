INCIDENT REPORT
═══════════════════════════════════════════════════════════════════════
Report ID       : ${reportId}
Classification  : ${classification}
Status          : ${status}
Created By      : ${reportAuthor}
Created At      : ${createdAt} UTC
Last Updated    : ${lastUpdated} UTC
═══════════════════════════════════════════════════════════════════════

1. INCIDENT OVERVIEW
───────────────────────────────────────────────────────────────────────
Title            : ${incidentTitle}
Severity         : ${severity}
Priority         : ${priority}
Incident ID      : ${incidentId}
Detected At      : ${detectedAt} UTC
Resolved At      : ${resolvedAt} UTC
Total Duration   : ${durationMinutes} minutes
Environment      : ${environment}
Affected Service : ${affectedService}
On-call Team     : ${oncallTeam}
Incident Owner   : ${incidentOwner}
<#if isP1>
╔══════════════════════════════════════════════════════════════╗
  *** P1 CRITICAL — EXECUTIVE ESCALATION REQUIRED ***
  Incident Commander : ${incidentCommander}
  War Room Channel   : ${warRoomChannel}
  Bridge Line        : ${bridgeLine}
╚══════════════════════════════════════════════════════════════╝
</#if>

2. IMPACT ASSESSMENT
───────────────────────────────────────────────────────────────────────
Affected Region      : ${affectedRegion}
Affected Users (est) : ${affectedUserCount}
Peak Error Rate      : ${peakErrorRate}%
P99 Latency Peak     : ${peakLatencyMs}ms  (SLO threshold: ${sloLatencyMs}ms)
Revenue Impact (est) : $${revenueImpact}
SLA Breach           : <#if slaBreach>YES — violated ${slaBenchmark} objective<#else>No</#if>
Customer Facing      : <#if customerFacing>Yes<#else>No (internal only)</#if>
Data Loss            : <#if dataLoss>YES — ${dataLossDetails}<#else>None confirmed</#if>
Security Impact      : <#if securityImpact>YES — refer to ${securityTicketId}<#else>None identified</#if>

3. ROOT CAUSE ANALYSIS
───────────────────────────────────────────────────────────────────────
Category        : ${rootCauseCategory}
Root Cause      :
  ${rootCause}

Contributing Factors:
  - ${contributingFactor1}
  - ${contributingFactor2}
<#if contributingFactor3>
  - ${contributingFactor3}
</#if>

Trigger Event   : ${triggerEvent}
First Alert     : ${firstAlertSource} at ${firstAlertTime} UTC
Detection Method: ${detectionMethod}
Alert ID        : ${alertId}

4. TIMELINE OF EVENTS
───────────────────────────────────────────────────────────────────────
  ${detectedAt} UTC   Incident detected via ${detectionMethod}
  ${firstAckAt} UTC   Alert acknowledged by ${firstResponder}
  ${diagnosisAt} UTC  Root cause identified: ${rootCauseShort}
  ${mitigationAt} UTC Mitigation applied: ${mitigationAction}
  ${resolvedAt} UTC   Incident resolved; system confirmed stable
  ${reportedAt} UTC   Post-incident report filed by ${reportAuthor}

5. MITIGATION AND RESOLUTION
───────────────────────────────────────────────────────────────────────
Mitigation      : ${mitigationAction}
Resolution      : ${resolutionAction}
Rollback        : <#if rollbackPerformed>Yes — reverted to build ${rollbackVersion}<#else>Not required</#if>
Fix Deployed    : <#if fixDeployed>Yes — ${fixDescription} deployed at ${fixDeployedAt} UTC<#else>Pending — target: ${fixTargetDate}</#if>
Monitoring OK   : Confirmed stable at ${monitoringStableAt} UTC

6. CORRECTIVE ACTION ITEMS
───────────────────────────────────────────────────────────────────────
ID       Owner                Due Date      Priority   Description
-------- -------------------- ------------- ---------- ----------------------------------------
AI-001   ${ai001Owner}       ${ai001Due}  HIGH       ${ai001Description}
AI-002   ${ai002Owner}       ${ai002Due}  HIGH       ${ai002Description}
AI-003   ${ai003Owner}       ${ai003Due}  MEDIUM     ${ai003Description}
AI-004   ${ai004Owner}       ${ai004Due}  LOW        ${ai004Description}

7. LESSONS LEARNED AND PREVENTION
───────────────────────────────────────────────────────────────────────
What went well   : ${wentWell}
What went poorly : ${wentPoorly}
Process Gap      : ${processGap}
Monitoring Gap   : ${monitoringGap}
Runbook          : <#if runbookCreated>Created — ${runbookUrl}<#else>Required by ${runbookDueDate}</#if>
Post-Mortem      : ${postMortemDate} UTC, owner: ${postMortemOwner}
Jira Epic        : ${jiraEpic}
<#if requiresExternalComms>

8. EXTERNAL COMMUNICATIONS LOG
───────────────────────────────────────────────────────────────────────
Status Page Updated : <#if statusPageUpdated>Yes at ${statusPageTime} UTC<#else>No</#if>
Customer Comms Sent : <#if customerCommsSent>Yes at ${customerCommsTime} UTC<#else>Not sent</#if>
Regulatory Notify   : <#if regulatoryNotify>Required — deadline ${regulatoryDeadline} UTC<#else>Not required</#if>
PR / Comms Owner    : ${prCommsOwner}
</#if>

═══════════════════════════════════════════════════════════════════════
Approved by   : ${reportSignoff}
Approval time : ${signoffTime} UTC
═══════════════════════════════════════════════════════════════════════