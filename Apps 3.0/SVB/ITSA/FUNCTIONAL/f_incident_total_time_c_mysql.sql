SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message from(
SELECT timestampdiff(second,opened_on,set_to_p1_c) as total_time_c_src,total_time_c
from svb_mdwdb.d_incident d
left join 
svb_mdwdb.f_incident f on 
f.incident_key=d.row_key 
)a
where total_time_c_src<>total_time_c