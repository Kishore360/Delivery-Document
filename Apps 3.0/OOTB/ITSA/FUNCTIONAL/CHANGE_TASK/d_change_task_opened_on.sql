select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_task.opened_on' ELSE 'SUCCESS' END as Message
from <<tenant>>_mdsdb.change_task_final SRC
left join <<tenant>>_mdwdb.d_change_task TRGT 
on (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id )
 where coalesce(convert_tz(SRC.opened_at, '<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'') <> coalesce(TRGT.opened_on,'')
 
