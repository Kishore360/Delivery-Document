SELECT CASE WHEN count > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(
select count(1) as count 
 -- select  b.cmdb_ci,a.sys_id,a.u_tribe,d.row_id,f.segment_c_key,d.segment_c_key
from ibmwatson_mdsdb.task_sla_final a1
JOIN ibmwatson_mdsdb.task_final b ON a1.task=b.sys_id and a1.sourceinstance=b.sourceinstance and sys_class_name='problem'
join ibmwatson_mdsdb.cmdb_ci_final a on b.cmdb_ci=a.sys_id and a1.sourceinstance=2
join ibmwatson_mdwdb.d_tribe_c d on a.u_tribe=d.row_id and a.sourceinstance=d.source_id and a.cdctype<>'D'
join ibmwatson_mdwdb.f_task_sla f on a1.sys_id=f.row_id and f.source_id=2
where f.segment_c_key<>d.segment_c_key)a;

