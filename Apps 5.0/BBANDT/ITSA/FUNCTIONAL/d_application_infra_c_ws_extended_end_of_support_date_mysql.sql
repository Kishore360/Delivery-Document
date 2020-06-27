SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_application_infra_c.ws_extended_end_of_support_date' ELSE 'SUCCESS' END as Message
 -- select distinct a11.app_id,a11.app_name,a11.infra_resource_name,a11.WebServer_Product,a12.Extended_Support
-- a15.ws_extended_end_of_support_date,a11.cdctype,a11.cdctime
from bbandt_mdsdb.v_app_to_server_to_product_final a11
left join bbandt_mdsdb.sa_techportfolio_products_final a12
on (a11.WebServer_Product=a12.Name and a11.sourceinstance=a12.sourceinstance )
join bbandt_mdwdb.d_application_infra_c a15 on 
(concat(a11.app_id,'~',a11.app_name,'~',a11.infra_resource_name,'~',a11.source)=a15.row_id and a11.sourceinstance=a15.source_id)
where a11.cdctype='X' 
and  a12.Extended_Support<>a15.ws_extended_end_of_support_date ; 
 
