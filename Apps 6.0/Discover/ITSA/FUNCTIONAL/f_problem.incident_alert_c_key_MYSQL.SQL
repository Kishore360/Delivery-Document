   select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.incident_alert_c_key' ELSE 'SUCCESS' END as Message       from discover_mdsdb.problem_final src 
left join discover_mdwdb.d_problem trg on src.sys_id=trg.row_id
left join discover_mdwdb.f_problem trg1 on trg.row_key=trg1.problem_key
left join discover_mdwdb.d_incident_alert_c lkp on lkp.row_key=trg1.incident_alert_c_key
where COALESCE(src.u_incident_alert,
                'UNSPECIFIED')  <> lkp.row_id;