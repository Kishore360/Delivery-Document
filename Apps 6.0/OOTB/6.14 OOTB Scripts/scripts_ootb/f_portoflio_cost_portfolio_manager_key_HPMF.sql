SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_portfolio_cost.row_id' ELSE 'SUCCESS' END as Message
 FROM
(select * from  #MDS_TABLE_SCHEMA.hp_pfm_portfolios_final) SRC
inner join
(select pfm_portfolio.PORTFOLIO_ID as row_id,
date_format(COALESCE(convert_tz(fiscal_period.START_DATE,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')),'%Y%m%d')
as Calendar_Date_Key,pfm_portfolio.sourceinstance as sourceinstance,
sum(fm_forecast.ACTUAL_TOTAL_BSE)  as Total_Actual_Doc_Cost,
sum(fm_forecast.PLAN_TOTAL_BSE) as Total_Planned_Doc_Cost
from  #MDS_TABLE_SCHEMA.hp_pfm_portfolios_final pfm_portfolio
left join  #MDS_TABLE_SCHEMA.hp_fm_financial_summary_final fin_summary
on pfm_portfolio.FINANCIAL_SUMMARY_ID = fin_summary.FINANCIAL_SUMMARY_ID
left join  #MDS_TABLE_SCHEMA.hp_fm_forecast_actual_period_sum_final fm_forecast
on fin_summary.FORECAST_ACTUAL_ID = fm_forecast.FORECAST_ACTUAL_ID
inner join  #MDS_TABLE_SCHEMA.hp_ppm_fiscal_periods_nls_final fiscal_period
on fm_forecast.PERIOD_ID = fiscal_period.FISCAL_PERIOD_ID
where pfm_portfolio.cdctype <> 'D'
group by 1,2)temp
on SRC.portfolio_id=temp.row_id
and SRC.sourceinstance=temp.sourceinstance
left join(select min(user_id) as manager_id,portfolio_id from #MDS_TABLE_SCHEMA.hp_pfm_portfolio_managers_final group by portfolio_id)manager
on SRC.portfolio_id=manager.portfolio_id
left join(select * from #DWH_TABLE_SCHEMA.f_portfolio_cost)TRGT
on coalesce(concat(SRC.portfolio_id,'~',temp.Calendar_Date_Key),'UNSPECIFIED')=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
left join  #DWH_TABLE_SCHEMA.d_internal_contact INT_CON
on concat('INTERNAL_CONTACT~',manager.manager_id) = INT_CON.row_id
and SRC.sourceinstance=INT_CON.source_id
WHERE COALESCE(INT_CON.row_key,CASE WHEN manager.manager_id IS NULL THEN 0 else '-1' end)
<> COALESCE(TRGT.portfolio_manager_key,0); 

