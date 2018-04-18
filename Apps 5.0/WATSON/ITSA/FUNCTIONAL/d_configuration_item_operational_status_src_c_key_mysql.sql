SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
count(*) as cnt
from  watson_mdsdb.cmdb_ci_final a11
 join watson_mdwdb.d_configuration_item  a12
on a12.row_id= a11.sys_id and a11.sourceinstance=a12.source_id
JOIN watson_mdwdb.d_lov LKP ON (COALESCE(CONCAT('OPERATIONAL_STATUS~CMDB_CI~~~',a11.operational_status),'UNSPECIFIED')= LKP.row_id
 AND a11.sourceinstance=LKP.source_id)
 left join watson_mdsdb.u_cloud_offering_final a13 on a11.sys_id = a13.sys_id
where a13.sys_id is null
and COALESCE(LKP.row_key,CASE WHEN a11.operational_status IS NULL THEN 0 ELSE -1 END) <> a12.operational_status_src_c_key)a;