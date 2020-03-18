SELECT CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_task_sla.opened_on_key' ELSE 'SUCCESS' END as Message
FROM
(
select count(1) as CNT
from
ntrust_mdsdb.task_sla_final SRC
JOIN ntrust_mdwdb.f_task_sla TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )
join
ntrust_mdsdb.task_final SRC1
on SRC.task=SRC1.sys_id join
ntrust_mdwdb.d_calendar_date LKP
on (DATE_FORMAT(coalesce(SRC1.opened_at,SRC1.sys_created_on),'%Y%m%d'))=TRGT.row_id 
where
TRGT.opened_on_key<>COALESCE(LKP.row_key,case when coalesce(SRC1.opened_at,SRC1.sys_created_on)=0 then 0 else -1 end )
and SRC.cdctype='X'
) temp;