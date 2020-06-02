
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.priority_escalation_count' ELSE 'SUCCESS' END as Message
 
 -- select  SRCF.sys_id,COALESCE(CASE WHEN SRCF.priority_escalated>0 THEN 'Y' ELSE 'N' END ,'') as src, COALESCE(TRGT.priority_escalated_flag ,''),SRCF.priority_escalated
 FROM 
 (SELECT SRC.sys_id,SRC.sourceinstance,
 SUM(CASE WHEN TA.oldvalue IS NOT NULL AND TA.newvalue IS NOT NULL   
AND  TA.newvalue < TA.oldvalue
THEN 1 ELSE 0 END) AS priority_escalation_cnt
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.problem_final WHERE CDCTYPE<>'D') SRC 

 LEFT JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') TA 
 ON (SRC.sys_id  =TA.documentkey  
 AND SRC.sourceinstance = TA.sourceinstance  
 AND TA.tablename = 'problem' 
AND TA.fieldname =  'priority' 

)
GROUP BY SRC.sys_id,SRC.sourceinstance
) SRCF

LEFT JOIN #DWH_TABLE_SCHEMA.f_problem TRGT 
 ON (SRCF.sys_id  =TRGT.row_id  
 AND SRCF.sourceinstance = TRGT.source_id  )

 WHERE COALESCE(SRCF.priority_escalation_cnt ,'0')
 <> COALESCE(TRGT.priority_escalation_count ,'');
