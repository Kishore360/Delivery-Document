SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_problem_task.due_on' ELSE 'SUCCESS' END as Message
/** select SRC.number,SRC.due_date,SRC.closed_at,SRC.sys_updated_on,lkp.dimension_name,TRGT.due_on,TRGT.closed_on,
TRGT1.due_on_key,TRGT1.closed_on_key,case when SRC.due_date is null then 'X'
 when (SRC.closed_at is null and lkp.dimension_name not in ('Closed','Resolved') AND SRC.due_date>sysdate() )then 'X'  
 when (SRC.closed_at is null and lkp.dimension_name not in ('Closed','Resolved') AND SRC.due_date<sysdate() )then 'N' 
 when SRC.due_date>coalesce(SRC.closed_at,SRC.sys_updated_on)  then 'Y'
  when SRC.due_date=coalesce(SRC.closed_at,SRC.sys_updated_on)  then 'Y'
 when SRC.due_date<coalesce(SRC.closed_at,SRC.sys_updated_on) then 'N' end exp_flag,TRGT.met_sla_due_date_flag_c **/
 FROM gilead_mdsdb.problem_task_final  SRC 
JOIN gilead_mdwdb.d_problem_task TRGT 
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id )
join gilead_mdwdb.f_problem_task TRGT1 
ON (SRC.sys_id  = TRGT1.row_id  
AND SRC.sourceinstance = TRGT1.source_id )
left join gilead_mdwdb.d_lov lkp
on TRGT1.state_src_key=lkp.row_key
 WHERE case when SRC.due_date is null then 'X'
 when (SRC.closed_at is null and lkp.dimension_name not in ('Closed','Resolved') AND SRC.due_date>sysdate() )then 'X'  
 when (SRC.closed_at is null and lkp.dimension_name not in ('Closed','Resolved') AND SRC.due_date<sysdate() )then 'N' 
 when SRC.due_date>coalesce(SRC.closed_at,SRC.sys_updated_on)  then 'Y'
  when SRC.due_date=coalesce(SRC.closed_at,SRC.sys_updated_on)  then 'Y'
 when SRC.due_date<coalesce(SRC.closed_at,SRC.sys_updated_on) then 'N' end <>TRGT.met_sla_due_date_flag_c;