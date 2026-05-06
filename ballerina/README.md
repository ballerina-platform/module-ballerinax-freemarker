## Overview

The `ballerina/freemarker` library provides a Ballerina interface to [Apache FreeMarker](https://freemarker.apache.org/), a Java-based template engine for generating text output such as HTML pages, email bodies, configuration files, and source code from templates and data models.

This library supports GraalVM native image compilation.

## Quickstart

### Add the dependency

Add the `ballerina/freemarker` library as a dependency in your `Ballerina.toml`:

```toml
[dependencies]
"ballerina/freemarker" = "0.1.0"
```

### Render a template string

Use `freemarker:render` to process an inline FreeMarker template:

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

Use `freemarker:renderFromFile` to load and process a `.ftl` template file:

```ballerina
import ballerina/freemarker;
import ballerina/io;

public function main() returns error? {
    map<json> data = {
        "customerName": "Bob",
        "orderId": "ORD-001",
        "items": [
            {"name": "Widget", "qty": "2", "unitPrice": "9.99"}
        ],
        "total": "19.98"
    };
    string result = check freemarker:renderFromFile("templates/invoice.ftl", data);
    io:println(result);
}
```

### FreeMarker template syntax

FreeMarker templates use `${...}` for variable interpolation, `<#if>` for conditionals, and `<#list>` for iteration:

```
Dear ${customerName},

Your order ${orderId} is confirmed.

Items purchased:
<#list items as item>
  ${item.name} — Qty: ${item.qty} @ $${item.unitPrice}
</#list>

Order total: $${total}

<#if isPremiumMember>
Thank you for being a Premium member!
</#if>
```

## API

### `render`

```ballerina
public isolated function render(string template, record {|json...;|} data) returns string|Error
```

Renders a FreeMarker template string with the provided data context.

| Parameter  | Type                    | Description                                          |
|------------|-------------------------|------------------------------------------------------|
| `template` | `string`                | FreeMarker template string                           |
| `data`     | `record {|json...;|}`   | Key-value pairs used as the data context             |
| **return** | `string\|Error`         | Rendered string output, or an `Error` on failure     |

### `renderFromFile`

```ballerina
public isolated function renderFromFile(string templatePath, record {|json...;|} data) returns string|Error
```

Renders a FreeMarker template loaded from a file.

| Parameter      | Type                    | Description                                          |
|----------------|-------------------------|------------------------------------------------------|
| `templatePath` | `string`                | Path to the `.ftl` template file                     |
| `data`         | `record {|json...;|}`   | Key-value pairs used as the data context             |
| **return**     | `string\|Error`         | Rendered string output, or an `Error` on failure     |

## Report issues

To report bugs and request new features, raise a GitHub issue in the [Ballerina Library](https://github.com/ballerina-platform/ballerina-library/issues) repository with the label `module/freemarker`.
