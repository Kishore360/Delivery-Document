SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1) >0 THEN 
'MDS to DWH data validation failed for f_workload_ci_hier_c.pivot_date' ELSE 'SUCCESS' END as Message 
FROM  
-- select coalesce(lkp.row_key,case when a11.parent is NULL then 0 else -1 end),trgt.workload_ci_c_key from 
(SELECT parent,child,sourceinstance FROM truist_workdb.rel_final_set1_c GROUP BY 1,2,3) a11
JOIN truist_mdsdb.cmdb_ci_final a12 
on a11.child = a12.sys_id and a11.sourceinstance = a12.sourceinstance
join truist_mdwdb.f_workload_ci_hier_c trgt
on  CONCAT(a11.parent,'~',a11.child)=trgt.row_id and a12.sourceinstance=trgt.source_id
where CONVERT_TZ(a12.sys_created_on,'GMT','America/Los_Angeles')<>trgt.pivot_date
and a12.cdctype='X';
