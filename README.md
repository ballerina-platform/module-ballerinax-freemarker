# Ballerina FreeMarker Library

[![Build](https://github.com/ballerina-platform/module-ballerina-freemarker/actions/workflows/build-timestamped-master.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerina-freemarker/actions/workflows/build-timestamped-master.yml)
[![Trivy](https://github.com/ballerina-platform/module-ballerina-freemarker/actions/workflows/trivy-scan.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerina-freemarker/actions/workflows/trivy-scan.yml)
[![GraalVM Check](https://github.com/ballerina-platform/module-ballerina-freemarker/actions/workflows/build-with-bal-test-graalvm.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerina-freemarker/actions/workflows/build-with-bal-test-graalvm.yml)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/ballerina-platform/module-ballerina-freemarker.svg)](https://github.com/ballerina-platform/module-ballerina-freemarker/commits/main)
[![Github issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-library/module/freemarker.svg?label=Open%20Issues)](https://github.com/ballerina-platform/ballerina-library/labels/module%2Ffreemarker)

This library provides a Ballerina interface to [Apache FreeMarker](https://freemarker.apache.org/), a Java-based template engine for generating text output (HTML, email, configuration files, source code, etc.) from templates and data.

## Overview

The `ballerina/freemarker` library exposes two core functions:

- **`render`** — renders a FreeMarker template string with a provided data context.
- **`renderFromFile`** — renders a FreeMarker template loaded from a `.ftl` file.

Both functions accept a `record {|json...;|}` data map, making it straightforward to pass structured Ballerina data into your templates.

## Quickstart

### Render a template string

```ballerina
import ballerina/freemarker;
import ballerina/io;

public function main() returns error? {
    string template = "Hello, ${name}! You have ${count} new messages.";
    string result = check freemarker:render(template, {name: "Alice", count: 5});
    io:println(result);
    // Output: Hello, Alice! You have 5 new messages.
}
```

### Render a template from a file

```ballerina
import ballerina/freemarker;
import ballerina/io;

public function main() returns error? {
    map<json> data = {
        "customerName": "Bob",
        "orderId": "ORD-001",
        "total": "49.99"
    };
    string result = check freemarker:renderFromFile("templates/order.ftl", data);
    io:println(result);
}
```

### FreeMarker template syntax

FreeMarker templates support variable interpolation, conditionals, and loops:

```
Dear ${customerName},

Your order ${orderId} has been confirmed.

Items:
<#list items as item>
  - ${item.name} x${item.qty} @ $${item.unitPrice}
</#list>

<#if isPremiumMember>
You earned ${rewardPoints} reward points on this purchase!
</#if>

Total: $${total}
```

## Examples

The [`examples`](https://github.com/ballerina-platform/module-ballerina-freemarker/tree/main/examples) directory contains practical use cases:

- [**Order confirmation email**](https://github.com/ballerina-platform/module-ballerina-freemarker/tree/main/examples/order-confirmation-email) — Generates a formatted order confirmation email using variable interpolation, list iteration, and conditional blocks.

## Issues and projects

Issues and project are tracked under the Ballerina library [GitHub issues](https://github.com/ballerina-platform/ballerina-library/issues) repository.

To report bugs and request new features, create a GitHub issue with the label `module/freemarker`.

## Build from the source

### Prerequisites

1. Download and install Java SE Development Kit (JDK) version 21. You can download it from either of the following sources:
   - [Oracle JDK](https://www.oracle.com/java/technologies/downloads/)
   - [OpenJDK](https://adoptium.net/)

   > **Note:** Set the `JAVA_HOME` environment variable to the path name of the directory into which you installed JDK.

2. Download and install [Ballerina Swan Lake](https://ballerina.io/).

### Build options

Execute the commands from the repository root.

1. To build the package:

   ```bash
   ./gradlew clean build
   ```

2. To run the tests:

   ```bash
   ./gradlew clean test
   ```

3. To build without the tests:

   ```bash
   ./gradlew clean build -x test
   ```

4. To run only specific tests:

   ```bash
   ./gradlew clean build -run-with-native
   ```

5. To debug the package with a remote debugger:

   ```bash
   ./gradlew clean build -Pdebug=<port>
   ```

6. To debug with the Ballerina language:

   ```bash
   ./gradlew clean build -PbalJavaDebug=<port>
   ```

7. Publish the generated artifacts to the local Ballerina Central:

   ```bash
   ./gradlew clean build -PpublishToLocalCentral=true
   ```

8. Publish the generated artifacts to the Ballerina Central:

   ```bash
   ./gradlew clean build -PpublishToCentral=true
   ```

## Contribute to Ballerina

As an open-source project, Ballerina welcomes contributions from the community.

For more information, go to the [contribution guidelines](https://github.com/ballerina-platform/ballerina-lang/blob/master/CONTRIBUTING.md).

## Code of conduct

All the contributors are encouraged to read the [Ballerina Code of Conduct](https://ballerina.io/code-of-conduct).

## Useful links

- For more information go to the [`freemarker` library](https://lib.ballerina.io/ballerina/freemarker/latest).
- For example demonstrations of the usage, go to [Ballerina By Example](https://ballerina.io/learn/by-example/).
- Chat live with us via our [Discord server](https://discord.gg/ballerinalang).
- Post all technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.
