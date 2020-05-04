select case when count(1)>1 then 'FAILURE'  else 'SUCCESS'  END as result ,
CASE WHEN count(1)>1 then 'Data mismatch for f_application_infra_c.cmdb_ci_key'  ELSE 'SUCCESS'  END as Message
-- select COALESCE(a11.u_cmdb_sys_id,'UNSPECIFIED'),a13.row_id ,COALESCE(a13.row_key,CASE WHEN a11.u_cmdb_sys_id IS NULL THEN 0 ELSE -1 END),a12.cmdb_ci_key 
from  bbandt_mdsdb.v_app_to_server_to_product_final a11
join bbandt_mdwdb.f_application_infra_c a12 on 
(concat(a11.app_id,'~',a11.app_name,'~',a11.infra_resource_name,'~',a11.source)=a12.row_id and a11.sourceinstance=a12.source_id)
left join bbandt_mdwdb.d_configuration_item a13 
on COALESCE(a11.u_cmdb_sys_id,'UNSPECIFIED')=a13.row_id -- and a11.sourceinstance=a13.source_id
where COALESCE(a13.row_key,CASE WHEN a11.u_cmdb_sys_id IS NULL THEN 0 ELSE -1 END)<>a12.cmdb_ci_key 
and a11.cdctype='X';