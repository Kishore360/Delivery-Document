


 
    
 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
   
   select count(1) as cnt
   from  nbcu_mdsdb.task_final i 
  left join nbcu_mdsdb.problem_final pr on pr.sys_id=i.sys_id and pr.sourceinstance=i.sourceinstance 
  join nbcu_mdwdb.f_task_c f
  on i.sys_id=f.row_id and i.sourceinstance=f.source_id and i.sys_class_name ='PROBLEM'
  where 
CASE WHEN (pr.u_validated_at is null or pr.closed_at is null) THEN NULL
   WHEN TIMESTAMPDIFF(SECOND,pr.opened_at,pr.u_validated_at) < 0 THEN NULL
   ELSE TIMESTAMPDIFF(SECOND,pr.opened_at,pr.u_validated_at) end <>f.OPEN_TO_X_DURATION)x
   
   
   
;