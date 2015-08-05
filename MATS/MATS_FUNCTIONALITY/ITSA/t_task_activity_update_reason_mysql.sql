
 
create INDEX `SYS_ID` on `<<tenant>>_mdsdb`.`sys_audit_final`
(`sys_id` ASC, `sourceinstance` ASC);


create INDEX `ROW_ID` on `<<tenant>>_mdwdb`.`f_t_task_activity`
(`row_id` ASC, `source_id` ASC);

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_t_task_activity.update_reason' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.sys_audit_final SRC 
 LEFT JOIN <<tenant>>_mdwdb.f_t_task_activity TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE COALESCE( SRC.reason,'')<> COALESCE(TRGT.update_reason ,'');


DROP index `SYS_ID` on `<<tenant>>_mdsdb`.`sys_audit_final`;

DROP index `ROW_ID` on `<<tenant>>_mdwdb`.`f_t_task_activity`;
