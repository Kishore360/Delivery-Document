
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_expense_item.created_on' ELSE 'SUCCESS' END as Message
FROM (SELECT S.sys_id,S.sourceinstance,S.sys_created_on 
	FROM <<tenant>>_mdsdb.fm_expense_line_final S 
	JOIN <<tenant>>_mdsdb.pm_project_final SRC_P ON (SRC_P.sys_id = S.task) 
    UNION
    SELECT S.sys_id,S.sourceinstance,S.sys_created_on 
	FROM <<tenant>>_mdsdb.fm_expense_line_final S 
	JOIN <<tenant>>_mdsdb.pm_project_task_final SRC_PT ON (SRC_PT.sys_id = S.task) 
)SRC
JOIN <<tenant>>_mdwdb.d_expense_item TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
JOIN  app_test.lsm_ls_source_timezone L 
ON (SRC.sourceinstance  = L.sourceid)
 WHERE convert_tz(SRC.sys_created_on,source_time_zone,target_time_zone)<> TRGT.created_on

