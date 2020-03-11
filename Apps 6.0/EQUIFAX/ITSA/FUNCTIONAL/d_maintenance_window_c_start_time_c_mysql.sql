SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.impact_src_code' 
ELSE 'MDS to DWH data validation passed for f_incident.impact_src_code' END as Message from 
(select count(1) cnt 
FROM equifax_mdsdb.u_maintenance_window_final a join
equifax_mdwdb.d_maintenance_window_c b on a.sys_id=b.row_id and a.sourceinstance =b.source_id
where a.u_start_time<> b.start_time_c and a.cdctype<>'D')b 

