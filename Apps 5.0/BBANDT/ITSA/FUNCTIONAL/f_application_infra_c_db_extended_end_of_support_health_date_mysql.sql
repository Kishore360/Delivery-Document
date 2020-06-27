SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM 
 (select  sys_updated_on AS sys_updated_on, a.sys_updated_by, a.app_id as app_id,a.cdctime,a.sourceinstance, u_cmdb_sys_id,
a.database_product,a.u_environment,a.infra_resource_name,a.source,a.infra_resource_type,
a.install_status,a.location,a.operating_system,
a.operational_status,a.u_role,a.sys_class_name,a.webserver_product, 
CONCAT(a.app_id,'~',a.app_name,'~',a.infra_resource_name,'~',a.source) as row_id,a.cdctype
from bbandt_mdsdb.v_app_to_server_to_product_final a 
GROUP BY a.app_id,a.app_name,a.infra_resource_name,a.source
)X
left outer join bbandt_mdsdb.sa_techportfolio_products_final db on X.database_product = db.name and X.sourceinstance = db.sourceinstance
 LEFT JOIN bbandt_mdwdb.f_application_infra_c TRGT 
 ON (X.row_id  =TRGT.row_id  
 AND X.sourceinstance= TRGT.source_id  )
 WHERE case when (upper(db.supplier) like '%MICROSOFT%') and db.Extended_Support is not null then db.Extended_Support else db.support_end_date end <>TRGT.DB_Extended_End_of_Support_Health_Date
 and X.CDCTYPE  <>'D'