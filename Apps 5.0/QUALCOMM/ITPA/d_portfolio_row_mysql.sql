
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_portfolio.row_id' ELSE 'SUCCESS' END as Message
 FROM qualcomm_mdsdb.pm_portfolio_final SRC 
 LEFT JOIN qualcomm_mdwdb.d_portfolio TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( SRC.sys_id ,'')<> COALESCE(TRGT.row_id ,'')
