# Specification: Ballerina FreeMarker Library

_Authors_: @Nuvindu \
_Reviewers_:  \
_Created_: 2026/08/11 \
_Updated_: 2026/08/11 \
_Edition_: Swan Lake

## Introduction

The Ballerina FreeMarker module provides a Ballerina interface to [Apache FreeMarker](https://freemarker.apache.org/), a Java-based template engine for generating text output (HTML, email, configuration files, source code, etc.) from templates and structured data.

The FreeMarker library specification has evolved and may continue to evolve in the future. The released versions of the specification can be found under the relevant GitHub tag.

If you have any feedback or suggestions about the library, start a discussion via a [GitHub issue](https://github.com/ballerina-platform/ballerina-library/issues) or in the [Discord server](https://discord.gg/ballerinalang). Based on the outcome of the discussion, the specification and implementation can be updated. Community feedback is always welcome. Any accepted proposal, which affects the specification is stored under `/docs/proposals`. Proposals under discussion can be found with the label `type/proposal` in GitHub.

The conforming implementation of the specification is released and included in the distribution. Any deviation from the specification is considered a bug.

## Contents

1. [Overview](#1-overview)
2. [Render a template string](#2-render-a-template-string)
    * 2.1 [The `render` API](#21-the-render-api)
        * 2.1.1 [API parameters](#211-api-parameters)
            * 2.1.1.1 [The `template` parameter](#2111-the-template-parameter)
            * 2.1.1.2 [The `data` parameter](#2112-the-data-parameter)
        * 2.1.2 [Return type](#212-return-type)
3. [Render a template from a file](#3-render-a-template-from-a-file)
    * 3.1 [The `renderFromFile` API](#31-the-renderfromfile-api)
        * 3.1.1 [API parameters](#311-api-parameters)
            * 3.1.1.1 [The `templatePath` parameter](#3111-the-templatepath-parameter)
            * 3.1.1.2 [The `data` parameter](#3112-the-data-parameter)
        * 3.1.2 [Return type](#312-return-type)
4. [Data mapping](#4-data-mapping)
    * 4.1 [Map Ballerina types to FreeMarker types](#41-map-ballerina-types-to-freemarker-types)
5. [Template syntax support](#5-template-syntax-support)
    * 5.1 [Variable interpolation](#51-variable-interpolation)
    * 5.2 [Conditionals](#52-conditionals)
    * 5.3 [Iteration](#53-iteration)
    * 5.4 [Include directives](#54-include-directives)
    * 5.5 [Macros](#55-macros)
6. [The `freemarker:Error` type](#6-the-freemarkererror-type)

## 1. Overview

This specification elaborates on rendering [Apache FreeMarker](https://freemarker.apache.org/) templates using structured Ballerina data, either from inline template strings or from `.ftl` template files on the filesystem.

The FreeMarker module provides the following functionalities.

1. Render a FreeMarker template string with a given data context
2. Render a FreeMarker template loaded from a file with a given data context

All templates are rendered using the English (`en`) locale to ensure consistent number and date formatting regardless of the host machine's system locale.

## 2. Render a template string

This section describes the details of rendering an inline FreeMarker template string with structured data.

### 2.1 The `render` API

The `render` API can be used to process an inline FreeMarker template string with a given data context.

```ballerina
string result = check freemarker:render("Hello, ${name}!", {"name": "Alice"});
```

#### 2.1.1 API parameters

##### 2.1.1.1 The `template` parameter

The `template` parameter accepts a FreeMarker template as a `string`. The template can use standard FreeMarker syntax including variable interpolation (`${...}`), conditionals (`<#if>`), iteration (`<#list>`), includes, macros, and built-in functions.

##### 2.1.1.2 The `data` parameter

The `data` parameter accepts a `record {|json...;|}` value containing key-value pairs that serve as the data context for template rendering. The keys in the record correspond to variable names used in the template.

```ballerina
record {|json...;|} data = {
    "name": "Alice",
    "count": 5,
    "isPremium": true
};
string result = check freemarker:render(template, data);
```

#### 2.1.2 Return type

The function returns a `string` containing the rendered output or a `freemarker:Error` if the template rendering fails (e.g., due to syntax errors in the template or missing required variables).

## 3. Render a template from a file

This section describes the details of rendering a FreeMarker template loaded from a `.ftl` file.

### 3.1 The `renderFromFile` API

The `renderFromFile` API can be used to load a FreeMarker template from a file and render it with a given data context.

```ballerina
string result = check freemarker:renderFromFile("templates/invoice.ftl", data);
```

#### 3.1.1 API parameters

##### 3.1.1.1 The `templatePath` parameter

The `templatePath` parameter accepts a `string` representing the filesystem path to the FreeMarker template file. The file typically has a `.ftl` extension.

##### 3.1.1.2 The `data` parameter

The `data` parameter accepts a `record {|json...;|}` value containing key-value pairs that serve as the data context for template rendering. This behaves identically to the `data` parameter in the [`render`](#2112-the-data-parameter) API.

```ballerina
map<json> data = {
    "customerName": "Bob",
    "orderId": "ORD-001",
    "items": [
        {"name": "Widget", "qty": "2", "unitPrice": "9.99"}
    ],
    "total": "19.98"
};
string result = check freemarker:renderFromFile("templates/invoice.ftl", data);
```

#### 3.1.2 Return type

The function returns a `string` containing the rendered output or a `freemarker:Error` if the template rendering fails (e.g., due to the file not being found, syntax errors in the template, or missing required variables).

## 4. Data mapping

### 4.1 Map Ballerina types to FreeMarker types

The following table summarizes how Ballerina types provided in the `data` parameter are mapped to corresponding FreeMarker types during template rendering.

| Ballerina Type | FreeMarker Type |
|----------------|-----------------|
| nil            | null            |
| boolean        | boolean         |
| int            | number          |
| float          | number          |
| decimal        | number          |
| string         | string          |
| record         | hash            |
| map            | hash            |
| array          | sequence        |

> **Note:** Since the data is serialized to JSON before being passed to the FreeMarker engine, all numeric types (`int`, `float`, `decimal`) are represented as JSON numbers and mapped to FreeMarker's `number` type.

## 5. Template syntax support

The Ballerina FreeMarker module supports the full [Apache FreeMarker template language](https://freemarker.apache.org/docs/dgui.html). The following subsections highlight the commonly used syntax features.

### 5.1 Variable interpolation

Variables from the data context are interpolated using the `${...}` syntax.

```ftl
Hello, ${name}! You have ${count} new messages.
```

### 5.2 Conditionals

Conditional rendering is supported using `<#if>`, `<#elseif>`, and `<#else>` directives.

```ftl
<#if isPremium?? && isPremium>
Thank you for being a Premium member!
<#else>
Consider upgrading to Premium for exclusive benefits.
</#if>
```

### 5.3 Iteration

Iteration over sequences (arrays) is supported using the `<#list>` directive.

```ftl
<#list items as item>
  ${item.name} — Qty: ${item.qty} @ $${item.unitPrice}
</#list>
```

### 5.4 Include directives

Templates can include other template files using the `<#include>` directive.

```ftl
<#include "partials/header.ftl">
```

### 5.5 Macros

Reusable template blocks can be defined using the `<#macro>` directive.

```ftl
<#macro greeting name>
  Hello, ${name}!
</#macro>

<@greeting name="Alice"/>
```

## 6. The `freemarker:Error` type

The `freemarker:Error` type represents all the errors related to the FreeMarker module. This is a distinct subtype of the Ballerina `error` type.

Errors may occur due to:

* Invalid FreeMarker template syntax
* Missing or unresolvable variables referenced in the template
* Template file not found (when using `renderFromFile`)
* I/O errors when reading template files
* Issues during data serialization
