SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from cardinalhealth_mdwdb.d_incident si 
JOIN cardinalhealth_mdsdb.incident_final id ON id.sys_id =si.row_id AND id.sourceinstance=si.source_id  
LEFT JOIN cardinalhealth_mdsdb.sys_user_final suf on suf.sys_id=id.caller_id AND suf.sourceinstance=id.sourceinstance
where suf.u_type<>si.type_c and si.soft_deleted_flag='N')c
