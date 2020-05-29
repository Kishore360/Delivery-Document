SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_portfolio_cost.row_id' ELSE 'SUCCESS' END as Message
 FROM
(select * from  #MDS_TABLE_SCHEMA.hp_pfm_portfolios_final) SRC
inner join
(select pfm_portfolio.PORTFOLIO_ID as row_id,
date_format(COALESCE(convert_tz(fiscal_period.START_DATE,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')),'%Y%m%d')
as calendar_date_key,pfm_portfolio.sourceinstance as sourceinstance,
sum(fm_forecast.ACTUAL_TOTAL_BSE)  as total_actual_doc_cost,
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
left join(select * from #DWH_TABLE_SCHEMA.f_portfolio_cost)TRGT
on coalesce(concat(SRC.portfolio_id,'~',temp.Calendar_Date_Key),'UNSPECIFIED')=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(temp.calendar_date_key,'')<> COALESCE(TRGT.calendar_date_key,'')

