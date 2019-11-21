
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_ad_hoc_request_c.description' ELSE 'SUCCESS' END as Message
 FROM whirlpool_mdsdb.incident_final  SRC 
 JOIN whirlpool_mdwdb.d_incident TRGT 
 ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id ) 
 WHERE SRC.description <> (TRGT.description) and SRC.cdctype='X'
and SRC.cdctype='X'