SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_application_infra_c.os_support_end_date' ELSE 'SUCCESS' END as Message
 -- select distinct a11.app_id,a11.app_name,a11.infra_resource_name,a11.Operating_System,a12.Name,a12.Support_End_Date,a15.os_support_end_date
from truist_mdsdb.v_app_to_server_to_product_final a11 
left join truist_mdsdb.sa_techportfolio_products_final a12
on (a11.Operating_System=a12.Name and a11.sourceinstance=a12.sourceinstance) 
left join truist_mdsdb.sa_techportfolio_products_final a13
on (a11.WebServer_Product=a13.Name and a11.sourceinstance=a13.sourceinstance) 
left join truist_mdsdb.sa_techportfolio_products_final a14
on (a11.Database_Product=a14.Name and a11.sourceinstance=a14.sourceinstance)
join truist_mdwdb.d_application_infra_c a15 on 
(concat(a11.app_id,'~',a11.app_name,'~',a11.infra_resource_name,'~',a11.source)=a15.row_id and a11.sourceinstance=a15.source_id)
where a11.cdctype='X' 
and (a12.Support_End_Date)<>a15.os_support_end_date;
