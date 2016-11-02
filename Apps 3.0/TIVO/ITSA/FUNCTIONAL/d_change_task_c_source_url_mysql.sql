 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from 
 (select 

		CONCAT('<a href=\"','https://tivo.service-now.com/navpage.do/','change_task.do?sys_id=',i.sys_id,'\" target=\"_blank\">',i.number,'</a>') AS source_url,
trgt.source_url  trgt_source_url
		
FROM tivo_mdsdb.change_task_final i
join tivo_mdwdb.d_change_task_c trgt on sys_id=row_id and sourceinstance=source_id
)b
where  source_url<>trgt_source_url )a



