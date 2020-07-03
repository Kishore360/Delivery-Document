select case when count(1)>0 then 'FAILURE' else 'SUCCESS'  END as result ,
CASE WHEN count(1)>0 then 'Data mismatch for f_application_infra_c.os_end_of_support_health_code'  ELSE 'SUCCESS'  END as Message
from 
truist_mdwdb.d_application_infra_c d_application_infra_c   
INNER JOIN
(select 
X.application_infra_c_key,
timestampdiff(SECOND, CONVERT_TZ((select max(lastupdated) from truist_mdwdb.d_o_data_freshness where source_id = 2),'America/New_York','GMT'), os.support_end_date) as os_end_of_support_health_duration
from 
(select  sys_updated_on AS sys_updated_on, a.sys_updated_by, a.app_id as app_id,a.cdctime,a.sourceinstance, u_cmdb_sys_id,
CONCAT(a.app_id,'~',a.app_name,'~',a.infra_resource_name,'~', a.source) as application_infra_c_key,
a.database_product,a.u_environment,a.infra_resource_name,a.source,a.infra_resource_type,
a.install_status,a.location,a.operating_system,
a.operational_status,a.u_role,a.sys_class_name,a.webserver_product, 
CONCAT(a.app_id,'~',a.app_name,'~',a.infra_resource_name,'~',a.source) as row_id,a.cdctype
from truist_mdsdb.v_app_to_server_to_product_final a 
GROUP BY a.app_id,a.app_name,a.infra_resource_name,a.source
)X
left outer join truist_mdsdb.sa_techportfolio_products_final os on X.operating_system = os.name and X.sourceinstance = os.sourceinstance) f_application_infra_c 
ON d_application_infra_c.row_id=f_application_infra_c.application_infra_c_key  
where  d_application_infra_c.os_end_of_support_health_code <> CASE 
            WHEN f_application_infra_c.os_end_of_support_health_duration is NULL then 'White'                           
            When f_application_infra_c.os_end_of_support_health_duration/86400<0 then 'Red'                           
            when f_application_infra_c.os_end_of_support_health_duration/86400 >= 0 
            and f_application_infra_c.os_end_of_support_health_duration/86400 <=180 then 'Orange'                           
            when f_application_infra_c.os_end_of_support_health_duration/86400 >= 180 
            and f_application_infra_c.os_end_of_support_health_duration/86400 <=540 then 'Yellow'                           
            ELSE 'Green' 
        END