SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_project.PLANNED_START_ON' ELSE 'SUCCESS' END as Message
from (select * from  #MDS_TABLE_SCHEMA.hp_pm_projects_final where cdctype<>'D') SRC1
left join (select * from #MDS_TABLE_SCHEMA.hp_ppm_fiscal_periods_nls_final)SRC2
on SRC1.START_DATE_PERIOD=SRC2.FISCAL_PERIOD_ID 
AND SRC1.sourceinstance=SRC2.sourceinstance 
left join #DWH_TABLE_SCHEMA.d_project TRGT
on SRC1.project_id=TRGT.row_id
and SRC1.sourceinstance=TRGT.source_id
where coalesce(CONVERT_TZ(SRC2.START_DATE,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')<>coalesce(TRGT.PLANNED_START_ON,'');