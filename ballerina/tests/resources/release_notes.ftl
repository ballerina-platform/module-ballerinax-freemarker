╔══════════════════════════════════════════════════════════════════════════╗
  ${productName} — Release Notes
  Version ${version} | Released: ${releaseDate} | Type: ${releaseType}
╚══════════════════════════════════════════════════════════════════════════╝
<#if isBreakingRelease>

  ╔══════════════════════════════════════════════════════════════╗
  ⚠  BREAKING CHANGES — Please review the migration guide
     before upgrading: ${migrationGuideUrl}
  ╚══════════════════════════════════════════════════════════════╝
</#if>

OVERVIEW
────────────────────────────────────────────────────────────────────────────
${releaseSummary}

  Release Manager : ${releaseManager}
  QA Lead         : ${qaLead}
  Build Number    : ${buildNumber}
  Git Tag         : ${gitTag}
  Commit          : ${commitSha}
  Artifact URL    : ${artifactUrl}
  Changelog       : ${changelogUrl}
  Milestone       : ${milestoneUrl}

COMPATIBILITY
────────────────────────────────────────────────────────────────────────────
  Runtime         : ${runtimeName} ${runtimeVersion} or later
  Database        : ${dbCompatibility}
  API             : ${apiCompatibility}
  Upgrade From    : ${minUpgradeVersion} or later
                    (earlier versions require a full migration — see ${migrationGuideUrl!})

NEW FEATURES
────────────────────────────────────────────────────────────────────────────
  ${feature1Title}  [${feature1IssueId}]
    ${feature1Description}

  ${feature2Title}  [${feature2IssueId}]
    ${feature2Description}

  ${feature3Title}  [${feature3IssueId}]
    ${feature3Description}
<#if hasFeature4>

  ${feature4Title}  [${feature4IssueId}]
    ${feature4Description}
</#if>

IMPROVEMENTS
────────────────────────────────────────────────────────────────────────────
  * ${improvement1}  (${improvement1IssueId})
  * ${improvement2}  (${improvement2IssueId})
  * ${improvement3}  (${improvement3IssueId})
<#if improvement4??>
  * ${improvement4}  (${improvement4IssueId})
</#if>

BUG FIXES
────────────────────────────────────────────────────────────────────────────
  [${fix1Severity}]  ${fix1Description}  (${fix1IssueId})
  [${fix2Severity}]  ${fix2Description}  (${fix2IssueId})
  [${fix3Severity}]  ${fix3Description}  (${fix3IssueId})
  [${fix4Severity}]  ${fix4Description}  (${fix4IssueId})
  [${fix5Severity}]  ${fix5Description}  (${fix5IssueId})
<#if hasKnownIssues>

KNOWN ISSUES
────────────────────────────────────────────────────────────────────────────
  [${ki1Severity}]  ${ki1Description}
    Workaround : ${ki1Workaround}
    Tracking   : ${ki1IssueId}
<#if hasKi2>

  [${ki2Severity}]  ${ki2Description}
    Workaround : ${ki2Workaround}
    Tracking   : ${ki2IssueId}
</#if>

</#if>
<#if isBreakingRelease>
MIGRATION GUIDE SUMMARY
────────────────────────────────────────────────────────────────────────────
  Breaking Change 1 : ${breakingChange1}
    Action Required : ${breakingChange1Action}

  Breaking Change 2 : ${breakingChange2}
    Action Required : ${breakingChange2Action}

  Full guide: ${migrationGuideUrl}

</#if>
SECURITY ADVISORIES
────────────────────────────────────────────────────────────────────────────
<#if hasSecurityAdvisory>
  [${advisorySeverity}] ${advisoryId}: ${advisoryTitle}
    CVE             : ${advisoryCve}
    Affected vers.  : ${advisoryAffectedVersions}
    Fixed in        : ${version}
    Details         : ${advisoryUrl}
<#else>
  No security advisories in this release.
</#if>

DEPENDENCY UPDATES
────────────────────────────────────────────────────────────────────────────
  ${dep1Name}: ${dep1OldVersion} -> ${dep1NewVersion}
  ${dep2Name}: ${dep2OldVersion} -> ${dep2NewVersion}
  ${dep3Name}: ${dep3OldVersion} -> ${dep3NewVersion}
  ${dep4Name}: ${dep4OldVersion} -> ${dep4NewVersion}

CONTRIBUTORS
────────────────────────────────────────────────────────────────────────────
  ${contributors}

  Total commits  : ${totalCommits}
  Files changed  : ${filesChanged}
  Insertions (+) : ${insertions}
  Deletions  (-) : ${deletions}

<#-- Internal note: release approved by release manager — see release board for sign-off -->
────────────────────────────────────────────────────────────────────────────
Documentation  : ${docsUrl}
Report issues  : ${issueTrackerUrl}
Community      : ${communityUrl}
