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

import ballerinax/freemarker;
import ballerina/io;

// Generates an order confirmation email from a FreeMarker template file.
// The template uses variable interpolation, <#list> to iterate over line items,
// and <#if> for conditional content — common patterns in real-world templating.
public function main() returns error? {
    map<json> data = {
        "orderId": "ORD-20260415-9821",
        "customerName": "Emily Carter",
        "items": [
            {"name": "Wireless Headphones", "qty": "2", "unitPrice": "149.99"},
            {"name": "USB-C Charging Cable", "qty": "3", "unitPrice": "12.99"}
        ],
        "subtotal": "338.95",
        "taxRate": "8.5",
        "taxAmount": "28.81",
        "total": "367.76",
        "deliveryDate": "April 20, 2026",
        "isPremiumMember": true,
        "rewardPoints": "368",
        "storeName": "TechMart"
    };

    string result = check freemarker:renderFromFile("order_confirmation.ftl", data);
    io:println(result);
}
