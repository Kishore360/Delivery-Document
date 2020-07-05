select case when count(1)>1 then 'FAILURE' else 'SUCCESS'  END as result ,
CASE WHEN count(1)>1 then 'Data mismatch for f_application_infra_c.ws_end_of_support_health_duration'  ELSE 'SUCCESS'  END as Message
from truist_mdsdb.v_app_to_server_to_product_final a11
left join truist_mdsdb.sa_techportfolio_products_final a12
on (a11.Operating_System=a12.Name and a11.sourceinstance=a12.sourceinstance)
left join truist_mdsdb.sa_techportfolio_products_final a13
on (a11.WebServer_Product=a13.Name and a11.sourceinstance=a13.sourceinstance)
left join truist_mdsdb.sa_techportfolio_products_final a14
on (a11.Database_Product=a14.Name and a11.sourceinstance=a14.sourceinstance)
join truist_mdwdb.f_application_infra_c a15 on 
(concat(a11.app_id,'~',a11.app_name,'~',a11.infra_resource_name,'~',a11.source)=a15.row_id and a11.sourceinstance=a15.source_id)
join (select max(lastupdated) as lastupdated,source_id from truist_mdwdb.d_o_data_freshness a group by source_id) a16 
on (a15.source_id=a16.source_id)
where timestampdiff(SECOND, CONVERT_TZ(a16.lastupdated,'America/New_York','GMT'),a13.Support_End_Date)<>a15.ws_end_of_support_health_duration
and a11.cdctype='X' and a13.cdctype='X';