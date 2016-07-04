
select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'data validation failed for reassignee_count' ELSE 'SUCCESS' END as Message
from <<tenant>>_mdwdb.d_incident D
left join
(select
D.row_key, count(1) as reassignee_count
 from <<tenant>>_mdwdb.f_incident_activity T
join  <<tenant>>_mdwdb.d_incident D 
on (T.task_key= D.row_key
                                and T.task_wh_type='incident'
                                and T.task_attribute_wh_name ='assigned_to'
                               and T.task_attribute_wh_old_value is not null 
) 
group by D.row_key
) cnt 
on D.row_key=cnt.row_key
where D.soft_deleted_flag = 'N' and D.row_key not in (0,-1) and
coalesce(cnt.reassignee_count,0)<>coalesce(D.reassignee_count,'')  
