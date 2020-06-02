SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_portfolio.portfolio_key' ELSE 'SUCCESS' END as Message
FROM (select * from #MDS_TABLE_SCHEMA.pfm_portfolios_final where cdctype<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_portfolio TRGT
on SRC.ID =TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
left join #DWH_TABLE_SCHEMA.d_portfolio prf
on COALESCE(SRC.ID,'UNSPECIFIED')=prf.row_id
where COALESCE(prf.row_key,'UNSPECIFIED')<>COALESCE(TRGT.portfolio_key,'')




