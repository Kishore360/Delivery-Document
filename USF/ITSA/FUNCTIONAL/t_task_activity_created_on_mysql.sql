 
create INDEX `SYS_ID` on `usf_mdsdb`.`sys_audit_final`
(`sys_id` ASC, `sourceinstance` ASC);


create INDEX `ROW_ID` on `usf_mdwdb`.`f_t_task_activity`
(`row_id` ASC, `source_id` ASC);


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_t_task_activity.created_by' 
ELSE 'SUCCESS' END as Message
FROM usf_mdsdb.sys_audit_final SRC 
 LEFT JOIN usf_mdwdb.f_t_task_activity TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE convert_tz(SRC.sys_created_on,'GMT','America/New_York')<> TRGT.created_on ;


DROP index `IDX_SYS_AUDIT_FINAL_SYS_ID` on `usf_mdsdb`.`sys_audit_final`;

DROP index `IDX_SYS_AUDIT_FINAL_ROW_ID` on `usf_mdwdb`.`f_t_task_activity`;

