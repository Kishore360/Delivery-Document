SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
FROM mercuryins_mdwdb.f_incident_asc_c f
JOIN mercuryins_mdsdb.u_asc_ticket_final br 
ON f.row_id = br.sys_id and f.source_id=br.sourceinstance
JOIN mercuryins_mdwdb.d_service a 
ON COALESCE(CONCAT('BUSINESS_SERVICE','~',br.cmdb_ci),'UNSPECIFIED')=a.row_id
where coalesce(a.row_key,case when br.cmdb_ci is null then 0 else -1 end)<>f.asc_incident_business_service_c_key
