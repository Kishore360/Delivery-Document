SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_portfolio.portfolio_cost_health_src_key' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM  #MDS_TABLE_SCHEMA.pfm_portfolios_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN  #DWH_TABLE_SCHEMA.d_portfolio TRGT 
 ON (SRC.id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN  #DWH_TABLE_SCHEMA.d_lov  LKP 
 ON (concat('PORTFOLIO','~','COST_VARIANCE_COLOR','~',cost_health) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.cost_health IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.portfolio_cost_variance_color_src_key,'')