SELECT CASE WHEN CNT>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for f_problem_task.open_to_close_mttr_c' ELSE 'SUCCESS' END as Message 
FROM
(select count(1) as CNT from wpl_mdwdb.f_problem_task tgt
join wpl_mdwdb.d_problem_task dim
on tgt.problem_task_key=dim.row_key
left join (SELECT problem_task_state.dimension_name AS source_dimension_name ,problem_task_state.row_key
FROM wpl_mdwdb.d_lov problem_task_state
WHERE problem_task_state.row_key = 0 OR problem_task_state.row_key = -1 
OR problem_task_state.dimension_class = 'STATE~PROBLEM_TASK') lov
on tgt.state_src_key=lov.row_key
join wpl_mdsdb.problem_task_final src 
on  tgt.row_id=src.sys_id and tgt.source_id=src.sourceinstance
 where  (tgt.open_to_close_mttr_c<>(CASE WHEN (Date_Format(tgt.opened_on_key,'%Y%m')=Date_Format(tgt.closed_on_key,'%Y%m')
AND lov.source_dimension_name='Closed Complete') then timestampdiff(second,dim.opened_on,dim.closed_on) else null end)
and src.cdctype<>'D'))src;