SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident_task.dormant_flag' ELSE 'SUCCESS' END as Message
FROM mcdonalds_mdsdb.incident_task_final SRC 
  JOIN mcdonalds_mdwdb.d_lov LKP 
  ON COALESCE( CONCAT('CONTACT_TYPE_C','~','incident_task','~','~','~',upper(SRC.contact_type)),'UNSPECIFIED') =LKP.row_id  AND SRC.sourceinstance= LKP.source_id 
  JOIN mcdonalds_mdwdb.d_incident_task_c TRGT 
  ON (SRC.sys_id=TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id )
  where TRGT.reported_type_src_key <>coalesce(LKP.row_key,case WHEN SRC.contact_type is null then 0 else -1 end)