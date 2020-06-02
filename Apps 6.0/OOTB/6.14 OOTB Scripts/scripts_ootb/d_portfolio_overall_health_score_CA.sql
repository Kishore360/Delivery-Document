SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_portfolio.overall_health_score' ELSE 'SUCCESS' END as Message
FROM (select * from  #MDS_TABLE_SCHEMA.pfm_portfolios_final  where  cdctype<>'D') SRC 
LEFT JOIN (select * from  #DWH_TABLE_SCHEMA.d_portfolio)TRGT   
	ON SRC.id =TRGT.row_id 
	and SRC.sourceinstance=TRGT.source_id
where ROUND(case when SRC.cost_health is null or SRC.resource_health is null or SRC.schedule_health is null then 0
else (SRC.cost_health+SRC.resource_health+SRC.schedule_health)/3 end) <> COALESCE(TRGT.overall_health_score,'')