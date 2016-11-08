
 
 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from 
 (select 
CONVERT_TZ(i.DUE_DATE,'GMT','America/Los_Angeles') AS DUE_ON, trgt.DUE_ON trgt_DUE_ON,
CONVERT_TZ(i.CLOSED_AT,'GMT','America/Los_Angeles') AS CLOSED_ON,trgt.CLOSED_ON trgt_CLOSED_ON,
CONVERT_TZ(i.expected_start,'GMT','America/Los_Angeles') AS expected_start,trgt.expected_start trgt_expected_start,
i.short_description AS SHORT_DESCRIPTION,trgt.SHORT_DESCRIPTION trgt_SHORT_DESCRIPTION,
		CONCAT('<a href=\"','https://tivo.service-now.com/nav_to.do','?uri=change_task.do?sys_id=',i.sys_id,'\" target=\"_blank\">',i.number,'</a>') AS source_url,
trgt.source_url  trgt_source_url,
		i.DESCRIPTION AS DESCRIPTION,trgt.DESCRIPTION trgt_DESCRIPTION,
		CONVERT_TZ(i.OPENED_AT,'GMT','America/Los_Angeles') AS OPENED_ON,trgt.OPENED_ON trgt_OPENED_ON,
		i.number as change_task_number ,trgt.change_task_number trgt_change_task_number,
		IF (i.MADE_SLA= 1,'Y','N') AS MET_SLA_FLAG,trgt.MET_SLA_FLAG trgt_MET_SLA_FLAG,
		case when i.short_description like '%Deploy%' then 'Deploy' when i.short_description like '%QE%' then 'QE' ElSE 'OTHER' END as
 change_task_type,trgt.change_task_type trgt_change_task_type
FROM tivo_mdsdb.change_task_final i
join tivo_mdwdb.d_change_task_c trgt on sys_id=row_id and sourceinstance=source_id
)ab
where trgt_DUE_ON<>DUE_ON or trgt_CLOSED_ON<>CLOSED_ON or trgt_expected_start<>expected_start
or SHORT_DESCRIPTION<>trgt_SHORT_DESCRIPTION or source_url<>trgt_source_url or trgt_DESCRIPTION<>DESCRIPTION
or OPENED_ON<>trgt_OPENED_ON or change_task_number<>trgt_change_task_number or trgt_MET_SLA_FLAG<>MET_SLA_FLAG
or change_task_type<>trgt_change_task_type)a;


