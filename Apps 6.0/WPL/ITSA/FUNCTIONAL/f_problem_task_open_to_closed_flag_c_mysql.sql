SELECT CASE WHEN CNT>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for f_problem_task.open_to_close_flag_c' ELSE 'SUCCESS' END as Message 
FROM
(select count(1) as CNT from wpl_mdwdb.f_problem_task tgt
join wpl_mdsdb.problem_task_final src on  tgt.row_id=src.sys_id and tgt.source_id=src.sourceinstance
 where  (tgt.open_to_close_flag_c<>CASE WHEN Date_Format(tgt.opened_on_key,'%Y%m')=Date_Format(tgt.closed_on_key,'%Y%m') 
THEN 1 else 0 END
and src.cdctype<>'D'))src;