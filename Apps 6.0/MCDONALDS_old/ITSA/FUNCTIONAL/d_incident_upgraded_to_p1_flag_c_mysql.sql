SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'DWH to DWH data validation failed for d_incident.upgraded_to_p1_flag_c' ELSE 'SUCCESS' END as Message 
FROM  mcd_mdwdb.d_incident dim
 join(
select f.incident_key,f.primary_sequence_id,l2.dimension_name as new,l1.dimension_name as next,f.primary_duration,
sum(case when l1.dimension_name='1 - Critical' then 1 else 0 end) as upgraded,
sum(case when l2.dimension_name='1 - Critical' then 1 else 0 end) as downgraded,
count(f.row_key) as cnt
from mcd_mdwdb.f_incident_activity f
join mcd_mdwdb.d_incident di on f.incident_key=di.row_key
join mcd_mdwdb.d_lov l1 on f.task_attribute_wh_next_value_key=l1.row_key
join mcd_mdwdb.d_lov l2 on f.task_attribute_wh_new_value_key=l2.row_key
 where f.task_attribute_wh_name='priority' 
 group by f.incident_key)tmp
 on dim.row_key=tmp.incident_key
 where dim.upgraded_to_p1_flag_c<>(case when cnt>1 and tmp.upgraded>0 then 'Y' else 'N' end) and dim.soft_deleted_flag='N';