
select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'data validation failed for wh_new_value_key' ELSE 'SUCCESS' END as Message
from #DWH_TABLE_SCHEMA.d_incident D
left join #DWH_TABLE_SCHEMA.f_incident_activity T
on (T.task_key= D.row_key
                                and T.task_wh_type='incident'
                                and T.task_attribute_wh_name ='assigned_to'
                                                )
left join #DWH_TABLE_SCHEMA.d_internal_contact ICT
on( concat('INTERNAL_CONTACT~',T.task_attribute_wh_new_value) = ICT.row_id)

WHERE coalesce(T.task_attribute_wh_new_value_key,'') 
<>coalesce(case when T.task_attribute_wh_new_value is null then 0 
when T.task_attribute_wh_new_value = 'unspecified' then 0 else ICT.row_key end, -1)
