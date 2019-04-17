 SELECT CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_task.closed_on_key' ELSE 'SUCCESS' END as Message
 FROM (SELECT COUNT(1) AS CNT FROM rambus_mdsdb.task_final SRC
  JOIN rambus_mdwdb.f_task TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 JOIN rambus_mdwdb.d_calendar_date LKP 
on (LKP.row_id = coalesce(date_format(convert_tz(coalesce(SRC.closed_at,SRC.sys_updated_on),'GMT','America/Los_Angeles'),'%Y%m%d'),'UNSPECIFIED')  
)
WHERE coalesce(LKP.row_key,case when SRC.closed_at is null then 0 ELSE -1 END )<> (TRGT.closed_on_key)
AND TRGT.soft_deleted_flag='N')a;



