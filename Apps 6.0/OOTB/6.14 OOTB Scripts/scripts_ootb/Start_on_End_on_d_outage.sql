select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'START_ON, END_ON validation failed for d_outage' ELSE 'SUCCESS' END as Message
from #DWH_TABLE_SCHEMA.d_outage TGT
left join ( SELECT * FROM #MDS_TABLE_SCHEMA.cmdb_ci_outage_final WHERE CDCTYPE<>'D') SRC
on TGT.row_id = SRC.sys_id
where TGT.START_ON<>convert_tz(SRC.BEGIN,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')
and TGT.END_ON<>convert_tz(SRC.END,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'); 
