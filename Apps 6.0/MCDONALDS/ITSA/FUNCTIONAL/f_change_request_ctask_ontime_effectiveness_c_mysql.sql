SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_change_request.ctask_ontime_effectiveness_c' ELSE 'SUCCESS' END as Message 
from mcd_mdsdb.change_request_final src
join mcd_mdwdb.f_change_request f
on src.sys_id=f.row_id and src.sourceinstance=f.source_id
join (select tmp.change_request_key,
case when round(((tmp.change_sum/(tmp.change_task_key_count*1.0))*100))>95 then 5
when round(((tmp.change_sum/(tmp.change_task_key_count*1.0))*100)) between 67 and 95 then 3
when round(((tmp.change_sum/(tmp.change_task_key_count*1.0))*100))<=66 then 1 end
as der
from mcd_mdwdb.f_change_request fact
join
(select change_request_key,count(a1.change_task_key) as change_task_key_count,
sum(case when a2.closed_on <a3.planned_end_on then 1 else 0 end) as change_sum
from mcd_mdwdb.f_change_task a1
join mcd_mdwdb.d_change_task a2
on a1.change_task_key=a2.row_key
join mcd_mdwdb.d_change_request a3
on a1.change_request_key=a3.row_key
join mcd_mdwdb.d_lov_map map
on a1.state_src_key=map.src_key and map.dimension_class='STATE~CHANGE_TASK'  and map.dimension_wh_code='CLOSED'
where a1.change_request_key>0
group by 1)tmp
on fact.change_request_key=tmp.change_request_key)calc
on f.change_request_key=calc.change_request_key
where f.ctask_ontime_effectiveness_c<>calc.der;