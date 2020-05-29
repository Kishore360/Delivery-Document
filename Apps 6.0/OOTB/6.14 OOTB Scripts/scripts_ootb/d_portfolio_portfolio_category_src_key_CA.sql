SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_portfolio.portfolio_category_src_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.pfm_portfolios_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_portfolio TRGT 
 ON (SRC.id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
WHERE
TRGT.portfolio_category_src_key<>0 