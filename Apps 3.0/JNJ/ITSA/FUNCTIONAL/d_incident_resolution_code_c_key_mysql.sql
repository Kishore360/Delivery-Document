SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from jnj_mdsdb.incident_final a
left JOIN jnj_mdwdb.d_incident b
on a.sys_id= b.row_id and a.sourceinstance=b.source_id
LEFT JOIN jnj_mdwdb.d_lov LKP 
 ON ( concat('RESOLUTION_CODE_C~INCIDENT~~~',u_resolution_code )= LKP.row_id 
AND a.sourceinstance= LKP.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN a.u_resolution_code  IS NULL THEN 0 else -1 end)<>b.resolution_code_c_key)temp; 
