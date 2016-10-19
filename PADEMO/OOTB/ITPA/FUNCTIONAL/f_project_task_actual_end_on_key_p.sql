SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.actual_end_on_key' ELSE 'SUCCESS' END as Message
FROM  <<tenant>>_mdwdb.f_project_task TRGT 
LEFT JOIN <<tenant>>_mdwdb.d_calendar_date LKP 
ON (date_format(TRGT.actual_end_on,'%Y%m%d')= LKP.row_id and LKP.source_id=0
)
WHERE COALESCE(LKP.row_key,'') <>COALESCE(TRGT.actual_end_on_key,'')
