SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message 
FROM meritsa_mdsdb.incident_final  SRC 
JOIN meritsa_mdwdb.f_incident TRGT 
ON (SRC.sys_id = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id ) and SRC.cdctype<>'D'
join meritsa_mdwdb.d_lov LKP
on COALESCE(CONCAT('STATE','~','incident','~',UPPER(SRC.state)),'UNSPECIFIED') = LKP.row_id 
where coalesce(LKP.row_key,case when SRC.state is null then 0 else -1 end)<>TRGT.state_src_key