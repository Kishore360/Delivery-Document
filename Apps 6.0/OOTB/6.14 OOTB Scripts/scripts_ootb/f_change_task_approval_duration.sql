			
select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for f_change_task_approval_duration' else 'SUCCESS' end as Message 
from
( SELECT * FROM #MDS_TABLE_SCHEMA.change_task_final WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_change_task TRGT on (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 where 
 (CASE 
                WHEN (SRC.opened_at is null  or SRC.approval_set is null) THEN NULL   
                WHEN TIMESTAMPDIFF(SECOND,SRC.opened_at,SRC.approval_set) < 0 THEN NULL    
                ELSE TIMESTAMPDIFF(SECOND,SRC.opened_at,SRC.approval_set) 
                end )<> TRGT.approval_duration
