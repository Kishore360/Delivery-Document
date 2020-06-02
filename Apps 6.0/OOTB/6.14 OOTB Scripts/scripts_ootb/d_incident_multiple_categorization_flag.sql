SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.multiple_categorization_flag' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.incident_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_incident TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN   #MDS_TABLE_SCHEMA.sys_audit_final   TA 
 ON (SRC.sys_id  =TA.documentkey  
 AND SRC.sourceinstance=TA.sourceinstance )
AND TA.tablename = 'incident' 
AND TA.fieldname =  'category'
AND TA.oldvalue IS NOT NULL
AND TA.newvalue IS NOT NULL
 WHERE  CASE WHEN coalesce(TA.newvalue,'') <> coalesce(TA.oldvalue,'') THEN 'Y' ELSE 'N' END
 <> COALESCE(TRGT.multiple_categorization_flag ,'');