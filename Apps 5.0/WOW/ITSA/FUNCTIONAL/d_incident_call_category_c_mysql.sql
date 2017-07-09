SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM wow_mdwdb.d_incident trgt
INNER JOIN 
( select incd.sourceinstance,incd.sys_id ,uccsc.u_category
from wow_mdsdb.incident_final incd inner join 
wow_mdsdb.u_call_center_category_and_sub_categories_final uccsc
on incd.u_call_category=uccsc.sys_id) src 
	ON trgt.row_id = src.sys_id
	AND trgt.source_id = src.sourceinstance
where trgt.call_category_c <> src.u_category