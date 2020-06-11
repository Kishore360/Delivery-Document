SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
  FROM (select  count(1) as cnt
  FROM #MDS_TABLE_SCHEMA.problem_final p 
 LEFT JOIN #MDS_TABLE_SCHEMA.sys_user_final su 
ON p.opened_by=su.sys_id AND p.SourceInstance=su.SourceInstance
 Left join #DWH_TABLE_SCHEMA.f_problem sp 
on sp.row_id=p.sys_id and sp.source_id=p.sourceinstance
 left  join #DWH_TABLE_SCHEMA.d_internal_organization c 
on concat('DEPARTMENT~',su.department)=c.row_id 
 AND c.source_id =  su.sourceinstance  
 where COALESCE(c.row_key,case when su.department IS NULL then 0 else  -1 end )
<> sp.opened_by_department_key )x