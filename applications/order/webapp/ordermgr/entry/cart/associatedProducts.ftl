<#--

Copyright 2001-2006 The Apache Software Foundation

Licensed under the Apache License, Version 2.0 (the "License"); you may not
use this file except in compliance with the License. You may obtain a copy of
the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
License for the specific language governing permissions and limitations
under the License.
-->

<#if (shoppingCart.getOrderType() == "SALES_ORDER")>
    <#assign associatedProducts = Static["org.ofbiz.order.shoppingcart.product.ProductDisplayWorker"].getRandomCartProductAssoc(request, true)?if_exists>
</#if>

<#if associatedProducts?has_content>
<div class="screenlet">
    <div class="screenlet-header">
        <div class="boxhead">&nbsp;${uiLabelMap.help_also_interested_in}</div>
    </div>
    <div class="screenlet-body">
    <table cellspacing="0" cellpadding="1" border="0">
      <#-- random complementary products -->
      <#list associatedProducts as assocProduct> 
        <tr>
          <td>
            ${setRequestAttribute("optProduct", assocProduct)} 
            ${setRequestAttribute("listIndex", assocProduct_index)}         
            ${screens.render(productsummaryScreen)}
          </td>
        </tr>
        <#if assocProduct_has_next>
          <tr><td><hr class="sepbar"></td></tr>
        </#if>
      </#list>
    </table>
    </div>
</div>
</#if>
