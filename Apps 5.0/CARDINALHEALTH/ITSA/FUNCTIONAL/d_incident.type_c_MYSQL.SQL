SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from cardinalhealth_mdsdb.incident_final SRC
join cardinalhealth_mdwdb.d_incident TRGT 
  ON SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance=TRGT.source_id  
LEFT JOIN cardinalhealth_mdsdb.sys_user_final suf on suf.sys_id=SRC.caller_id 
	AND suf.sourceinstance=SRC.sourceinstance
where suf.u_type<>TRGT.type_c)c