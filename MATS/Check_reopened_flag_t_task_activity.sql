

SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
, CASE WHEN COUNT(1) > 0 THEN 'reopened_flag not set correctly in t_task_activity' ELSE 'SUCCESS' END AS Message
from <<tenant>>_mdwdb.f_t_task_activity ta   
join <<tenant>>_mdwdb.d_lov_map lm   
on (ta.task_attribute_wh_old_value = lm.dimension_code and lm.dimension_class = 'STATE~INCIDENT')
join <<tenant>>_mdwdb.d_lov_map new_lm    
on (ta.task_attribute_wh_new_value =  new_lm.dimension_code and new_lm.dimension_class = 'STATE~INCIDENT' )
where ta.task_attribute_wh_name = 'state'    
and ta.task_wh_type = 'incident'   
and  CASE WHEN lm.dimension_wh_code in ( 'CLOSED','RESOLVED',2,3) 
and new_lm.dimension_wh_code in(1, 'OPEN') THEN 'Y' ELSE 'N' END <> reopened_flag
