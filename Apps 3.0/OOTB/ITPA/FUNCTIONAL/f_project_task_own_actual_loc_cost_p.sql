

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_task.own_actual_loc_cost' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.pm_project_final SRC 
 LEFT JOIN (
 select sum(FI.amount) as amount ,FE.task from <<tenant>>_mdsdb.fm_expense_line_final FE
 join <<tenant>>_mdsdb.fx_currency_instance_final FI
 ON(FI.id=FE.sys_id and FI.field='amount')
 group by task
 ) FEI 
 ON (FEI.task=SRC.sys_id ) 
 
 LEFT JOIN <<tenant>>_mdwdb.f_project_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( CAST(coalesce(FEI.amount ,0) as decimal(20,10)),'')<> COALESCE(TRGT.own_actual_loc_cost ,'')
