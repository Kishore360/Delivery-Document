
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.work_notes' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.incident_final SRC 
 
 LEFT JOIN  
 (select LKP.documentkey
 ,LKP.sourceinstance
 ,group_concat(LKP.newvalue order by LKP.sys_created_on) as newvalue1
  from #MDS_TABLE_SCHEMA.sys_audit_final LKP 
 where  LKP.fieldname='work_notes'
 group by LKP.documentkey
 ,LKP.sourceinstance
 )LKP
 ON (convert(SRC.sys_id using utf8) =convert(LKP.documentkey using utf8) 
  AND convert(SRC.sourceinstance using utf8)= convert(LKP.sourceinstance using utf8) )
 
 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_incident TRGT 
 ON (convert(SRC.sys_id using utf8) =convert(TRGT.row_id using utf8) 
 AND convert(SRC.sourceinstance using utf8)= convert(TRGT.source_id using utf8) )
 WHERE COALESCE( CONVERT(substr(LKP.newvalue1,1,65535) using utf8),'')<> COALESCE(CONVERT(TRGT.work_notes using utf8),'')