 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from 
 (select 

		case when i.short_description like '%Deploy%' then 'Deploy' when i.short_description like '%QE%' then 'QE' 
ElSE 'OTHER' END as change_task_type,trgt.change_task_type trgt_change_task_type
FROM tivo_mdsdb.change_task_final i
join tivo_mdwdb.d_change_task_c trgt on sys_id=row_id and sourceinstance=source_id
)b
where change_task_type<>trgt_change_task_type)a



