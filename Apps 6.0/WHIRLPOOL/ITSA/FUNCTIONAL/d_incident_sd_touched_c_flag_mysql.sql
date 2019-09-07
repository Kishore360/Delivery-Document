SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident.sd_touched_c_flag' ELSE 'SUCCESS' END as Message
 FROM whirlpool_mdsdb.incident_final  SRC 
 JOIN whirlpool_mdwdb.d_incident TRGT 
 ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )
 WHERE (CASE WHEN SRC.u_sd_touched = 1 then 'Y' else 'N' END) <> (TRGT.sd_touched_c_flag) and SRC.cdctype<>'D'
