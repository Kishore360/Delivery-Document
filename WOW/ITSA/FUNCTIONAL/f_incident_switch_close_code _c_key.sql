SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from wow_mdsdb.incident_final a
left join wow_mdwdb.f_incident b
 on a.sys_id=b.row_id and a.sourceinstance=b.source_id 
  left join wow_mdwdb.d_lov c 
on  CONCAT('SWITCH_CLOSE_CODE~INCIDENT~~~',a.u_switch_close_code )=c.row_id and a.sourceinstance=c.source_id
 where case when u_switch_close_code   is NULL then 0 
when c.row_id is NULL and u_switch_close_code is not NULL then -1 
else
c.row_key end <> b.switch_close_code_c_key   and  dimension_class = 'SWITCH_CLOSE_CODE~INCIDENT')g