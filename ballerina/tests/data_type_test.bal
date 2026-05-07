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

// Type-coverage tests for the Jackson ObjectMapper pipeline.
// Each test targets a specific JSON value type to verify the
// Ballerina → JSON string → Jackson → FreeMarker pipeline handles it correctly.

import ballerina/test;

@test:Config {}
function testIntegerValue() returns error? {
    string result = check render("Count: ${count}", {"count": 42});
    test:assertEquals(result, "Count: 42");
}

@test:Config {}
function testLargeIntegerValue() returns error? {
    // Numbers >= 1000 get locale grouping in FreeMarker; use ?c for plain format.
    string result = check render("${id?c}", {"id": 9999999999});
    test:assertEquals(result, "9999999999");
}

@test:Config {}
function testFloatValue() returns error? {
    string result = check render("${price?string('0.##')}", {"price": 9.99});
    test:assertEquals(result, "9.99");
}

@test:Config {}
function testBooleanTrueCondition() returns error? {
    string result = check render("<#if active>enabled<#else>disabled</#if>", {"active": true});
    test:assertEquals(result, "enabled");
}

@test:Config {}
function testBooleanFalseCondition() returns error? {
    string result = check render("<#if active>enabled<#else>disabled</#if>", {"active": false});
    test:assertEquals(result, "disabled");
}

@test:Config {}
function testNullValue() returns error? {
    // Jackson maps JSON null → Java null; FreeMarker classicCompatible renders it as "".
    string result = check render("${value}", {"value": null});
    test:assertEquals(result, "");
}

@test:Config {}
function testNestedObject() returns error? {
    string result = check render("${user.name} is ${user.age}", {
        "user": {"name": "Alice", "age": 30}
    });
    test:assertEquals(result, "Alice is 30");
}

@test:Config {}
function testDeeplyNestedObject() returns error? {
    string result = check render("${a.b.c}", {
        "a": {"b": {"c": "deep"}}
    });
    test:assertEquals(result, "deep");
}

@test:Config {}
function testArrayOfStrings() returns error? {
    string result = check render("<#list tags as t>${t}<#sep>, </#sep></#list>", {
        "tags": ["ballerina", "java", "wso2"]
    });
    test:assertEquals(result, "ballerina, java, wso2");
}

@test:Config {}
function testArrayOfIntegers() returns error? {
    string result = check render("<#list scores as s>${s?c}<#sep>, </#sep></#list>", {
        "scores": [10, 20, 30]
    });
    test:assertEquals(result, "10, 20, 30");
}

@test:Config {}
function testArrayOfObjects() returns error? {
    string result = check render("<#list items as i>${i.name}: ${i.qty}<#sep> | </#sep></#list>", {
        "items": [{"name": "Apple", "qty": 3}, {"name": "Banana", "qty": 5}]
    });
    test:assertEquals(result, "Apple: 3 | Banana: 5");
}

@test:Config {}
function testEmptyArray() returns error? {
    string result = check render("<#list items as i>${i}</#list>none", {"items": []});
    test:assertEquals(result, "none");
}

@test:Config {}
function testMixedValueTypes() returns error? {
    string result = check render(
        "${name} age=${age} active=${active?c} rate=${rate?string('0.##')}",
        {"name": "Bob", "age": 25, "active": true, "rate": 98.5}
    );
    test:assertEquals(result, "Bob age=25 active=true rate=98.5");
}
