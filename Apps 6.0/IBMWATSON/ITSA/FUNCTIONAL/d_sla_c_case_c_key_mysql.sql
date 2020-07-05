
SELECT CASE WHEN count > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(
select count(1) as count 
-- select coalesce(a14.row_key,case when a12.task is null then 0 else -1 end),a122.case_c_key 
from
ibmwatson_mdsdb.task_sla_final a12
JOIN ibmwatson_mdsdb.task_final b ON a12.task=b.sys_id and a12.sourceinstance=b.sourceinstance and sys_class_name='sn_customerservice_case'
left join ibmwatson_mdwdb.d_case a14 on a12.task=a14.row_id and a12.sourceinstance=a14.source_id
 join ibmwatson_mdwdb.d_sla_c a122
on a122.row_id=a12.sys_id and a122.source_id=a12.sourceinstance
where coalesce(a14.row_key,case when a12.task is null then 0 else -1 end)<>a122.case_c_key)acv


