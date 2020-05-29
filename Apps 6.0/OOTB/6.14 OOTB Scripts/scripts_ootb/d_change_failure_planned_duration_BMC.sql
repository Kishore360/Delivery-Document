SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.planned_duration' ELSE 'SUCCESS' END as Message
from (SELECT * FROM #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final WHERE CDCTYPE<>'D') SRC
left join (SELECT * FROM #DWH_TABLE_SCHEMA.d_change_failure where year(effective_to)=2999) TRGT 
ON (SRC.infrastructure_change_id=TRGT.row_id 
AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(CASE  WHEN CONVERT_TZ(SRC.Scheduled_End_Date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')  < CONVERT_TZ(SRC.Scheduled_Start_Date,
'<<TENANT_SSI_TIME_ZONE>>', '<<DW_TARGET_TIME_ZONE>>') THEN  0 ELSE COALESCE(TIMESTAMPDIFF(SECOND,CONVERT_TZ(SRC.Scheduled_Start_Date,'<<TENANT_SSI_TIME_ZONE>>', '<<DW_TARGET_TIME_ZONE>>'),
 CONVERT_TZ(SRC.Scheduled_End_Date,'<<TENANT_SSI_TIME_ZONE>>', '<<DW_TARGET_TIME_ZONE>>')),0) END,0) <> COALESCE(TRGT.planned_duration ,'')