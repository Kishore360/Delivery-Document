select case when count(1)>1 then 'FAILURE' else 'SUCCESS'  END as result ,
CASE WHEN count(1)>1 then 'Data mismatch for f_application_infra_c.db_support_end_date'  ELSE 'SUCCESS'  END as Message
from bbandt_mdsdb.v_app_to_server_to_product_final a11
left join bbandt_mdsdb.sa_techportfolio_products_final a12
on (a11.Operating_System=a12.Name and a11.sourceinstance=a12.sourceinstance)
left join bbandt_mdsdb.sa_techportfolio_products_final a13
on (a11.WebServer_Product=a13.Name and a11.sourceinstance=a13.sourceinstance)
left join bbandt_mdsdb.sa_techportfolio_products_final a14
on (a11.Database_Product=a14.Name and a11.sourceinstance=a14.sourceinstance)
join bbandt_mdwdb.f_application_infra_c a15 on 
(concat(a11.app_id,'~',a11.app_name,'~',a11.infra_resource_name,'~',a11.source)=a15.row_id and a11.sourceinstance=a15.source_id)
where a14.Support_End_Date<>a15.db_support_end_date;