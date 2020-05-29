SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.closed_on_key' ELSE 'SUCCESS' END as Message
from (SELECT * FROM #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final WHERE CDCTYPE<>'D') SRC
left join (SELECT * FROM #DWH_TABLE_SCHEMA.d_change_failure where year(effective_to)=2999) TRGT 
ON (SRC.infrastructure_change_id=TRGT.row_id 
AND SRC.sourceinstance =TRGT.source_id )
left join #DWH_TABLE_SCHEMA.d_calendar_date LKP
on coalesce(date_format(COALESCE(convert_tz(SRC.closed_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')),'%Y%m%d'))
 = LKP.row_id 
WHERE COALESCE( LKP.row_key, case when SRC.closed_date is null then 0 else -1 end)<> COALESCE(TRGT.closed_on_key,'')