## Overview

The `ballerinax/freemarker` library provides a Ballerina interface to [Apache FreeMarker](https://freemarker.apache.org/), a Java-based template engine for generating text output (HTML, email, configuration files, source code, etc.) from templates and data.

### Key Features

- Render FreeMarker templates from inline strings using structured Ballerina data
- Load and render FreeMarker templates from `.ftl` files on the filesystem
- Full support for FreeMarker template syntax including variable interpolation, conditionals (`<#if>`), and iteration (`<#list>`)
- Pass any `record {|json...;|}` map directly as the template data context

## Quickstart

### Step 1: Import the module

```ballerina
import ballerinax/freemarker;
```

### Step 2: Invoke FreeMarker operations

#### Render a template string

Use `freemarker:render` to process an inline FreeMarker template:

```ballerina
import ballerina/io;

public function main() returns error? {
    string template = "Hello, ${name}! You have ${count} new messages.";
    string result = check freemarker:render(template, {"name": "Alice", "count": 5});
    io:println(result);
    // Output: Hello, Alice! You have 5 new messages.
}
```

#### Render a template from a file

Use `freemarker:renderFromFile` to load and process a `.ftl` template file:

```ballerina
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

<#if isPremiumMember?? && isPremiumMember>
Thank you for being a Premium member!
</#if>
```

## Examples

The [`examples`](https://github.com/ballerina-platform/module-ballerinax-freemarker/tree/main/examples) directory contains practical use cases:

- [**Order confirmation email**](https://github.com/ballerina-platform/module-ballerinax-freemarker/tree/main/examples/order-confirmation-email) — Generates a formatted order confirmation email using variable interpolation, list iteration, and conditional blocks.
