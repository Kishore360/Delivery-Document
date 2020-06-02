SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_portfolio.demand_actual_loc_cost' ELSE 'SUCCESS' END as Message
FROM (select * from #MDS_TABLE_SCHEMA.hp_pfm_portfolios_final where cdctype<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_portfolio TRGT
on SRC.sourceinstance=TRGT.source_id
and SRC.portfolio_id=TRGT.row_id
left join #DWH_TABLE_SCHEMA.f_demand dem
on dem.portfolio_key=TRGT.row_key
and dem.portfolio_key=TRGT.portfolio_key
where coalesce(TRGT.demand_actual_loc_cost,'')<>0;