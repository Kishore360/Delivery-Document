


SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message from (
select count(1) cnt
        FROM
rogers_mdwdb.f_task_survey f
LEFT JOIN rogers_mddb.task_survey_final tsf ON f.row_id=tsf.sys_id
AND f.source_id=tsf.sourceinstance
where  f.completed_on_c <> convert_tz(tsf.completed_date,'GMT','America/New_York') )a