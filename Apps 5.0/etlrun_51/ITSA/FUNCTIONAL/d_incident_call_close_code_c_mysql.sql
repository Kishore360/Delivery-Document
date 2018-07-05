SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from
wow_mdwdb.d_incident trgt
 JOIN 
( select incd.sourceinstance,incd.sys_id ,uccr.u_resolution_code
from wow_mdsdb.incident_final incd  join
wow_mdsdb.u_call_center_resolution_code_final uccr
on incd.u_call_close_code=uccr.sys_id) src 
	ON trgt.row_id = src.sys_id
	AND trgt.source_id = src.sourceinstance
where trgt.call_close_code_c <> src.u_resolution_code)a


