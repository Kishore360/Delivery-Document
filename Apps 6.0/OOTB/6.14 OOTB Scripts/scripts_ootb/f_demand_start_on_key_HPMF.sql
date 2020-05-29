SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for the column f_demand.start_on_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM  #MDS_TABLE_SCHEMA.hp_kcrt_requests_final where cdctype <> 'D') SRC 
 inner join(select * from #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_proposal_final)SRC1
on SRC.request_id=SRC1.request_id
and SRC.sourceinstance=SRC1.sourceinstance
left join(select * from #MDS_TABLE_SCHEMA.hp_ppm_fiscal_periods_nls_final)SRC2
on SRC1.PROP_PLAN_START_PERIOD_ID = SRC2.FISCAL_PERIOD_ID
and SRC1.sourceinstance=SRC2.sourceinstance
LEFT JOIN #DWH_TABLE_SCHEMA.f_demand TRGT 
ON (SRC.request_id=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id )
WHERE COALESCE(DATE_FORMAT(CONVERT_TZ(SRC2.start_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d'),'')
<> COALESCE(TRGT.START_ON_KEY,0)