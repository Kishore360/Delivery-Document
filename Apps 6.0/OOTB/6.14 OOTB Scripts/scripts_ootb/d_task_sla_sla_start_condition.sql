select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH data validation failed for sla_start_condition of contract_sla_final to d_task_sla' else 'SUCCESS' end as Message

from ( SELECT * FROM #MDS_TABLE_SCHEMA.contract_sla_final WHERE CDCTYPE<>'D') S

left join #DWH_TABLE_SCHEMA.d_task_sla DWH on S.sys_id = DWH.row_id and S.sourceinstance = DWH.source_id

where ifnull(S.start_condition,'') <> ifnull(DWH.sla_start_condition,'');