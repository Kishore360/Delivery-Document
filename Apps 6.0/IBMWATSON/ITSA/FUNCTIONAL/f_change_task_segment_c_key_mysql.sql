SELECT CASE WHEN count > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(
select count(1) as count 
-- select  a1.number,a1.cmdb_ci,a.sys_id,a.u_tribe,d.row_id,f.segment_c_key,d.segment_c_key
from ibmwatson_mdsdb.change_task_final a1 
join ibmwatson_mdsdb.cmdb_ci_final a on a1.cmdb_ci=a.sys_id and a1.sourceinstance=2
join ibmwatson_mdwdb.d_tribe_c d on a.u_tribe=d.row_id and a.sourceinstance=d.source_id and a.cdctype<>'D'
join ibmwatson_mdwdb.f_change_task f on a1.sys_id=f.row_id and f.source_id=2
where f.segment_c_key<>d.segment_c_key)a;

