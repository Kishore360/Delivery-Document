
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.service_type_key' ELSE 'SUCCESS' END as Message
 FROM schneider_mdsdb.hpd_help_desk_final SRC 
 LEFT JOIN  schneider_mdwdb.d_incident TRGT 
 ON (SRC.entry_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN schneider_mdwdb.d_lov LKP 
 ON ( concat('SERVICE TYPE','~','INCIDENT','~','~','~',upper(service_type))= LKP.src_rowid 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.service_type IS NULL THEN 0 else -1 end) <> (TRGT.service_type_key)