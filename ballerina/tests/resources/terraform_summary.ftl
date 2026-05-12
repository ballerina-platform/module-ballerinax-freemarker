# Terraform Apply — Resource Summary

Workspace  : ${workspace}
Backend    : ${backend}
Run ID     : ${runId}
Triggered  : ${triggeredBy} at ${triggeredAt}

Changes applied:
  + ${resourcesAdded} to add
  ~ ${resourcesChanged} to change
  - ${resourcesDestroyed} to destroy

State file  : ${stateFile}
Lock ID     : ${lockId}
Duration    : ${durationSeconds}s

Apply complete! Resources: ${resourcesAdded} added, ${resourcesChanged} changed, ${resourcesDestroyed} destroyed.
