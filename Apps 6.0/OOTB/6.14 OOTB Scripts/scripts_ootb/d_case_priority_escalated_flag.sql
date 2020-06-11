SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_case.priority_escalated_flag' ELSE 'SUCCESS' END as Message
 FROM 
 (SELECT SRC.sys_id,SRC.sourceinstance,
 SUM(CASE WHEN TA.oldvalue IS NOT NULL AND TA.newvalue IS NOT NULL   
AND  TA.newvalue < TA.oldvalue
THEN 1 ELSE 0 END) AS priority_escalated
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.sn_customerservice_case_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #MDS_TABLE_SCHEMA.sys_audit_final TA 
 ON (SRC.sys_id  =TA.documentkey 
 AND SRC.sourceinstance=TA.sourceinstance  
 AND TA.tablename = 'sn_customerservice_case' 
 AND TA.fieldname =  'priority' )
GROUP BY SRC.sys_id,SRC.sourceinstance
) SRCF

LEFT JOIN #DWH_TABLE_SCHEMA.d_case TRGT 
 ON (SRCF.sys_id  =TRGT.row_id  
 AND SRCF.sourceinstance = TRGT.source_id  )

 WHERE TRGT.row_key not in (0, -1) and 
COALESCE(CASE WHEN SRCF.priority_escalated>0 THEN 'Y' ELSE 'N' END ,'')
 <> COALESCE(TRGT.priority_escalated_flag ,'')


