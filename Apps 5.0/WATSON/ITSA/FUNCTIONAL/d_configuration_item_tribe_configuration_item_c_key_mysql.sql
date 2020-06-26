SELECT CASE WHEN count > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(
select count(1) as count 
from ibmwatson_mdsdb.task_final a12
left join ibmwatson_mdsdb.cmdb_ci_final a123 on a12.cmdb_ci=a123.sys_id and a12.sourceinstance=2
left join ibmwatson_mdwdb.f_task f on a12.sys_id=row_id and a12.sourceinstance=f.source_id
left join ibmwatson_mdwdb.d_task d on f.task_key=d.row_key
left JOIN  ibmwatson_mdwdb.d_configuration_item a13 ON a13.row_key =d.configuration_item_key 
left join ibmwatson_mdwdb.d_tribe_c a14 on a123.u_tribe=a14.row_id and a123.sourceinstance=a14.source_id
where coalesce(a14.row_key,case when a123.u_tribe is null then 0 else -1 end)<>
 a13.tribe_configuration_item_c_key )a;