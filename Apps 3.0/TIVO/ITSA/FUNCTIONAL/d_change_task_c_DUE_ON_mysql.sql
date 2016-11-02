 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from 
 (select 
CONVERT_TZ(i.DUE_DATE,'GMT','America/Los_Angeles') AS DUE_ON, trgt.DUE_ON trgt_DUE_ON
FROM tivo_mdsdb.change_task_final i
join tivo_mdwdb.d_change_task_c trgt on sys_id=row_id and sourceinstance=source_id
)b
where trgt_DUE_ON<>DUE_ON)a



