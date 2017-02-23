SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from cardinalhealth_mdwdb.d_incident si 
JOIN cardinalhealth_mdsdb.incident_final id ON id.sys_id =si.row_id 
	AND id.sourceinstance=si.source_id  
LEFT JOIN cardinalhealth_mdsdb.sys_user_final suf on suf.sys_id=id.caller_id 
	AND suf.sourceinstance=id.sourceinstance
LEFT JOIN cardinalhealth_mdsdb.sys_user_group_final sug ON  sug.sys_id=id.assignment_group 
	AND sug.sourceinstance=id.sourceinstance 
LEFT JOIN  cardinalhealth_mdsdb.sys_user_group_final sug_parent ON sug.parent=sug_parent.sys_id
	AND sug.sourceinstance=sug_parent.sourceinstance
where COALESCE(sug_parent.u_segment,sug.u_segment)<>si.assignment_group_segment_c)c
