// Copyright (c) 2026 WSO2 LLC. (http://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/io;
import ballerina/test;

const RESOURCES = "tests/resources/";
const EXPECTED = "tests/resources/expected/";

final map<json> orderConfirmationData = {
    "customerName": "Emily Carter",
    "orderId": "ORD-20260415-9821",
    "productName": "Wireless Noise-Cancelling Headphones",
    "quantity": "2",
    "unitPrice": "149.99",
    "totalAmount": "299.98",
    "deliveryDate": "April 20, 2026",
    "storeName": "TechMart"
};

final map<json> passwordResetData = {
    "username": "john_doe",
    "email": "john.doe@example.com",
    "resetLink": "https://app.example.com/reset?token=abc123xyz",
    "expiryMinutes": "30",
    "originIp": "203.0.113.42",
    "requestTime": "2026-04-15 08:32:11"
};

final map<json> deploymentNotificationData = {
    "serviceName": "payment-service",
    "version": "v3.7.2",
    "environment": "production",
    "region": "us-east-1",
    "deployedBy": "ci-bot",
    "durationSeconds": "47",
    "commitSha": "f3a9c12",
    "commitMessage": "Fix race condition in transaction lock"
};

final map<json> apiErrorResponseData = {
    "statusCode": "422",
    "errorCode": "VALIDATION_FAILED",
    "message": "The field email must be a valid email address.",
    "requestPath": "/api/v2/users",
    "requestId": "req-7f3b91ca-0d22",
    "timestamp": "2026-04-15T09:15:00Z"
};

final map<json> databaseConfigData = {
    "dbHost": "db-prod-primary.internal",
    "dbPort": "5432",
    "dbName": "orders_db",
    "dbUser": "svc_orders",
    "dbPassword": "s3cr3t!Pass",
    "poolMin": "5",
    "poolMax": "50",
    "poolTimeout": "30000",
    "sslEnabled": "true"
};

final map<json> httpAccessLogData = {
    "clientIp": "198.51.100.7",
    "userId": "usr-4421",
    "timestamp": "15/Apr/2026:10:22:03 +0000",
    "method": "POST",
    "path": "/api/v1/orders",
    "protocol": "HTTP/1.1",
    "statusCode": "201",
    "responseBytes": "842",
    "referer": "https://shop.example.com/checkout",
    "userAgent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)",
    "durationMs": "134"
};

final map<json> ciTestSummaryData = {
    "project": "module-ballerina-http",
    "branch": "feature/connection-pooling",
    "commitSha": "a1b2c3d",
    "runnerOs": "Ubuntu",
    "runnerArch": "x86_64",
    "totalTests": "312",
    "passedTests": "308",
    "failedTests": "2",
    "skippedTests": "2",
    "durationSecs": "183",
    "coveragePercent": "87.4",
    "overallStatus": "UNSTABLE"
};

final map<json> invoiceData = {
    "invoiceNumber": "INV-2026-00847",
    "invoiceDate": "2026-04-15",
    "dueDate": "2026-05-15",
    "billingName": "Acme Corporation",
    "billingAddress": "742 Evergreen Terrace",
    "billingCity": "Springfield",
    "billingCountry": "US",
    "itemDescription": "Annual SaaS Subscription - Enterprise Plan",
    "itemQty": "12",
    "itemUnitPrice": "499.00",
    "subtotal": "5988.00",
    "taxRate": "8.5",
    "taxAmount": "508.98",
    "totalDue": "6496.98",
    "paymentMethod": "ACH Bank Transfer",
    "paymentRef": "ACH-88219934"
};

final map<json> kubernetesDeploymentData = {
    "appName": "auth-service",
    "namespace": "backend",
    "appVersion": "2.1.0",
    "teamName": "platform",
    "replicas": "3",
    "imageRepo": "registry.example.io",
    "containerPort": "8080",
    "cpuRequest": "250m",
    "memoryRequest": "128Mi",
    "cpuLimit": "500m",
    "memoryLimit": "256Mi"
};

final map<json> securityAlertData = {
    "severity": "CRITICAL",
    "alertType": "Privilege Escalation Attempt",
    "alertId": "SEC-2026-04150042",
    "detectedAt": "2026-04-15 11:44:28",
    "affectedAsset": "prod-db-primary (10.0.1.5)",
    "sourceIp": "192.0.2.88",
    "actorIdentity": "svc_legacy_importer",
    "action": "GRANT ALL PRIVILEGES",
    "resource": "orders_db.*",
    "riskScore": "97",
    "description": "Service account attempted to grant superuser privileges on production database.",
    "recommendedAction": "Revoke credentials, rotate secrets, and initiate incident response playbook IR-DB-01.",
    "assignee": "security-oncall@example.com",
    "ticketUrl": "https://jira.example.com/browse/SEC-4421"
};

final map<json> newsletterPremiumData = {
    "firstName": "Sophia",
    "isPremium": true,
    "newsletterName": "Dev Weekly",
    "headline1": "Rust's new async runtime lands in stable",
    "headline2": "OpenAI releases GPT-5 API preview",
    "headline3": "WSO2 Ballerina 2201.10.0 release highlights"
};

final map<json> newsletterFreeData = {
    "firstName": "Marcus",
    "isPremium": false,
    "newsletterName": "Dev Weekly",
    "headline1": "Rust's new async runtime lands in stable",
    "headline2": "OpenAI releases GPT-5 API preview",
    "headline3": "WSO2 Ballerina 2201.10.0 release highlights"
};

final map<json> structuredLogData = {
    "level": "ERROR",
    "timestamp": "2026-04-15T11:55:02.312Z",
    "logger": "io.example.OrderService",
    "message": "Failed to persist order: duplicate key violation",
    "service": "order-service",
    "traceId": "4bf92f3577b34da6a3ce929d0e0e4736",
    "spanId": "00f067aa0ba902b7",
    "userId": "usr-9923",
    "latencyMs": "342",
    "statusCode": "500",
    "host": "pod-order-service-7d8f9b-xkq2p",
    "environment": "production"
};

final map<json> oauth2IntrospectionData = {
    "active": "true",
    "sub": "usr-00412",
    "clientId": "web-app-prod",
    "scope": "openid profile email orders:read",
    "iss": "https://auth.example.com",
    "aud": "https://api.example.com",
    "iat": "1713171600",
    "exp": "1713175200",
    "tokenType": "Bearer",
    "jti": "a-bc12-def3456"
};

final map<json> onboardingEmailWithPhoneData = {
    "companyName": "Horizon Labs",
    "firstName": "Priya",
    "lastName": "Mehta",
    "email": "priya.mehta@horizonlabs.io",
    "username": "pmehta",
    "role": "Senior Engineer",
    "team": "Platform",
    "phone": "+1-415-555-0199",
    "loginUrl": "https://id.horizonlabs.io",
    "tempPassword": "Tr@nsit!on42",
    "buddyName": "Carlos Rivera",
    "buddyEmail": "c.rivera@horizonlabs.io"
};

final map<json> onboardingEmailWithoutPhoneData = {
    "companyName": "Horizon Labs",
    "firstName": "Liam",
    "lastName": "Morrison",
    "email": "l.morrison@horizonlabs.io",
    "username": "lmorrison",
    "role": "Product Manager",
    "team": "Growth",
    "loginUrl": "https://id.horizonlabs.io",
    "tempPassword": "Tr@nsit!on99",
    "buddyName": "Aisha Kamara",
    "buddyEmail": "a.kamara@horizonlabs.io"
};

final map<json> terraformSummaryData = {
    "workspace": "prod-us-east-1",
    "backend": "s3://tf-state-bucket/prod/us-east-1",
    "runId": "run-AbCdEf123456",
    "triggeredBy": "github-actions[bot]",
    "triggeredAt": "2026-04-15T12:00:00Z",
    "resourcesAdded": "4",
    "resourcesChanged": "2",
    "resourcesDestroyed": "1",
    "stateFile": "prod/us-east-1/terraform.tfstate",
    "lockId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
    "durationSeconds": "68"
};

final map<json> supportTicketData = {
    "ticketId": "TKT-2026-083441",
    "requesterName": "Dr. Nguyen Van An",
    "tier": "Enterprise",
    "subject": "Data export fails silently for reports > 100k rows",
    "priority": "High",
    "category": "Bug / Data",
    "submittedAt": "2026-04-15 13:05 UTC",
    "firstResponseHours": "2",
    "resolutionHours": "24",
    "agentName": "Fatima Al-Hassan",
    "agentEmail": "f.alhassan@support.example.com",
    "trackingUrl": "https://support.example.com/tickets/TKT-2026-083441"
};

final map<json> financialReportData = {
    "reportDate": "Q1 2026",
    "totalRevenue": "1250000.00",
    "netProfit": "312500.00",
    "marginPercent": "25.0"
};

final map<json> incidentReportP1Data = {
    "reportId": "INC-RPT-2026-00217",
    "classification": "CONFIDENTIAL",
    "status": "RESOLVED",
    "reportAuthor": "Wei Zhang",
    "createdAt": "2026-04-15 14:30:00",
    "lastUpdated": "2026-04-15 18:45:00",
    "incidentTitle": "Complete payment processing outage all transactions failing",
    "severity": "SEV-1",
    "priority": "P1",
    "incidentId": "INC-2026-04150091",
    "detectedAt": "2026-04-15 11:02:00",
    "resolvedAt": "2026-04-15 13:47:00",
    "durationMinutes": "165",
    "environment": "production",
    "affectedService": "payment-service, order-service, checkout-api",
    "oncallTeam": "Payments Platform",
    "incidentOwner": "Diego Alvarez",
    "isP1": true,
    "incidentCommander": "Sarah Kim",
    "warRoomChannel": "#inc-2026-04150091",
    "bridgeLine": "+1-800-555-0191 PIN: 847291",
    "affectedRegion": "us-east-1, eu-west-1",
    "affectedUserCount": "~84000",
    "peakErrorRate": "100",
    "peakLatencyMs": "30000",
    "sloLatencyMs": "500",
    "revenueImpact": "142000",
    "slaBreach": true,
    "slaBenchmark": "99.95% availability",
    "customerFacing": true,
    "dataLoss": false,
    "securityImpact": false,
    "rootCauseCategory": "Infrastructure - Database",
    "rootCause": "Primary RDS instance ran out of connection pool capacity after a connection leak was introduced in deploy v4.12.1, causing all new DB connections to be refused and transactions to fail with a timeout.",
    "contributingFactor1": "Connection leak in v4.12.1 not caught by pre-prod load tests",
    "contributingFactor2": "Connection pool exhaustion alert threshold set too high (95% instead of 75%)",
    "contributingFactor3": "Canary deployment skipped due to release timeline pressure",
    "triggerEvent": "Deployment of payment-service v4.12.1 at 10:58 UTC",
    "firstAlertSource": "Datadog synthetic monitor",
    "firstAlertTime": "2026-04-15 11:02:00",
    "detectionMethod": "Datadog synthetic monitor + PagerDuty page",
    "alertId": "ALT-20260415-00338",
    "firstAckAt": "2026-04-15 11:05:00",
    "firstResponder": "on-call engineer Diego Alvarez",
    "diagnosisAt": "2026-04-15 11:38:00",
    "rootCauseShort": "DB connection pool exhaustion from v4.12.1 leak",
    "mitigationAt": "2026-04-15 12:10:00",
    "mitigationAction": "Rolled back payment-service to v4.11.9",
    "reportedAt": "2026-04-15 14:30:00",
    "resolutionAction": "Rollback to v4.11.9 restored service; connection leak patched in v4.12.2",
    "rollbackPerformed": true,
    "rollbackVersion": "payment-service v4.11.9",
    "fixDeployed": true,
    "fixDescription": "Connection leak fix in v4.12.2",
    "fixDeployedAt": "2026-04-15 16:20:00",
    "monitoringStableAt": "2026-04-15 13:47:00",
    "ai001Owner": "Diego Alvarez",
    "ai001Due": "2026-04-22",
    "ai001Description": "Add connection leak detection to CI integration tests",
    "ai002Owner": "Maya Patel",
    "ai002Due": "2026-04-22",
    "ai002Description": "Reduce connection pool alert threshold from 95% to 75%",
    "ai003Owner": "Release Engineering",
    "ai003Due": "2026-04-29",
    "ai003Description": "Enforce canary deployment policy for all payment service changes",
    "ai004Owner": "Wei Zhang",
    "ai004Due": "2026-05-06",
    "ai004Description": "Add DB connection pool capacity to weekly capacity review",
    "wentWell": "Fast detection via synthetic monitors; clear war-room communication",
    "wentPoorly": "Connection leak slipped past pre-prod tests; canary skipped",
    "processGap": "No mandatory canary stage for payment-service deployments",
    "monitoringGap": "Connection pool utilization alert threshold was too permissive",
    "runbookCreated": true,
    "runbookUrl": "https://runbooks.example.com/payment-db-exhaustion",
    "postMortemDate": "2026-04-17 14:00:00",
    "postMortemOwner": "Diego Alvarez",
    "jiraEpic": "PAY-8821",
    "requiresExternalComms": true,
    "statusPageUpdated": true,
    "statusPageTime": "2026-04-15 11:15:00",
    "customerCommsSent": true,
    "customerCommsTime": "2026-04-15 12:00:00",
    "regulatoryNotify": false,
    "prCommsOwner": "Keiko Tanaka",
    "reportSignoff": "Sarah Kim (Incident Commander)",
    "signoffTime": "2026-04-15 18:45:00"
};

final map<json> incidentReportSev3Data = {
    "reportId": "INC-RPT-2026-00301",
    "classification": "INTERNAL",
    "status": "RESOLVED",
    "reportAuthor": "Lena Fischer",
    "createdAt": "2026-04-16 09:10:00",
    "lastUpdated": "2026-04-16 10:30:00",
    "incidentTitle": "Elevated error rate on report-generation service",
    "severity": "SEV-3",
    "priority": "P3",
    "incidentId": "INC-2026-04160044",
    "detectedAt": "2026-04-16 08:45:00",
    "resolvedAt": "2026-04-16 09:52:00",
    "durationMinutes": "67",
    "environment": "production",
    "affectedService": "report-service",
    "oncallTeam": "Analytics Platform",
    "incidentOwner": "Lena Fischer",
    "isP1": false,
    "affectedRegion": "us-west-2",
    "affectedUserCount": "~300",
    "peakErrorRate": "12",
    "peakLatencyMs": "8200",
    "sloLatencyMs": "2000",
    "revenueImpact": "0",
    "slaBreach": false,
    "customerFacing": false,
    "dataLoss": false,
    "securityImpact": false,
    "rootCauseCategory": "Application - Memory",
    "rootCause": "Report generation worker running OOM due to unbounded in-memory aggregation on large datasets.",
    "contributingFactor1": "No memory cap on aggregation pipeline",
    "contributingFactor2": "Dataset size increased 3x after new customer onboarded",
    "triggerEvent": "Large dataset export triggered by enterprise customer batch job",
    "firstAlertSource": "CloudWatch alarm",
    "firstAlertTime": "2026-04-16 08:45:00",
    "detectionMethod": "CloudWatch OOM alarm",
    "alertId": "ALT-20260416-00091",
    "firstAckAt": "2026-04-16 08:50:00",
    "firstResponder": "Lena Fischer",
    "diagnosisAt": "2026-04-16 09:05:00",
    "rootCauseShort": "OOM in aggregation pipeline for large datasets",
    "mitigationAt": "2026-04-16 09:20:00",
    "mitigationAction": "Restarted report workers and added per-job memory limit of 2 GB",
    "reportedAt": "2026-04-16 09:10:00",
    "resolutionAction": "Memory limit applied; streaming aggregation scheduled for next sprint",
    "rollbackPerformed": false,
    "fixDeployed": false,
    "fixTargetDate": "2026-04-30",
    "monitoringStableAt": "2026-04-16 09:52:00",
    "ai001Owner": "Lena Fischer",
    "ai001Due": "2026-04-30",
    "ai001Description": "Replace in-memory aggregation with streaming pipeline",
    "ai002Owner": "Lena Fischer",
    "ai002Due": "2026-04-23",
    "ai002Description": "Add per-job memory limit to report worker configuration",
    "ai003Owner": "Platform SRE",
    "ai003Due": "2026-04-23",
    "ai003Description": "Add OOM rate alert for report-service workers",
    "ai004Owner": "Lena Fischer",
    "ai004Due": "2026-04-30",
    "ai004Description": "Document dataset size limits in developer runbook",
    "wentWell": "Fast detection and diagnosis due to clear OOM signal",
    "wentPoorly": "No memory limits were defined for report workers",
    "processGap": "Large-dataset scenarios not covered in load testing",
    "monitoringGap": "No memory utilization trend alerting for report workers",
    "runbookCreated": false,
    "runbookDueDate": "2026-04-30",
    "postMortemDate": "2026-04-18 10:00:00",
    "postMortemOwner": "Lena Fischer",
    "jiraEpic": "ANA-3341",
    "requiresExternalComms": false,
    "reportSignoff": "Lena Fischer",
    "signoffTime": "2026-04-16 10:30:00"
};

final map<json> htmlEmailPremiumData = {
    "brandColor": "#4f46e5",
    "companyName": "NovaSpark",
    "planName": "Enterprise",
    "firstName": "Arjun",
    "lastName": "Sharma",
    "activatedDate": "April 24, 2026",
    "isPremium": true,
    "premiumFeatureCount": "47",
    "storageGb": "500",
    "supportSla": "1-hour",
    "username": "asharma",
    "email": "arjun.sharma@clientcorp.io",
    "accountId": "acc-00291847",
    "region": "AP Southeast",
    "timezone": "Asia/Kolkata (IST)",
    "hasApiAccess": true,
    "apiBaseUrl": "https://api.novaspark.io/v2",
    "apiVersion": "v2.3",
    "rateLimitRpm": "3000",
    "apiDocsUrl": "https://docs.novaspark.io/api",
    "loginUrl": "https://app.novaspark.io/login",
    "docsUrl": "https://docs.novaspark.io",
    "communityUrl": "https://community.novaspark.io",
    "dashboardUrl": "https://app.novaspark.io/dashboard",
    "maxTeamMembers": "unlimited",
    "supportHours": "24/7",
    "supportEmail": "enterprise@novaspark.io",
    "hasSupportPhone": true,
    "supportPhone": "+1-888-555-0100",
    "senderName": "Mia Chen",
    "senderTitle": "Head of Customer Success",
    "companyAddress": "101 Innovation Drive, San Francisco, CA 94105",
    "signupUrl": "https://novaspark.io/signup",
    "signupDate": "April 24, 2026",
    "unsubscribeUrl": "https://novaspark.io/unsubscribe",
    "privacyUrl": "https://novaspark.io/privacy",
    "termsUrl": "https://novaspark.io/terms",
    "statusUrl": "https://status.novaspark.io",
    "sentAt": "2026-04-24T07:00:00Z"
};

final map<json> htmlEmailFreeData = {
    "brandColor": "#0ea5e9",
    "companyName": "NovaSpark",
    "planName": "Free",
    "firstName": "Chloe",
    "lastName": "Dubois",
    "activatedDate": "April 24, 2026",
    "isPremium": false,
    "upgradeUrl": "https://novaspark.io/pricing",
    "username": "cdubois",
    "email": "chloe.dubois@example.fr",
    "accountId": "acc-00399124",
    "region": "EU West",
    "timezone": "Europe/Paris (CET)",
    "hasApiAccess": false,
    "loginUrl": "https://app.novaspark.io/login",
    "docsUrl": "https://docs.novaspark.io",
    "communityUrl": "https://community.novaspark.io",
    "dashboardUrl": "https://app.novaspark.io/dashboard",
    "maxTeamMembers": "3",
    "supportHours": "Mon-Fri 09:00-18:00 UTC",
    "supportEmail": "support@novaspark.io",
    "hasSupportPhone": false,
    "senderName": "Mia Chen",
    "senderTitle": "Head of Customer Success",
    "companyAddress": "101 Innovation Drive, San Francisco, CA 94105",
    "signupUrl": "https://novaspark.io/signup",
    "signupDate": "April 24, 2026",
    "unsubscribeUrl": "https://novaspark.io/unsubscribe",
    "privacyUrl": "https://novaspark.io/privacy",
    "termsUrl": "https://novaspark.io/terms",
    "statusUrl": "https://status.novaspark.io",
    "sentAt": "2026-04-24T07:00:00Z"
};

final map<json> releaseNotesBreakingData = {
    "productName": "Ballerina HTTP Module",
    "version": "3.0.0",
    "releaseDate": "2026-04-24",
    "releaseType": "Major",
    "isBreakingRelease": true,
    "migrationGuideUrl": "https://lib.ballerina.io/ballerina/http/migration/3.0.0",
    "releaseSummary": "Major release introducing a redesigned connection pooling API, native HTTP/3 support, and automatic TLS certificate rotation. Includes two breaking changes to the client configuration API.",
    "releaseManager": "Nuvindu Perera",
    "qaLead": "Pooja Iyer",
    "buildNumber": "2026.04.24.001",
    "gitTag": "v3.0.0",
    "commitSha": "9f3a1c8d",
    "artifactUrl": "https://dist.ballerina.io/artifacts/http-3.0.0.jar",
    "changelogUrl": "https://github.com/ballerina-platform/module-ballerina-http/blob/main/changelog.md",
    "milestoneUrl": "https://github.com/ballerina-platform/module-ballerina-http/milestone/42",
    "runtimeName": "Ballerina",
    "runtimeVersion": "2201.10.0",
    "dbCompatibility": "N/A",
    "apiCompatibility": "Incompatible with 2.x client configurations (see migration guide)",
    "minUpgradeVersion": "2.9.0",
    "feature1Title": "Native HTTP/3 and QUIC support",
    "feature1IssueId": "HTTP-7821",
    "feature1Description": "Full HTTP/3 over QUIC support with automatic protocol negotiation. Falls back to HTTP/2 when QUIC is unavailable.",
    "feature2Title": "Automatic TLS certificate rotation",
    "feature2IssueId": "HTTP-7654",
    "feature2Description": "Certificates are hot-reloaded from the configured path without restarting the listener. Supports Let's Encrypt ACME protocol.",
    "feature3Title": "Redesigned connection pool configuration API",
    "feature3IssueId": "HTTP-7400",
    "feature3Description": "New PoolConfig record with named fields replaces the positional constructor. Adds maxWaitTime, minEvictableIdleTime, and healthCheckInterval settings.",
    "hasFeature4": true,
    "feature4Title": "Request/response interceptor pipeline",
    "feature4IssueId": "HTTP-7299",
    "feature4Description": "Chainable interceptors for cross-cutting concerns such as auth, logging, and rate-limiting applied at the service level.",
    "improvement1": "Reduce default idle connection eviction time from 60s to 30s",
    "improvement1IssueId": "HTTP-7900",
    "improvement2": "Add detailed connection pool metrics to Prometheus exporter",
    "improvement2IssueId": "HTTP-7881",
    "improvement3": "Improve error messages for TLS handshake failures",
    "improvement3IssueId": "HTTP-7845",
    "improvement4": "Support chunked transfer encoding in client streaming mode",
    "improvement4IssueId": "HTTP-7812",
    "fix1Severity": "HIGH",
    "fix1Description": "Fix race condition causing sporadic NPE under concurrent pool resize",
    "fix1IssueId": "HTTP-7955",
    "fix2Severity": "HIGH",
    "fix2Description": "Fix memory leak when connections are forcibly closed during TLS renegotiation",
    "fix2IssueId": "HTTP-7933",
    "fix3Severity": "MEDIUM",
    "fix3Description": "Fix incorrect Content-Length header for compressed responses",
    "fix3IssueId": "HTTP-7871",
    "fix4Severity": "MEDIUM",
    "fix4Description": "Fix 431 status code not propagated to caller in HTTP/2 mode",
    "fix4IssueId": "HTTP-7850",
    "fix5Severity": "LOW",
    "fix5Description": "Fix missing newline in multipart boundary for certain MIME types",
    "fix5IssueId": "HTTP-7802",
    "hasKnownIssues": true,
    "ki1Severity": "MEDIUM",
    "ki1Description": "HTTP/3 handshake may fail on networks blocking UDP port 443",
    "ki1Workaround": "Set httpVersion to HTTP_2 in ClientConfiguration until QUIC fallback is enhanced",
    "ki1IssueId": "HTTP-8001",
    "hasKi2": true,
    "ki2Severity": "LOW",
    "ki2Description": "Certificate rotation triggers a brief 50ms latency spike per worker",
    "ki2Workaround": "Schedule rotation during low-traffic windows using cronExpression field",
    "ki2IssueId": "HTTP-8009",
    "breakingChange1": "PoolConfig constructor replaced by record literal syntax",
    "breakingChange1Action": "Replace http:PoolConfig(8, 2) with http:PoolConfig { maxConnections: 8, minIdleConnections: 2 }",
    "breakingChange2": "ClientConfiguration.poolConfig type changed from PoolConfig? to ConnectionPoolConfig",
    "breakingChange2Action": "Update imports and field assignment - see migration guide Section 2",
    "hasSecurityAdvisory": true,
    "advisorySeverity": "HIGH",
    "advisoryId": "BSEC-2026-0042",
    "advisoryTitle": "HTTP response splitting via unvalidated header injection",
    "advisoryCve": "CVE-2026-31887",
    "advisoryAffectedVersions": "2.x, 3.0.0-alpha through 3.0.0-rc3",
    "advisoryUrl": "https://security.ballerina.io/advisories/BSEC-2026-0042",
    "dep1Name": "netty",
    "dep1OldVersion": "4.1.107",
    "dep1NewVersion": "4.1.109",
    "dep2Name": "conscrypt",
    "dep2OldVersion": "2.5.2",
    "dep2NewVersion": "2.5.3",
    "dep3Name": "micrometer-core",
    "dep3OldVersion": "1.12.4",
    "dep3NewVersion": "1.12.5",
    "dep4Name": "jackson-databind",
    "dep4OldVersion": "2.16.1",
    "dep4NewVersion": "2.16.2",
    "contributors": "Nuvindu Perera, Pooja Iyer, Anjana Silva, TJ Jayawardana, Shafreen Anfar",
    "totalCommits": "118",
    "filesChanged": "247",
    "insertions": "8934",
    "deletions": "4201",
    "docsUrl": "https://lib.ballerina.io/ballerina/http/3.0.0",
    "issueTrackerUrl": "https://github.com/ballerina-platform/module-ballerina-http/issues",
    "communityUrl": "https://discord.gg/ballerinalang"
};

final map<json> purchaseOrderData = {
    "orderNumber": "PO-2026-00512",
    "customerName": "Acme Corp",
    "shipTo": "456 Office Park, Austin, TX 78701",
    "orderDate": "2026-04-15",
    "lineItems": [
        {"name": "Wireless Keyboard", "qty": "5", "unitPrice": "79.99", "lineTotal": "399.95"},
        {"name": "Ergonomic Mouse", "qty": "5", "unitPrice": "49.99", "lineTotal": "249.95"},
        {"name": "27-inch Monitor", "qty": "3", "unitPrice": "349.99", "lineTotal": "1049.97"},
        {"name": "USB-C Docking Station", "qty": "3", "unitPrice": "129.99", "lineTotal": "389.97"}
    ],
    "subtotal": "2089.84",
    "taxRate": "8.5",
    "taxAmount": "177.64",
    "totalDue": "2267.48",
    "notes": "Please deliver by April 22, 2026."
};

final map<json> flightBoardingData = {
    "passengerName": "Alice Johnson",
    "flightNumber": "UL 504",
    "origin": "CMB",
    "destination": "LHR",
    "gate": "B12",
    "seat": "14C",
    "cabinClass": "Economy",
    "boardingTime": "2026-04-15 14:30",
    "departureTime": "2026-04-15 15:00",
    "arrivalTime": "2026-04-15 23:45"
};

final map<json> releaseNotesPatchData = {
    "productName": "Ballerina HTTP Module",
    "version": "2.10.3",
    "releaseDate": "2026-04-10",
    "releaseType": "Patch",
    "isBreakingRelease": false,
    "releaseSummary": "Patch release fixing three high-priority bugs and updating security dependencies.",
    "releaseManager": "Anjana Silva",
    "qaLead": "Shafreen Anfar",
    "buildNumber": "2026.04.10.002",
    "gitTag": "v2.10.3",
    "commitSha": "c3f8a2d1",
    "artifactUrl": "https://dist.ballerina.io/artifacts/http-2.10.3.jar",
    "changelogUrl": "https://github.com/ballerina-platform/module-ballerina-http/blob/main/changelog.md",
    "milestoneUrl": "https://github.com/ballerina-platform/module-ballerina-http/milestone/40",
    "runtimeName": "Ballerina",
    "runtimeVersion": "2201.9.0",
    "dbCompatibility": "N/A",
    "apiCompatibility": "Fully compatible with 2.10.x",
    "minUpgradeVersion": "2.10.0",
    "feature1Title": "No new features in this patch",
    "feature1IssueId": "N/A",
    "feature1Description": "This is a bug-fix-only patch release.",
    "feature2Title": "N/A",
    "feature2IssueId": "N/A",
    "feature2Description": "N/A",
    "feature3Title": "N/A",
    "feature3IssueId": "N/A",
    "feature3Description": "N/A",
    "hasFeature4": false,
    "improvement1": "Update Netty to 4.1.109 for security patches",
    "improvement1IssueId": "HTTP-7988",
    "improvement2": "Improve connection close log message to include remote address",
    "improvement2IssueId": "HTTP-7971",
    "improvement3": "Reduce log level of routine keep-alive probe messages from WARN to DEBUG",
    "improvement3IssueId": "HTTP-7960",
    "fix1Severity": "HIGH",
    "fix1Description": "Fix NPE when response body is null in HTTP/2 trailers",
    "fix1IssueId": "HTTP-7999",
    "fix2Severity": "HIGH",
    "fix2Description": "Fix connection pool starvation under burst traffic with slow upstreams",
    "fix2IssueId": "HTTP-7991",
    "fix3Severity": "MEDIUM",
    "fix3Description": "Fix incorrect status code mapping for 308 Permanent Redirect",
    "fix3IssueId": "HTTP-7975",
    "fix4Severity": "LOW",
    "fix4Description": "Fix typo in log message for SSL certificate expiry warning",
    "fix4IssueId": "HTTP-7962",
    "fix5Severity": "LOW",
    "fix5Description": "Fix inconsistent line endings in HTTP header serialisation on Windows",
    "fix5IssueId": "HTTP-7951",
    "hasKnownIssues": false,
    "hasSecurityAdvisory": false,
    "dep1Name": "netty",
    "dep1OldVersion": "4.1.107",
    "dep1NewVersion": "4.1.109",
    "dep2Name": "conscrypt",
    "dep2OldVersion": "2.5.2",
    "dep2NewVersion": "2.5.2",
    "dep3Name": "micrometer-core",
    "dep3OldVersion": "1.12.4",
    "dep3NewVersion": "1.12.4",
    "dep4Name": "jackson-databind",
    "dep4OldVersion": "2.16.1",
    "dep4NewVersion": "2.16.1",
    "contributors": "Anjana Silva, Shafreen Anfar",
    "totalCommits": "12",
    "filesChanged": "28",
    "insertions": "334",
    "deletions": "97",
    "docsUrl": "https://lib.ballerina.io/ballerina/http/2.10.3",
    "issueTrackerUrl": "https://github.com/ballerina-platform/module-ballerina-http/issues",
    "communityUrl": "https://discord.gg/ballerinalang"
};

// ── Simple inline tests (no expected files needed) ───────────────────────────

@test:Config {}
function testSimpleRender() returns error? {
    string result = check render("Hello, ${name}!", {"name": "World"});
    test:assertEquals(result, "Hello, World!");
}

@test:Config {}
function testMultipleVariables() returns error? {
    string result = check render("${greeting}, ${name}! You are ${age} years old.",
                                  {"greeting": "Hi", "name": "Alice", "age": 30});
    test:assertEquals(result, "Hi, Alice! You are 30 years old.");
}

@test:Config {}
function testMissingVariable() returns error? {
    string result = check render("Hello, ${name}!", {});
    test:assertEquals(result, "Hello, !");
}

// ── File-based golden-output tests ───────────────────────────────────────────

@test:Config {}
function testOrderConfirmationEmail() returns error? {
    string result = check renderFromFile(RESOURCES + "order_confirmation.ftl", orderConfirmationData);
    string expected = check io:fileReadString(EXPECTED + "order_confirmation.txt");
    test:assertEquals(result, expected);
}

@test:Config {}
function testPasswordResetEmail() returns error? {
    string result = check renderFromFile(RESOURCES + "password_reset.ftl", passwordResetData);
    string expected = check io:fileReadString(EXPECTED + "password_reset.txt");
    test:assertEquals(result, expected);
}

@test:Config {}
function testDeploymentNotification() returns error? {
    string result = check renderFromFile(RESOURCES + "deployment_notification.ftl", deploymentNotificationData);
    string expected = check io:fileReadString(EXPECTED + "deployment_notification.txt");
    test:assertEquals(result, expected);
}

@test:Config {}
function testApiErrorResponseTemplate() returns error? {
    string result = check renderFromFile(RESOURCES + "api_error_response.ftl", apiErrorResponseData);
    string expected = check io:fileReadString(EXPECTED + "api_error_response.txt");
    test:assertEquals(result, expected);
}

@test:Config {}
function testDatabaseConfigTemplate() returns error? {
    string result = check renderFromFile(RESOURCES + "database_config.ftl", databaseConfigData);
    string expected = check io:fileReadString(EXPECTED + "database_config.txt");
    test:assertEquals(result, expected);
}

@test:Config {}
function testHttpAccessLogTemplate() returns error? {
    string result = check renderFromFile(RESOURCES + "http_access_log.ftl", httpAccessLogData);
    string expected = check io:fileReadString(EXPECTED + "http_access_log.txt");
    test:assertEquals(result, expected);
}

@test:Config {}
function testCiTestSummaryReport() returns error? {
    string result = check renderFromFile(RESOURCES + "ci_test_summary.ftl", ciTestSummaryData);
    string expected = check io:fileReadString(EXPECTED + "ci_test_summary.txt");
    test:assertEquals(result, expected);
}

@test:Config {}
function testInvoiceTemplate() returns error? {
    string result = check renderFromFile(RESOURCES + "invoice.ftl", invoiceData);
    string expected = check io:fileReadString(EXPECTED + "invoice.txt");
    test:assertEquals(result, expected);
}

@test:Config {}
function testKubernetesPodAnnotationTemplate() returns error? {
    string result = check renderFromFile(RESOURCES + "kubernetes_deployment.ftl", kubernetesDeploymentData);
    string expected = check io:fileReadString(EXPECTED + "kubernetes_deployment.txt");
    test:assertEquals(result, expected);
}

@test:Config {}
function testSecurityAlertTemplate() returns error? {
    string result = check renderFromFile(RESOURCES + "security_alert.ftl", securityAlertData);
    string expected = check io:fileReadString(EXPECTED + "security_alert.txt");
    test:assertEquals(result, expected);
}

@test:Config {}
function testNewsletterPremium() returns error? {
    string result = check renderFromFile(RESOURCES + "newsletter.ftl", newsletterPremiumData);
    string expected = check io:fileReadString(EXPECTED + "newsletter_premium.txt");
    test:assertEquals(result, expected);
}

@test:Config {}
function testNewsletterFree() returns error? {
    string result = check renderFromFile(RESOURCES + "newsletter.ftl", newsletterFreeData);
    string expected = check io:fileReadString(EXPECTED + "newsletter_free.txt");
    test:assertEquals(result, expected);
}

@test:Config {}
function testStructuredLogEntryTemplate() returns error? {
    string result = check renderFromFile(RESOURCES + "structured_log.ftl", structuredLogData);
    string expected = check io:fileReadString(EXPECTED + "structured_log.txt");
    test:assertEquals(result, expected);
}

@test:Config {}
function testOAuth2TokenIntrospectionTemplate() returns error? {
    string result = check renderFromFile(RESOURCES + "oauth2_introspection.ftl", oauth2IntrospectionData);
    string expected = check io:fileReadString(EXPECTED + "oauth2_introspection.txt");
    test:assertEquals(result, expected);
}

@test:Config {}
function testOnboardingEmailWithPhone() returns error? {
    string result = check renderFromFile(RESOURCES + "onboarding_email.ftl", onboardingEmailWithPhoneData);
    string expected = check io:fileReadString(EXPECTED + "onboarding_email_with_phone.txt");
    test:assertEquals(result, expected);
}

@test:Config {}
function testOnboardingEmailWithoutPhone() returns error? {
    string result = check renderFromFile(RESOURCES + "onboarding_email.ftl", onboardingEmailWithoutPhoneData);
    string expected = check io:fileReadString(EXPECTED + "onboarding_email_without_phone.txt");
    test:assertEquals(result, expected);
}

@test:Config {}
function testTerraformResourceSummaryTemplate() returns error? {
    string result = check renderFromFile(RESOURCES + "terraform_summary.ftl", terraformSummaryData);
    string expected = check io:fileReadString(EXPECTED + "terraform_summary.txt");
    test:assertEquals(result, expected);
}

@test:Config {}
function testSupportTicketAcknowledgement() returns error? {
    string result = check renderFromFile(RESOURCES + "support_ticket.ftl", supportTicketData);
    string expected = check io:fileReadString(EXPECTED + "support_ticket.txt");
    test:assertEquals(result, expected);
}

@test:Config {}
function testTemplateWithFreemarkerComment() returns error? {
    string result = check renderFromFile(RESOURCES + "financial_report.ftl", financialReportData);
    string expected = check io:fileReadString(EXPECTED + "financial_report.txt");
    test:assertEquals(result, expected);
}

@test:Config {}
function testIncidentReportFullP1() returns error? {
    string result = check renderFromFile(RESOURCES + "incident_report.ftl", incidentReportP1Data);
    string expected = check io:fileReadString(EXPECTED + "incident_report_p1.txt");
    test:assertEquals(result, expected);
}

@test:Config {}
function testIncidentReportSev3NoExternalComms() returns error? {
    string result = check renderFromFile(RESOURCES + "incident_report.ftl", incidentReportSev3Data);
    string expected = check io:fileReadString(EXPECTED + "incident_report_sev3.txt");
    test:assertEquals(result, expected);
}

@test:Config {}
function testHtmlWelcomeEmailPremium() returns error? {
    string result = check renderFromFile(RESOURCES + "html_welcome_email.ftl", htmlEmailPremiumData);
    string expected = check io:fileReadString(EXPECTED + "html_welcome_email_premium.txt");
    test:assertEquals(result, expected);
}

@test:Config {}
function testHtmlWelcomeEmailFreeTier() returns error? {
    string result = check renderFromFile(RESOURCES + "html_welcome_email.ftl", htmlEmailFreeData);
    string expected = check io:fileReadString(EXPECTED + "html_welcome_email_free.html");
    test:assertEquals(result, expected);
}

@test:Config {}
function testReleaseNotesBreakingWithAdvisory() returns error? {
    string result = check renderFromFile(RESOURCES + "release_notes.ftl", releaseNotesBreakingData);
    string expected = check io:fileReadString(EXPECTED + "release_notes_breaking.txt");
    test:assertEquals(result, expected);
}

@test:Config {}
function testReleaseNotesPatchNoAdvisory() returns error? {
    string result = check renderFromFile(RESOURCES + "release_notes.ftl", releaseNotesPatchData);
    string expected = check io:fileReadString(EXPECTED + "release_notes_patch.txt");
    test:assertEquals(result, expected);
}

@test:Config {}
function testPurchaseOrderTable() returns error? {
    string result = check renderFromFile(RESOURCES + "purchase_order.ftl", purchaseOrderData);
    string expected = check io:fileReadString(EXPECTED + "purchase_order.txt");
    test:assertEquals(result, expected);
}

@test:Config {}
function testDateFormatBuiltin() returns error? {
    string result = check render(
        "${boardingTime?datetime(\"yyyy-MM-dd HH:mm\")?string(\"EEE, MMM d · HH:mm\")}",
        {"boardingTime": "2026-04-15 14:30"}
    );
    test:assertEquals(result, "Wed, Apr 15 · 14:30");
}

@test:Config {}
function testFlightBoardingPassTemplate() returns error? {
    string result = check renderFromFile(RESOURCES + "flight_boarding.ftl", flightBoardingData);
    string expected = check io:fileReadString(EXPECTED + "flight_boarding.txt");
    test:assertEquals(result, expected);
}

// ── Expected-file generator ───────────────────────────────────────────────────
// Run once to create/refresh expected files, then set enable: false.

@test:Config {enable: false}
function generateExpectedFiles() returns error? {
    check io:fileWriteString(EXPECTED + "order_confirmation.txt",
        check renderFromFile(RESOURCES + "order_confirmation.ftl", orderConfirmationData));
    check io:fileWriteString(EXPECTED + "password_reset.txt",
        check renderFromFile(RESOURCES + "password_reset.ftl", passwordResetData));
    check io:fileWriteString(EXPECTED + "deployment_notification.txt",
        check renderFromFile(RESOURCES + "deployment_notification.ftl", deploymentNotificationData));
    check io:fileWriteString(EXPECTED + "api_error_response.txt",
        check renderFromFile(RESOURCES + "api_error_response.ftl", apiErrorResponseData));
    check io:fileWriteString(EXPECTED + "database_config.txt",
        check renderFromFile(RESOURCES + "database_config.ftl", databaseConfigData));
    check io:fileWriteString(EXPECTED + "http_access_log.txt",
        check renderFromFile(RESOURCES + "http_access_log.ftl", httpAccessLogData));
    check io:fileWriteString(EXPECTED + "ci_test_summary.txt",
        check renderFromFile(RESOURCES + "ci_test_summary.ftl", ciTestSummaryData));
    check io:fileWriteString(EXPECTED + "invoice.txt",
        check renderFromFile(RESOURCES + "invoice.ftl", invoiceData));
    check io:fileWriteString(EXPECTED + "kubernetes_deployment.txt",
        check renderFromFile(RESOURCES + "kubernetes_deployment.ftl", kubernetesDeploymentData));
    check io:fileWriteString(EXPECTED + "security_alert.txt",
        check renderFromFile(RESOURCES + "security_alert.ftl", securityAlertData));
    check io:fileWriteString(EXPECTED + "newsletter_premium.txt",
        check renderFromFile(RESOURCES + "newsletter.ftl", newsletterPremiumData));
    check io:fileWriteString(EXPECTED + "newsletter_free.txt",
        check renderFromFile(RESOURCES + "newsletter.ftl", newsletterFreeData));
    check io:fileWriteString(EXPECTED + "structured_log.txt",
        check renderFromFile(RESOURCES + "structured_log.ftl", structuredLogData));
    check io:fileWriteString(EXPECTED + "oauth2_introspection.txt",
        check renderFromFile(RESOURCES + "oauth2_introspection.ftl", oauth2IntrospectionData));
    check io:fileWriteString(EXPECTED + "onboarding_email_with_phone.txt",
        check renderFromFile(RESOURCES + "onboarding_email.ftl", onboardingEmailWithPhoneData));
    check io:fileWriteString(EXPECTED + "onboarding_email_without_phone.txt",
        check renderFromFile(RESOURCES + "onboarding_email.ftl", onboardingEmailWithoutPhoneData));
    check io:fileWriteString(EXPECTED + "terraform_summary.txt",
        check renderFromFile(RESOURCES + "terraform_summary.ftl", terraformSummaryData));
    check io:fileWriteString(EXPECTED + "support_ticket.txt",
        check renderFromFile(RESOURCES + "support_ticket.ftl", supportTicketData));
    check io:fileWriteString(EXPECTED + "financial_report.txt",
        check renderFromFile(RESOURCES + "financial_report.ftl", financialReportData));
    check io:fileWriteString(EXPECTED + "incident_report_p1.txt",
        check renderFromFile(RESOURCES + "incident_report.ftl", incidentReportP1Data));
    check io:fileWriteString(EXPECTED + "incident_report_sev3.txt",
        check renderFromFile(RESOURCES + "incident_report.ftl", incidentReportSev3Data));
    check io:fileWriteString(EXPECTED + "html_welcome_email_premium.txt",
        check renderFromFile(RESOURCES + "html_welcome_email.ftl", htmlEmailPremiumData));
    check io:fileWriteString(EXPECTED + "html_welcome_email_free.html",
        check renderFromFile(RESOURCES + "html_welcome_email.ftl", htmlEmailFreeData));
    check io:fileWriteString(EXPECTED + "release_notes_breaking.txt",
        check renderFromFile(RESOURCES + "release_notes.ftl", releaseNotesBreakingData));
    check io:fileWriteString(EXPECTED + "release_notes_patch.txt",
        check renderFromFile(RESOURCES + "release_notes.ftl", releaseNotesPatchData));
    check io:fileWriteString(EXPECTED + "flight_boarding.txt",
        check renderFromFile(RESOURCES + "flight_boarding.ftl", flightBoardingData));
    check io:fileWriteString(EXPECTED + "purchase_order.txt",
        check renderFromFile(RESOURCES + "purchase_order.ftl", purchaseOrderData));
}
