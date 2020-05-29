SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_portfolio.demand_actual_doc_cost' ELSE 'SUCCESS' END as Message
FROM (select * from #MDS_TABLE_SCHEMA.hp_pfm_portfolios_final where cdctype<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_portfolio TRGT
on SRC.sourceinstance=TRGT.source_id
and SRC.portfolio_id=TRGT.row_id
left join
(select pfm_proposal.PROP_PORTFOLIO_ID as portfolio_id,pfm_proposal.sourceinstance as sourceinstance,
sum(fm_forecast.ACTUAL_TOTAL_BSE)  as demand_cost_actual

from #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_proposal_final pfm_proposal
left join  #MDS_TABLE_SCHEMA.hp_fm_financial_summary_final fin_summary
on pfm_proposal.PROP_FINANCIAL_SUMMARY_ID = fin_summary.FINANCIAL_SUMMARY_ID
left join  #MDS_TABLE_SCHEMA.hp_fm_forecast_actual_period_sum_final fm_forecast
on fin_summary.FORECAST_ACTUAL_ID = fm_forecast.FORECAST_ACTUAL_ID

where pfm_proposal.cdctype <> 'D' and fm_forecast.period_id=-1 and pfm_proposal.PROP_PORTFOLIO_ID is not null
group by 1,2
)demand
on demand.portfolio_id=SRC.portfolio_id
and demand.sourceinstance=SRC.sourceinstance
where coalesce(demand.demand_cost_actual,0)<>coalesce(TRGT.demand_actual_doc_cost,'');