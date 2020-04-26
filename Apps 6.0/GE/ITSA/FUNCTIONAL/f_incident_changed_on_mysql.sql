

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.changed_on' ELSE 'SUCCESS' END as Message
  FROM ( SELECT * FROM ge_mdsdb.incident_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN ge_mdwdb.f_incident TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE convert_tz(SRC.sys_updated_on,'UTC', 'US/Central') <> TRGT.changed_on 
