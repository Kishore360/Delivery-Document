
select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'data validation failed for wh_old_value_key' ELSE 'SUCCESS' END as Message
from <<tenant>>_mdwdb.f_incident_activity T
join <<tenant>>_mdwdb.d_incident D
on (T.task_key= D.row_key
                                and T.task_wh_type='incident'
                                and T.task_attribute_wh_name ='assignment_group'
                                               )
left join <<tenant>>_mdwdb.d_internal_organization ICF
on( concat('GROUP~',T.task_attribute_wh_old_value) = ICF.row_id)
WHERE coalesce(T.task_attribute_wh_old_value_key,'')<>coalesce(case when T.task_attribute_wh_old_value is null then 0 else ICF.row_key end,-1);
