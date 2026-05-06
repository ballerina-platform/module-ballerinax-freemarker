Order Confirmation — #${orderId}

Dear ${customerName},

Thank you for your order! Here is your summary:

Items Ordered:
<#list items as item>
  - ${item.name} x${item.qty}  $${item.unitPrice}
</#list>
Subtotal : $${subtotal}
Tax (${taxRate}%)  : $${taxAmount}
Total     : $${total}

Estimated Delivery: ${deliveryDate}
<#if isPremiumMember>
As a Premium member, you earned ${rewardPoints} reward points on this order.
</#if>
Questions? Reply to this email or visit our support page.

Thanks,
The ${storeName} Team
