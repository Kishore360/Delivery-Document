SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.change_task_final a
left join intuit_mdwdb.f_change_task c 
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
left join intuit_mdwdb.d_lov b
on  b.src_rowid =CONCAT('CONTACT_TYPE','~','CHANGE_TASK','~','~','~',UPPER(a.CONTACT_TYPE))
 AND a.sourceinstance= b.source_id  

where  COALESCE(b.row_key,CASE WHEN a.CONTACT_TYPE IS NULL THEN 0 else -1 end)<>c.reported_type_src_key)x