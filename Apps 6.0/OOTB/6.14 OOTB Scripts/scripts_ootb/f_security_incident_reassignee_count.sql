
select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'data validation failed for reassignee_count' ELSE 'SUCCESS' END as Message
from #DWH_TABLE_SCHEMA.f_security_incident TRGTF
left join
(select
D.row_key, count(*) as reassignee_count
 from #DWH_TABLE_SCHEMA.f_security_incident_activity T
join  #DWH_TABLE_SCHEMA.d_security_incident D
on (T.task_key= D.row_key
                               and T.task_wh_type='sn_si_incident'
                               and T.task_attribute_wh_name ='assigned_to'
                               and T.task_attribute_wh_old_value is not null 
) 
group by D.row_key
) cnt 
on TRGTF.security_incident_key=cnt.row_key
where TRGTF.soft_deleted_flag = 'N' and TRGTF.row_key not in (0,-1) and
coalesce(cnt.reassignee_count,0)<>coalesce(TRGTF.reassignee_count,'')  

