<#ftl>
<#macro m code>${springMacroRequestContext.getMessage(code,code)}</#macro>
<#macro ma code args>${springMacroRequestContext.getMessage(code, args, code)}</#macro>
<#macro cut string l=50 append=''><#if string?length lt l>${string}<#else>${string[0..l-1]}${append}</#if></#macro>
<#macro meger name value><#if !.vars[name]??><@"<#assign ${name}=''>"?interpret /></#if><#if value??><@"<#assign ${name}=${name}+'${value},'>"?interpret /></#if></#macro>
<#macro dump object><#if ojbect?is_string>"${ojbect}"<#elseif object?is_number>${object}<#elseif object?is_boolean>${object?string('true','false')}<#elseif object?is_date_like>"<#if object?is_datetime>${object?datetime}<#elseif object?is_date_only>${object?date}<#elseif object?is_time>${object?time}</#if>"<#elseif object?is_hash_ex>{<#list result?keys as k>"${k}":"${result[value]}"<#if k?has_next>,</#if></#list>}<#elseif object?is_enumerable>[<#list object as o><#if o?has_next><@dump object/>,</#if></#list>]</#if></#macro>