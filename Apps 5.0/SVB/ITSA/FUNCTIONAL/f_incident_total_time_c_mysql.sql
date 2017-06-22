
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message from
(SELECT d.opened_on,b.sys_created_on,
CONVERT_TZ (b.u_set_to_p1,'GMT','America/Los_Angeles'),set_to_p1_c,
d.row_id as drow,f.row_id,timestampdiff(second,opened_on,set_to_p1_c) as total_time_c_src,total_time_c,
timestampdiff(second,b.opened_at,b.u_set_to_p1) as sss
from svb_mdwdb.d_incident d
join svb_mdsdb.incident_final b on d.row_id=b.sys_id and d.source_id=b.sourceinstance
left join 
svb_mdwdb.f_incident f on 
f.incident_key=d.row_key 
)a
where sss<>total_time_c;
