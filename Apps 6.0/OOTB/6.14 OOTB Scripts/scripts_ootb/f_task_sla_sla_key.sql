select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for sla_key of task_sla_final to f_task_sla' else 'SUCCESS' end as Message
from ( SELECT * FROM #MDS_TABLE_SCHEMA.task_sla_final WHERE CDCTYPE<>'D') S

left join #DWH_TABLE_SCHEMA.d_task_sla D on D.row_id = S.sla and D.source_id = S.sourceinstance
left join #DWH_TABLE_SCHEMA.f_task_sla DWH on DWH.row_id = S.sys_id and DWH.source_id = S.sourceinstance

where ifnull(D.row_key,case when S.sla is null then 0 else -1 end) <> ifnull(DWH.sla_key,'');
