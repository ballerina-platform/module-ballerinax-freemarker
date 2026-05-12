PURCHASE ORDER
═══════════════════════════════════════════════════════════
Order No.  : ${orderNumber}
Customer   : ${customerName}
Ship To    : ${shipTo}
Order Date : ${orderDate}

──────────────────────────────────────────────────────────
 No  Name                      Qty  Unit Price  Line Total
──────────────────────────────────────────────────────────
<#list lineItems as item>
 ${item?counter?string("00")}  ${item.name?right_pad(24)}  ${item.qty?right_pad(3)}  ${("$" + item.unitPrice)?left_pad(10)}  ${("$" + item.lineTotal)?left_pad(10)}
</#list>
──────────────────────────────────────────────────────────
                          Subtotal : $${subtotal}
                          Tax (${taxRate}%) : $${taxAmount}
                          TOTAL    : $${totalDue}
═══════════════════════════════════════════════════════════
Notes: ${notes}
