SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from homedepot_mdsdb.cmdb_ci_appl_final a
left JOIN homedepot_mdwdb.d_application b
on concat('APPLICATION~',a.sys_id)= b.row_id and a.sourceinstance=b.source_id
LEFT JOIN homedepot_mdwdb.d_lov LKP 
 ON ( concat('LIFECYCLE_PHASE_C~APPLICATION~~~',u_lifecycle_phase)= LKP.row_id 
AND a.sourceinstance= LKP.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN a.u_lifecycle_phase IS NULL THEN 0 else -1 end)<>b.lifecycle_phase_src_c_key)temp; 