SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_cost.row_id' ELSE 'SUCCESS' END as Message
FROM 
(select TRGT.actual_operating_doc_cost from (select * from  #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_project_final)SRC
left join(select * from  #MDS_TABLE_SCHEMA.hp_fm_financial_summary_final)fin_summary
on SRC.PRJ_FINANCIAL_SUMMARY_ID=fin_summary.FINANCIAL_SUMMARY_ID 
and SRC.sourceinstance=fin_summary.sourceinstance
inner join(select fs.FINANCIAL_SUMMARY_ID,period_id,sum(pc.PLAN_TOTAL_BSE) as plan_cost from
  #MDS_TABLE_SCHEMA.hp_fm_financial_summary_final fs 
left outer join  #MDS_TABLE_SCHEMA.hp_fm_forecast_actual_period_sum_final pc on pc.FORECAST_ACTUAL_ID=fs.FORECAST_ACTUAL_ID and pc.PERIOD_ID<>-1
where pc.cdctype<>'D'
group by 1,2)plan_cost
on fin_summary.financial_summary_id=plan_cost.financial_summary_id
left join(select fs.FINANCIAL_SUMMARY_ID,period_id,sum(bene.PLANNED_VALUE_BSE) as plan_bene, bene.last_updated_by  from
  #MDS_TABLE_SCHEMA.hp_fm_financial_summary_final fs 
left outer join  #MDS_TABLE_SCHEMA.hp_fm_benefit_period_sum_final bene on bene.BENEFIT_ID=fs.BENEFIT_ID and bene.PERIOD_ID<>-1 
where bene.cdctype<>'D'
group by 1,2)planned_benefit
on plan_cost.financial_summary_id=planned_benefit.financial_summary_id
and plan_cost.period_id=planned_benefit.period_id
left join(select * from  #MDS_TABLE_SCHEMA.hp_ppm_fiscal_periods_nls_final)fiscal_period
on plan_cost.period_id=fiscal_period.fiscal_period_id
and SRC.sourceinstance=fiscal_period.sourceinstance
left join(select * from  #DWH_TABLE_SCHEMA.f_project_cost)TRGT
on COALESCE(CONCAT('PLAN_RETURN_BENEFIT~',SRC.PRJ_PROJECT_ID, '~',SRC.PRJ_FINANCIAL_SUMMARY_ID,
'~',fiscal_period.FISCAL_PERIOD_ID),'UNSPECIFIED')=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
WHERE planned_benefit.period_id is not null
and  COALESCE(TRGT.actual_operating_doc_cost,'')<>0
union
select TRGT.actual_operating_doc_cost from(select * from  #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_project_final)SRC
left join(select * from  #MDS_TABLE_SCHEMA.hp_fm_financial_summary_final)fin_summary
on SRC.PRJ_FINANCIAL_SUMMARY_ID=fin_summary.FINANCIAL_SUMMARY_ID 
and SRC.sourceinstance=fin_summary.sourceinstance
inner join(select fs.FINANCIAL_SUMMARY_ID,period_id,sum(pc.PLAN_TOTAL_BSE) as plan_cost,pc.last_updated_by from
  #MDS_TABLE_SCHEMA.hp_fm_financial_summary_final fs 
left outer join  #MDS_TABLE_SCHEMA.hp_fm_forecast_actual_period_sum_final pc on pc.FORECAST_ACTUAL_ID=fs.FORECAST_ACTUAL_ID and pc.PERIOD_ID<>-1
where pc.cdctype<>'D'
group by 1,2)plan_cost
on fin_summary.financial_summary_id=plan_cost.financial_summary_id
left join(select fs.FINANCIAL_SUMMARY_ID,period_id,sum(bene.PLANNED_VALUE_BSE) as plan_bene from
  #MDS_TABLE_SCHEMA.hp_fm_financial_summary_final fs 
left outer join  #MDS_TABLE_SCHEMA.hp_fm_benefit_period_sum_final bene on bene.BENEFIT_ID=fs.BENEFIT_ID and bene.PERIOD_ID<>-1 
where bene.cdctype<>'D'
group by 1,2)planned_benefit
on plan_cost.financial_summary_id=planned_benefit.financial_summary_id
and plan_cost.period_id=planned_benefit.period_id
left join(select * from  #MDS_TABLE_SCHEMA.hp_ppm_fiscal_periods_nls_final)fiscal_period
on plan_cost.period_id=fiscal_period.fiscal_period_id
and SRC.sourceinstance=fiscal_period.sourceinstance
left join(select * from  #DWH_TABLE_SCHEMA.f_project_cost)TRGT
on COALESCE(CONCAT('PLAN_RETURN_COST~',SRC.PRJ_PROJECT_ID, '~',SRC.PRJ_FINANCIAL_SUMMARY_ID,
'~',fiscal_period.FISCAL_PERIOD_ID),'UNSPECIFIED')=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
WHERE planned_benefit.period_id is null
and   COALESCE(TRGT.actual_operating_doc_cost,'')<>0
)SQ

