SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(
select count(*) as cnt from rei_mdwdb.f_time_entry fi JOIN rei_mdsdb.time_card_final  f ON (substring(fi.row_id,1,32) =f.sys_id) 
join rei_mdwdb.d_task task on task.row_id=COALESCE(f.task,'UNSPECIFIED')
and fi.task_key <> task.row_key and fi.row_key < 100) c; 
