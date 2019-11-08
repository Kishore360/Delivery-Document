SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident_parent_incident_key' ELSE 'SUCCESS' END as Message
FROM whirlpool_mdsdb.incident_final SRC 
  JOIN whirlpool_mdwdb.d_incident LKP 
  ON COALESCE( SRC.parent_incident,'UNSPECIFIED') =LKP.row_id  AND SRC.sourceinstance= LKP.source_id 
  JOIN whirlpool_mdwdb.d_incident TRGT 
  ON (SRC.sys_id=TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id )
  where TRGT.parent_incident_key <>coalesce(LKP.row_key,case WHEN SRC.parent_incident is null then 0 else -1 end)
  and SRC.CDCTYPE='X';