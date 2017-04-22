 
 
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_problem.met_sla_flag' ELSE 'SUCCESS' END as Message from
 (
 select count(1) as cnt
 FROM pgi_mdsdb.u_problem_report_request_delta i 
	left join pgi_mdsdb.u_external_incident_final c on c.sys_id=i.u_incident and c.sourceinstance = i.sourceinstance
		left join pgi_mdsdb.incident_final E on E.sys_id=c.u_parent_ticket and E.sourceinstance = c.sourceinstance
		join pgi_mdwdb.d_problem_report_c TRGT on i.sys_id=TRGT.row_id and i.sourceinstance=TRGT.source_id
 WHERE CASE WHEN (E.sys_id=c.u_parent_ticket)AND (c.sys_id=i.u_incident) THEN 'Y' ELSE 'N' END <>TRGT.parent_ticket_flag)a 
 
 