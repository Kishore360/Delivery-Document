SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for F_PORTFOLIO.created_on' ELSE 'SUCCESS' END as Message
FROM (select * from #MDS_TABLE_SCHEMA.hp_pfm_portfolios_final where cdctype<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_portfolio TRGT
on SRC.portfolio_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where coalesce(convert_tz(SRC.creation_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'')<>coalesce(TRGT.created_on,'')