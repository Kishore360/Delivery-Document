
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.work_notes' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.incident_final SRC 
 
 LEFT JOIN  
 (select LKP.documentkey
 ,LKP.sourceinstance
 ,group_concat(LKP.newvalue order by LKP.sys_created_on) as newvalue1
  from <<tenant>>_mdsdb.sys_audit_final LKP 
 where  LKP.fieldname='work_notes'
 group by LKP.documentkey
 ,LKP.sourceinstance
 )LKP
 ON (SRC.sys_id =LKP.documentkey  
  AND SRC.sourceinstance= LKP.sourceinstance  )
 
 
 LEFT JOIN <<tenant>>_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( substr(LKP.newvalue1,1,65535),'')<> COALESCE(TRGT.work_notes ,'')
