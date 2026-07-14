// Copyright (c) 2026, WSO2 LLC. (http://www.wso2.com).
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
const DATA = "tests/resources/data/";

function readData(string filename) returns map<json>|error {
    json data = check io:fileReadJson(DATA + filename);
    return <map<json>>data;
}

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
    string result = check render("Hello, ${name!}!", {});
    test:assertEquals(result, "Hello, !");
}

// ── File-based golden-output tests ───────────────────────────────────────────

@test:Config {}
function testOrderConfirmationEmail() returns error? {
    string result = check renderFromFile(RESOURCES + "order_confirmation.ftl", check readData("order_confirmation.json"));
    string expected = check io:fileReadString(EXPECTED + "order_confirmation.txt") + "\n";
    test:assertEquals(result, expected);
}

@test:Config {}
function testPasswordResetEmail() returns error? {
    string result = check renderFromFile(RESOURCES + "password_reset.ftl", check readData("password_reset.json"));
    string expected = check io:fileReadString(EXPECTED + "password_reset.txt") + "\n";
    test:assertEquals(result, expected);
}

@test:Config {}
function testDeploymentNotification() returns error? {
    string result = check renderFromFile(RESOURCES + "deployment_notification.ftl", check readData("deployment_notification.json"));
    string expected = check io:fileReadString(EXPECTED + "deployment_notification.txt") + "\n";
    test:assertEquals(result, expected);
}

@test:Config {}
function testApiErrorResponseTemplate() returns error? {
    string result = check renderFromFile(RESOURCES + "api_error_response.ftl", check readData("api_error_response.json"));
    string expected = check io:fileReadString(EXPECTED + "api_error_response.txt") + "\n";
    test:assertEquals(result, expected);
}

@test:Config {}
function testDatabaseConfigTemplate() returns error? {
    string result = check renderFromFile(RESOURCES + "database_config.ftl", check readData("database_config.json"));
    string expected = check io:fileReadString(EXPECTED + "database_config.txt") + "\n";
    test:assertEquals(result, expected);
}

@test:Config {}
function testHttpAccessLogTemplate() returns error? {
    string result = check renderFromFile(RESOURCES + "http_access_log.ftl", check readData("http_access_log.json"));
    string expected = check io:fileReadString(EXPECTED + "http_access_log.txt") + "\n";
    test:assertEquals(result, expected);
}

@test:Config {}
function testCiTestSummaryReport() returns error? {
    string result = check renderFromFile(RESOURCES + "ci_test_summary.ftl", check readData("ci_test_summary.json"));
    string expected = check io:fileReadString(EXPECTED + "ci_test_summary.txt") + "\n";
    test:assertEquals(result, expected);
}

@test:Config {}
function testInvoiceTemplate() returns error? {
    string result = check renderFromFile(RESOURCES + "invoice.ftl", check readData("invoice.json"));
    string expected = check io:fileReadString(EXPECTED + "invoice.txt") + "\n";
    test:assertEquals(result, expected);
}

@test:Config {}
function testKubernetesPodAnnotationTemplate() returns error? {
    string result = check renderFromFile(RESOURCES + "kubernetes_deployment.ftl", check readData("kubernetes_deployment.json"));
    string expected = check io:fileReadString(EXPECTED + "kubernetes_deployment.txt") + "\n";
    test:assertEquals(result, expected);
}

@test:Config {}
function testSecurityAlertTemplate() returns error? {
    string result = check renderFromFile(RESOURCES + "security_alert.ftl", check readData("security_alert.json"));
    string expected = check io:fileReadString(EXPECTED + "security_alert.txt") + "\n";
    test:assertEquals(result, expected);
}

@test:Config {}
function testNewsletterPremium() returns error? {
    string result = check renderFromFile(RESOURCES + "newsletter.ftl", check readData("newsletter_premium.json"));
    string expected = check io:fileReadString(EXPECTED + "newsletter_premium.txt") + "\n";
    test:assertEquals(result, expected);
}

@test:Config {}
function testNewsletterFree() returns error? {
    string result = check renderFromFile(RESOURCES + "newsletter.ftl", check readData("newsletter_free.json"));
    string expected = check io:fileReadString(EXPECTED + "newsletter_free.txt") + "\n";
    test:assertEquals(result, expected);
}

@test:Config {}
function testStructuredLogEntryTemplate() returns error? {
    string result = check renderFromFile(RESOURCES + "structured_log.ftl", check readData("structured_log.json"));
    string expected = check io:fileReadString(EXPECTED + "structured_log.txt") + "\n";
    test:assertEquals(result, expected);
}

@test:Config {}
function testOAuth2TokenIntrospectionTemplate() returns error? {
    string result = check renderFromFile(RESOURCES + "oauth2_introspection.ftl", check readData("oauth2_introspection.json"));
    string expected = check io:fileReadString(EXPECTED + "oauth2_introspection.txt") + "\n";
    test:assertEquals(result, expected);
}

@test:Config {}
function testOnboardingEmailWithPhone() returns error? {
    string result = check renderFromFile(RESOURCES + "onboarding_email.ftl", check readData("onboarding_email_with_phone.json"));
    string expected = check io:fileReadString(EXPECTED + "onboarding_email_with_phone.txt") + "\n";
    test:assertEquals(result, expected);
}

@test:Config {}
function testOnboardingEmailWithoutPhone() returns error? {
    string result = check renderFromFile(RESOURCES + "onboarding_email.ftl", check readData("onboarding_email_without_phone.json"));
    string expected = check io:fileReadString(EXPECTED + "onboarding_email_without_phone.txt") + "\n";
    test:assertEquals(result, expected);
}

@test:Config {}
function testTerraformResourceSummaryTemplate() returns error? {
    string result = check renderFromFile(RESOURCES + "terraform_summary.ftl", check readData("terraform_summary.json"));
    string expected = check io:fileReadString(EXPECTED + "terraform_summary.txt") + "\n";
    test:assertEquals(result, expected);
}

@test:Config {}
function testSupportTicketAcknowledgement() returns error? {
    string result = check renderFromFile(RESOURCES + "support_ticket.ftl", check readData("support_ticket.json"));
    string expected = check io:fileReadString(EXPECTED + "support_ticket.txt") + "\n";
    test:assertEquals(result, expected);
}

@test:Config {}
function testTemplateWithFreemarkerComment() returns error? {
    string result = check renderFromFile(RESOURCES + "financial_report.ftl", check readData("financial_report.json"));
    string expected = check io:fileReadString(EXPECTED + "financial_report.txt") + "\n";
    test:assertEquals(result, expected);
}

@test:Config {}
function testIncidentReportFullP1() returns error? {
    string result = check renderFromFile(RESOURCES + "incident_report.ftl", check readData("incident_report_p1.json"));
    string expected = check io:fileReadString(EXPECTED + "incident_report_p1.txt") + "\n";
    test:assertEquals(result, expected);
}

@test:Config {}
function testIncidentReportSev3NoExternalComms() returns error? {
    string result = check renderFromFile(RESOURCES + "incident_report.ftl", check readData("incident_report_sev3.json"));
    string expected = check io:fileReadString(EXPECTED + "incident_report_sev3.txt") + "\n";
    test:assertEquals(result, expected);
}

@test:Config {}
function testHtmlWelcomeEmailPremium() returns error? {
    string result = check renderFromFile(RESOURCES + "html_welcome_email.ftl", check readData("html_welcome_email_premium.json"));
    string expected = check io:fileReadString(EXPECTED + "html_welcome_email_premium.html") + "\n";
    test:assertEquals(result, expected);
}

@test:Config {}
function testHtmlWelcomeEmailFreeTier() returns error? {
    string result = check renderFromFile(RESOURCES + "html_welcome_email.ftl", check readData("html_welcome_email_free.json"));
    string expected = check io:fileReadString(EXPECTED + "html_welcome_email_free.html") + "\n";
    test:assertEquals(result, expected);
}

@test:Config {}
function testReleaseNotesBreakingWithAdvisory() returns error? {
    string result = check renderFromFile(RESOURCES + "release_notes.ftl", check readData("release_notes_breaking.json"));
    string expected = check io:fileReadString(EXPECTED + "release_notes_breaking.txt") + "\n";
    test:assertEquals(result, expected);
}

@test:Config {}
function testReleaseNotesPatchNoAdvisory() returns error? {
    string result = check renderFromFile(RESOURCES + "release_notes.ftl", check readData("release_notes_patch.json"));
    string expected = check io:fileReadString(EXPECTED + "release_notes_patch.txt") + "\n";
    test:assertEquals(result, expected);
}

@test:Config {}
function testPurchaseOrderTable() returns error? {
    string result = check renderFromFile(RESOURCES + "purchase_order.ftl", check readData("purchase_order.json"));
    string expected = check io:fileReadString(EXPECTED + "purchase_order.txt") + "\n";
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
    string result = check renderFromFile(RESOURCES + "flight_boarding.ftl", check readData("flight_boarding.json"));
    string expected = check io:fileReadString(EXPECTED + "flight_boarding.txt") + "\n";
    test:assertEquals(result, expected);
}

@test:Config {}
function testIncludeWithPartial() returns error? {
    string result = check renderFromFile(RESOURCES + "include_with_partial.ftl", check readData("include_with_partial.json"));
    string expected = check io:fileReadString(EXPECTED + "include_with_partial.txt") + "\n";
    test:assertEquals(result, expected);
}

@test:Config {}
function testImportMacros() returns error? {
    string result = check renderFromFile(RESOURCES + "import_macros.ftl", check readData("import_macros.json"));
    string expected = check io:fileReadString(EXPECTED + "import_macros.txt") + "\n";
    test:assertEquals(result, expected);
}

@test:Config {}
function testNestedInclude() returns error? {
    string result = check renderFromFile(RESOURCES + "nested_include.ftl", check readData("nested_include.json"));
    string expected = check io:fileReadString(EXPECTED + "nested_include.txt") + "\n";
    test:assertEquals(result, expected);
}

@test:Config {}
function testMissingPartialReturnsError() {
    string|Error result = renderFromFile(RESOURCES + "broken_include.ftl", {});
    test:assertTrue(result is Error);
}

// ── Expected-file generator ───────────────────────────────────────────────────
// Run once to create/refresh expected files, then set enable: false.

@test:Config {enable: false}
function generateExpectedFiles() returns error? {
    check io:fileWriteString(EXPECTED + "order_confirmation.txt",
        check renderFromFile(RESOURCES + "order_confirmation.ftl", check readData("order_confirmation.json")));
    check io:fileWriteString(EXPECTED + "password_reset.txt",
        check renderFromFile(RESOURCES + "password_reset.ftl", check readData("password_reset.json")));
    check io:fileWriteString(EXPECTED + "deployment_notification.txt",
        check renderFromFile(RESOURCES + "deployment_notification.ftl", check readData("deployment_notification.json")));
    check io:fileWriteString(EXPECTED + "api_error_response.txt",
        check renderFromFile(RESOURCES + "api_error_response.ftl", check readData("api_error_response.json")));
    check io:fileWriteString(EXPECTED + "database_config.txt",
        check renderFromFile(RESOURCES + "database_config.ftl", check readData("database_config.json")));
    check io:fileWriteString(EXPECTED + "http_access_log.txt",
        check renderFromFile(RESOURCES + "http_access_log.ftl", check readData("http_access_log.json")));
    check io:fileWriteString(EXPECTED + "ci_test_summary.txt",
        check renderFromFile(RESOURCES + "ci_test_summary.ftl", check readData("ci_test_summary.json")));
    check io:fileWriteString(EXPECTED + "invoice.txt",
        check renderFromFile(RESOURCES + "invoice.ftl", check readData("invoice.json")));
    check io:fileWriteString(EXPECTED + "kubernetes_deployment.txt",
        check renderFromFile(RESOURCES + "kubernetes_deployment.ftl", check readData("kubernetes_deployment.json")));
    check io:fileWriteString(EXPECTED + "security_alert.txt",
        check renderFromFile(RESOURCES + "security_alert.ftl", check readData("security_alert.json")));
    check io:fileWriteString(EXPECTED + "newsletter_premium.txt",
        check renderFromFile(RESOURCES + "newsletter.ftl", check readData("newsletter_premium.json")));
    check io:fileWriteString(EXPECTED + "newsletter_free.txt",
        check renderFromFile(RESOURCES + "newsletter.ftl", check readData("newsletter_free.json")));
    check io:fileWriteString(EXPECTED + "structured_log.txt",
        check renderFromFile(RESOURCES + "structured_log.ftl", check readData("structured_log.json")));
    check io:fileWriteString(EXPECTED + "oauth2_introspection.txt",
        check renderFromFile(RESOURCES + "oauth2_introspection.ftl", check readData("oauth2_introspection.json")));
    check io:fileWriteString(EXPECTED + "onboarding_email_with_phone.txt",
        check renderFromFile(RESOURCES + "onboarding_email.ftl", check readData("onboarding_email_with_phone.json")));
    check io:fileWriteString(EXPECTED + "onboarding_email_without_phone.txt",
        check renderFromFile(RESOURCES + "onboarding_email.ftl", check readData("onboarding_email_without_phone.json")));
    check io:fileWriteString(EXPECTED + "terraform_summary.txt",
        check renderFromFile(RESOURCES + "terraform_summary.ftl", check readData("terraform_summary.json")));
    check io:fileWriteString(EXPECTED + "support_ticket.txt",
        check renderFromFile(RESOURCES + "support_ticket.ftl", check readData("support_ticket.json")));
    check io:fileWriteString(EXPECTED + "financial_report.txt",
        check renderFromFile(RESOURCES + "financial_report.ftl", check readData("financial_report.json")));
    check io:fileWriteString(EXPECTED + "incident_report_p1.txt",
        check renderFromFile(RESOURCES + "incident_report.ftl", check readData("incident_report_p1.json")));
    check io:fileWriteString(EXPECTED + "incident_report_sev3.txt",
        check renderFromFile(RESOURCES + "incident_report.ftl", check readData("incident_report_sev3.json")));
    check io:fileWriteString(EXPECTED + "html_welcome_email_premium.html",
        check renderFromFile(RESOURCES + "html_welcome_email.ftl", check readData("html_welcome_email_premium.json")));
    check io:fileWriteString(EXPECTED + "html_welcome_email_free.html",
        check renderFromFile(RESOURCES + "html_welcome_email.ftl", check readData("html_welcome_email_free.json")));
    check io:fileWriteString(EXPECTED + "release_notes_breaking.txt",
        check renderFromFile(RESOURCES + "release_notes.ftl", check readData("release_notes_breaking.json")));
    check io:fileWriteString(EXPECTED + "release_notes_patch.txt",
        check renderFromFile(RESOURCES + "release_notes.ftl", check readData("release_notes_patch.json")));
    check io:fileWriteString(EXPECTED + "flight_boarding.txt",
        check renderFromFile(RESOURCES + "flight_boarding.ftl", check readData("flight_boarding.json")));
    check io:fileWriteString(EXPECTED + "purchase_order.txt",
        check renderFromFile(RESOURCES + "purchase_order.ftl", check readData("purchase_order.json")));
    check io:fileWriteString(EXPECTED + "include_with_partial.txt",
        check renderFromFile(RESOURCES + "include_with_partial.ftl", check readData("include_with_partial.json")));
    check io:fileWriteString(EXPECTED + "import_macros.txt",
        check renderFromFile(RESOURCES + "import_macros.ftl", check readData("import_macros.json")));
    check io:fileWriteString(EXPECTED + "nested_include.txt",
        check renderFromFile(RESOURCES + "nested_include.ftl", check readData("nested_include.json")));
}
