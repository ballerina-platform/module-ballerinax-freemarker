## Overview

The `ballerina/freemarker` library provides a Ballerina interface to [Apache FreeMarker](https://freemarker.apache.org/), a Java-based template engine for generating text output (HTML, email, configuration files, source code, etc.) from templates and data.

This library supports GraalVM native image compilation.

It exposes two core functions:

- **`render`** — renders a FreeMarker template string with a provided data context.
- **`renderFromFile`** — renders a FreeMarker template loaded from a `.ftl` file.

Both functions accept a `record {|json...;|}` data map, making it straightforward to pass structured Ballerina data into your templates.

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

```ftl
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

- `template` (`string`) — FreeMarker template string
- `data` (`record {|json...;|}`) — Key-value pairs used as the data context
- **return** (`string|Error`) — Rendered string output, or an `Error` on failure

### `renderFromFile`

```ballerina
public isolated function renderFromFile(string templatePath, record {|json...;|} data) returns string|Error
```

Renders a FreeMarker template loaded from a file.

- `templatePath` (`string`) — Path to the `.ftl` template file
- `data` (`record {|json...;|}`) — Key-value pairs used as the data context
- **return** (`string|Error`) — Rendered string output, or an `Error` on failure

## Examples

The [`examples`](https://github.com/ballerina-platform/module-ballerinax-freemarker/tree/main/examples) directory contains practical use cases:

- [**Order confirmation email**](https://github.com/ballerina-platform/module-ballerinax-freemarker/tree/main/examples/order-confirmation-email) — Generates a formatted order confirmation email using variable interpolation, list iteration, and conditional blocks.
