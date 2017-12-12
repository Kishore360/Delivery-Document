
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_portfolio.changed_by' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.pm_portfolio_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_portfolio TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( SRC.sys_updated_by ,'')<> COALESCE(TRGT.changed_by ,'')
