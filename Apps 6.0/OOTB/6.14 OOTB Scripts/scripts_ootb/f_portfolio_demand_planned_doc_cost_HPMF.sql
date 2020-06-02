SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for F_PORTFOLIO.ROW_ID' ELSE 'SUCCESS' END as Message
FROM (select * from #MDS_TABLE_SCHEMA.hp_pfm_portfolios_final where cdctype<>'D') SRC
left join (select * from #DWH_TABLE_SCHEMA.f_portfolio)TRGT
 on SRC.PORTFOLIO_ID=TRGT.ROW_ID
AND SRC.SOURCEINSTANCE=TRGT.SOURCE_ID
left join(select portfolio_key, coalesce(sum(planned_doc_cost),0) as demand_planned_cost,source_id  from #DWH_TABLE_SCHEMA.f_demand
group by portfolio_key)LKP
on TRGT.portfolio_key=LKP.portfolio_key
and TRGT.source_id=LKP.source_id
WHERE COALESCE(LKP.demand_planned_cost,CASE WHEN LKP.portfolio_key IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.demand_planned_doc_cost,0)


