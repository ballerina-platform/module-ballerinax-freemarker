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

import ballerina/jballerina.java;

# Renders a FreeMarker template string with the provided data context.
#
# + template - FreeMarker template string (uses `${variable}`, `<#if>`, `<#list>` syntax)
# + data - Key-value pairs used as the data context for rendering
# + return - Rendered string output or an `Error` if rendering fails
public isolated function render(string template, record {|json...;|} data) returns string|Error {
    return renderNative(template, data.toJsonString());
}

# Renders a FreeMarker template from a file with the provided data context.
#
# + templatePath - Path to the FreeMarker template file (typically `.ftl` extension)
# + data - Key-value pairs used as the data context for rendering
# + return - Rendered string output or an `Error` if rendering fails
public isolated function renderFromFile(string templatePath, record {|json...;|} data) returns string|Error {
    return renderFromFileNative(templatePath, data.toJsonString());
}

isolated function renderNative(string template, string jsonData) returns string|Error = @java:Method {
    'class: "io.ballerina.lib.freemarker.FreemarkerUtils",
    name: "render"
} external;

isolated function renderFromFileNative(string templatePath, string jsonData) returns string|Error = @java:Method {
    'class: "io.ballerina.lib.freemarker.FreemarkerUtils",
    name: "renderFromFile"
} external;
