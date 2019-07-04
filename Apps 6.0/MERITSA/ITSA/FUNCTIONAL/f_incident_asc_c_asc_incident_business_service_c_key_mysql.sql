SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_c.urgency' ELSE 'SUCCESS' END as Message 
FROM meritsa_mdsdb.u_asc_ticket_final  SRC 
JOIN meritsa_mdwdb.f_incident_asc_c TRGT 
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )
join meritsa_mdwdb.d_service LKP
on COALESCE(CONCAT('BUSINESS_SERVICE','~',SRC.cmdb_ci),'UNSPECIFIED') =LKP.row_id
WHERE coalesce(LKP.row_key,case when SRC.cmdb_ci is null then  0 else -1 end )<>TRGT.asc_incident_business_service_c_key
