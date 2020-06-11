
select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'data validation failed for wh_old_value_key assigned_to' ELSE 'SUCCESS' END as Message
from #DWH_TABLE_SCHEMA.d_incident D
left join #DWH_TABLE_SCHEMA.f_incident_activity T
on (T.task_key= D.row_key
                                and T.task_wh_type='incident'
                                and T.task_attribute_wh_name ='assigned_to'
)
left join #DWH_TABLE_SCHEMA.d_internal_contact ICF
on( concat('INTERNAL_CONTACT~',T.task_attribute_wh_old_value) = ICF.row_id)
WHERE coalesce(T.task_attribute_wh_old_value_key,'')<>coalesce(case when T.task_attribute_wh_old_value is null then 0 else ICF.row_key end,-1)
