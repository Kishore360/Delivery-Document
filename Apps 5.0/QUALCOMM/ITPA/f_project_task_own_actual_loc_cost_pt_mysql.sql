SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.own_actual_loc_cost' ELSE 'SUCCESS' END as Message
FROM qualcomm_mdsdb.pm_project_task_final SRC 
LEFT JOIN (
select sum(FI.amount) as amount , FE.task from qualcomm_mdsdb.fm_expense_line_final FE
join qualcomm_mdsdb.fx_currency_instance_final FI ON(FI.id=FE.sys_id and FI.field='amount')
group by task
) FEI 
ON (FEI.task=SRC.sys_id )
JOIN qualcomm_mdwdb.f_project_task TRGT 
ON (SRC.sys_id=TRGT.row_id )
 left join qualcomm_mdwdb.d_project DIM
 on TRGT.project_key = DIM.row_key
WHERE CASE WHEN DIM.is_leaf_flag = 'Y' THEN total_actual_loc_cost 
ELSE COALESCE( CAST(coalesce(FEI.amount ,0) as decimal(20,10)),'') END <> COALESCE(TRGT.own_actual_loc_cost ,'');