SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_portfolio.is_active_flag' ELSE 'SUCCESS' END as Message
FROM ( select * from #MDS_TABLE_SCHEMA.pfm_portfolios_final where cdctype<>'D') SRC 
LEFT JOIN (select * from #DWH_TABLE_SCHEMA.d_portfolio) TRGT   
	ON SRC.id =TRGT.row_id 
    and SRC.sourceinstance=TRGT.source_id
WHERE coalesce(SRC.is_active,'')<>coalesce(TRGT.is_active_flag,'')