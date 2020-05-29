SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for F_PORTFOLIO.operating_loc_cost_target' ELSE 'SUCCESS' END as Message
FROM (select * from #MDS_TABLE_SCHEMA.hp_pfm_portfolios_final) SRC
left join #DWH_TABLE_SCHEMA.f_portfolio TRGT
on SRC.PORTFOLIO_ID=TRGT.ROW_ID
AND SRC.SOURCEINSTANCE=TRGT.SOURCE_ID
where COALESCE(TRGT.operating_loc_cost_target,'')<>0