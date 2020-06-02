SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_portfolio.operating_doc_cost_target1' ELSE 'SUCCESS' END as Message
FROM (select * from #MDS_TABLE_SCHEMA.pfm_portfolios_final where cdctype<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_portfolio TRGT
on SRC.ID =TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where coalesce(SRC.operating_cost_target,0)<>coalesce(TRGT.operating_doc_cost_target,'')





