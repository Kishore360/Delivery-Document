SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.own_actual_loc_cost' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.pm_project_task_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN (
select sum(FI.amount) as amount , FE.task from ( SELECT * FROM #MDS_TABLE_SCHEMA.fm_expense_line_final WHERE CDCTYPE<>'D') FE
join ( select * from #MDS_TABLE_SCHEMA.fx_currency_instance_final where (id, sys_created_on,field) in ( select id, max(sys_created_on),field from #MDS_TABLE_SCHEMA.fx_currency_instance_final WHERE CDCTYPE<>'D' and field='amount' and (id is not null) group by id, sys_created_on,field)) FI ON(FI.id=FE.sys_id and FI.field='amount')
group by task
) FEI 
ON (FEI.task=SRC.sys_id )
JOIN #DWH_TABLE_SCHEMA.f_project_task TRGT 
ON (SRC.sys_id=TRGT.row_id )
 left join #DWH_TABLE_SCHEMA.d_project DIM
 on TRGT.project_key = DIM.row_key
WHERE CASE WHEN (DIM.is_leaf_flag = 'Y' and TRGT.project_key IS NULL) THEN total_actual_loc_cost 
ELSE COALESCE( CAST(coalesce(FEI.amount ,0) as decimal(20,10)),'') END <> COALESCE(TRGT.own_actual_loc_cost ,'');