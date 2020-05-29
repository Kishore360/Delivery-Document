

SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.close_code_src_key' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM #MDS_TABLE_SCHEMA.incident_final SRC 
  JOIN #DWH_TABLE_SCHEMA.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
 ON LKP.dimension_class like '%CLOSE_CODE~INCIDENT%' and 
 concat('CLOSE_CODE~INCIDENT~',upper(close_code))= (LKP.src_rowid)
AND SRC.sourceinstance= LKP.source_id 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.close_code IS NULL THEN 0 else -1 end)<> (TRGT.close_code_src_key))b