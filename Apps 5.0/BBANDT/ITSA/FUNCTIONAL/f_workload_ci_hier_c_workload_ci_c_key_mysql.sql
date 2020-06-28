SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1) >0 THEN 
'MDS to DWH data validation failed for f_workload_ci_hier_c.workload_ci_c_key' ELSE 'SUCCESS' END as Message 
FROM  
-- select coalesce(lkp.row_key,case when a11.parent is NULL then 0 else -1 end),trgt.workload_ci_c_key from 
(SELECT parent,child,sourceinstance FROM bbandt_workdb.rel_final_set1_c GROUP BY 1,2,3) a11
JOIN bbandt_mdsdb.cmdb_ci_final a12 
on a11.child = a12.sys_id and a11.sourceinstance = a12.sourceinstance
join bbandt_mdwdb.f_workload_ci_hier_c trgt
on  CONCAT(a11.parent,'~',a11.child)=trgt.row_id and a12.sourceinstance=trgt.source_id
join bbandt_workdb.d_configuration_item lkp 
on a11.parent=lkp.row_id 
where coalesce(lkp.row_key,case when a11.parent is NULL then 0 else -1 end)<>trgt.workload_ci_c_key
and a12.cdctype='X';
