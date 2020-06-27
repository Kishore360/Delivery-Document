select case when count(1)>0 then 'FAILURE' else 'SUCCESS'  END as result ,
CASE WHEN count(1)>0 then 'Data mismatch for f_application_infra_c.os_end_of_support_health_code'  ELSE 'SUCCESS'  END as Message
/*select a11.app_id,a12.Support_End_Date,CONVERT_TZ(a16.lastupdated,'America/New_York','GMT') lastrefreshed,a11.Operating_System,
timestampdiff(SECOND, CONVERT_TZ(a16.lastupdated,'America/New_York','GMT'),a12.Support_End_Date)/86400 Diff,
CASE WHEN  timestampdiff(SECOND, CONVERT_TZ(a16.lastupdated,'America/New_York','GMT'),a12.Support_End_Date) is NULL then 'White'
when timestampdiff(SECOND, CONVERT_TZ(a16.lastupdated,'America/New_York','GMT'),a12.Support_End_Date)/86400<0 then 'Red'
when timestampdiff(SECOND, CONVERT_TZ(a16.lastupdated,'America/New_York','GMT'),a12.Support_End_Date)/86400= 0 and
timestampdiff(SECOND, CONVERT_TZ(a16.lastupdated,'America/New_York','GMT'),a12.Support_End_Date)/86400<=180 then 'Orange'
when timestampdiff(SECOND, CONVERT_TZ(a16.lastupdated,'America/New_York','GMT'),a12.Support_End_Date)/86400> 180 and
timestampdiff(SECOND, CONVERT_TZ(a16.lastupdated,'America/New_York','GMT'),a12.Support_End_Date)/86400<=5400 then 'Yellow'
ELSE 'Green' END exp_os_code,a15.os_end_of_support_health_code*/
from bbandt_mdsdb.v_app_to_server_to_product_final a11
left join bbandt_mdsdb.sa_techportfolio_products_final a12
on (a11.Operating_System=a12.Name and a11.sourceinstance=a12.sourceinstance)
left join bbandt_mdsdb.sa_techportfolio_products_final a13
on (a11.WebServer_Product=a13.Name and a11.sourceinstance=a13.sourceinstance)
left join bbandt_mdsdb.sa_techportfolio_products_final a14
on (a11.Database_Product=a14.Name and a11.sourceinstance=a14.sourceinstance)
join bbandt_mdwdb.d_application_infra_c a15 on 
(concat(a11.app_id,'~',a11.app_name,'~',a11.infra_resource_name,'~',a11.source)=a15.row_id and a11.sourceinstance=a15.source_id)
join (select max(lastupdated) as lastupdated,source_id from bbandt_mdwdb.d_o_data_freshness a group by source_id) a16 
on (a15.source_id=a16.source_id)
where CASE WHEN  timestampdiff(SECOND, CONVERT_TZ(a16.lastupdated,'America/New_York','GMT'),a12.Support_End_Date) is NULL then 'White'
when timestampdiff(SECOND, CONVERT_TZ(a16.lastupdated,'America/New_York','GMT'),a12.Support_End_Date)/86400<0 then 'Red'
when timestampdiff(SECOND, CONVERT_TZ(a16.lastupdated,'America/New_York','GMT'),a12.Support_End_Date)/86400= 0 and
timestampdiff(SECOND, CONVERT_TZ(a16.lastupdated,'America/New_York','GMT'),a12.Support_End_Date)/86400<=180 then 'Orange'
when timestampdiff(SECOND, CONVERT_TZ(a16.lastupdated,'America/New_York','GMT'),a12.Support_End_Date)/86400> 180 and
timestampdiff(SECOND, CONVERT_TZ(a16.lastupdated,'America/New_York','GMT'),a12.Support_End_Date)/86400<=540 then 'Yellow'
ELSE 'Green' END<>a15.os_end_of_support_health_code
and a11.cdctype='X' and a12.cdctype='X';