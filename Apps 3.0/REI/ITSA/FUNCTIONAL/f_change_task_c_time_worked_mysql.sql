SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.state_src_key' ELSE 'SUCCESS' END as Message 
     from rei_mdsdb.change_task_final SRC left join
        rei_mdwdb.f_change_task_c fi on SRC.sys_id=fi.row_id and SRC.sourceinstance=fi.source_id
     
	where TIMESTAMPDIFF(SECOND,'1970/01/01 00:00:00', SRC.time_worked)
          <> fi.time_worked