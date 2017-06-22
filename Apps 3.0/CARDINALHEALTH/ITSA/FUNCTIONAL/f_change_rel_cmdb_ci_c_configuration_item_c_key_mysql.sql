
 
 
 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from cardinalhealth_mdsdb.u_m2m_change_rel_cmdb_ci_final a
JOIN  cardinalhealth_mdwdb.f_change_rel_cmdb_ci_c b
on  b.row_id = a.sys_id and a.sourceinstance=b.source_id
join cardinalhealth_mdwdb.d_configuration_item LKP
 ON coalesce (u_cmdb_ci,'UNSPECIFIED')  = LKP.row_id 
AND a.sourceinstance= LKP.source_id 
 WHERE COALESCE(LKP.row_key,CASE WHEN a.u_cmdb_ci IS NULL THEN 0 else -1 end)<> b.configuration_item_c_key)c
 
 
 
 
 