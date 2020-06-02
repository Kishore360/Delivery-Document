SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_portfolio.others_planned_doc_cost' ELSE 'SUCCESS' END as Message
FROM(select * from #MDS_TABLE_SCHEMA.hp_pfm_portfolios_final where cdctype<>'D') SRC
left join 
(select pfm_portfolio.PORTFOLIO_ID as portfolio_id,pfm_portfolio.sourceinstance as sourceinstance,
SUM(fm_forecast.PLAN_TOTAL_BSE) as total_planned_doc_cost

from  #MDS_TABLE_SCHEMA.hp_pfm_portfolios_final pfm_portfolio
left join  #MDS_TABLE_SCHEMA.hp_fm_financial_summary_final fin_summary
on pfm_portfolio.FINANCIAL_SUMMARY_ID = fin_summary.FINANCIAL_SUMMARY_ID
left join  #MDS_TABLE_SCHEMA.hp_fm_forecast_actual_period_sum_final fm_forecast
on fin_summary.FORECAST_ACTUAL_ID = fm_forecast.FORECAST_ACTUAL_ID

where pfm_portfolio.cdctype <> 'D' and fm_forecast.period_id=-1 and pfm_portfolio.portfolio_id is not null
group by 1,2)portfolio
on portfolio.portfolio_id=SRC.portfolio_id
and portfolio.sourceinstance=SRC.sourceinstance
left join 
(select pfm_project.PRJ_PORTFOLIO_ID as portfolio_id,pfm_project.sourceinstance as sourceinstance,
SUM(fm_forecast.PLAN_TOTAL_BSE) AS project_cost

from  #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_project_final pfm_project
left join  #MDS_TABLE_SCHEMA.hp_fm_financial_summary_final fin_summary
on pfm_project.PRJ_FINANCIAL_SUMMARY_ID = fin_summary.FINANCIAL_SUMMARY_ID
left join  #MDS_TABLE_SCHEMA.hp_fm_forecast_actual_period_sum_final fm_forecast
on fin_summary.FORECAST_ACTUAL_ID = fm_forecast.FORECAST_ACTUAL_ID

where pfm_project.cdctype <> 'D' and fm_forecast.period_id=-1 and pfm_project.PRJ_PORTFOLIO_ID is not null
group by 1,2
)project
on project.portfolio_id=SRC.portfolio_id
and project.sourceinstance=SRC.sourceinstance
left join
(select pfm_proposal.PROP_PORTFOLIO_ID as portfolio_id,pfm_proposal.sourceinstance as sourceinstance,
SUM(fm_forecast.PLAN_TOTAL_BSE) AS demand_planned_cost

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
left join #DWH_TABLE_SCHEMA.f_portfolio port
on port.row_id=SRC.portfolio_id
and port.source_id=SRC.sourceinstance
where coalesce((coalesce(portfolio.total_planned_doc_cost,0)-coalesce(project.project_cost,0)-coalesce(demand.demand_planned_cost,0)),0)<>
round(coalesce(port.others_planned_doc_cost,''),5)