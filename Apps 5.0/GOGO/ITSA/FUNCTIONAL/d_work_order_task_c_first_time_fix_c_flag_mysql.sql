SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_by_key' ELSE 'SUCCESS' END as Message
 FROM 
gogo_mdwdb.d_work_order_task_c as dim
  join gogo_mdwdb.f_work_order_task_c as fct on  dim.row_key=fct.work_order_task_key
  join gogo_mdwdb.d_lov_map lov on fct.state_src_key=lov.src_key
  where  dim.soft_deleted_flag='N' and dim.first_time_fix_c_flag<>  case when lov.dimension_code='3' or (lov.dimension_code='4' and incomplete_reason in ('rerouted','airline_assistance','Opened_in_error')) then 'Y' else 'N' end