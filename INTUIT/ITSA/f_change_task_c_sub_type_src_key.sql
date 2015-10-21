SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.change_task_final a
left join intuit_mdwdb.f_change_task_c c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
left join intuit_mdwdb.d_lov b
on concat('SUB_TYPE','~','CHANGE_TASK','~','~','~',upper(a.u_sub_type))= b.src_rowid 
 AND a.sourceinstance= b.source_id  
where dimension_class='SUB_TYPE~CHANGE_TASK' and b.row_key <> c.sub_type_src_key) g