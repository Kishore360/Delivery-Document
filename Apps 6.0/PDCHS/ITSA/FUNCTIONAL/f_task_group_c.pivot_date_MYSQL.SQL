SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_task_group_c.pivot_date' ELSE 'SUCCESS' END as Message
from
(select count(1) as CNT from  pdchs_mdsdb.task_group_final  SRC
left join pdchs_mdwdb.f_task_group_c TRGT on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
and SRC.sourceinstance=TRGT.source_id 
where SRC.sys_created_on<>TRGT.pivot_date 
AND SRC.CDCTYPE<>'D'
)temp;





