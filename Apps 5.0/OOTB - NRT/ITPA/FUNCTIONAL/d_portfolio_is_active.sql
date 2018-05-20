
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_portfolio.is_active' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.pm_portfolio_final SRC 
LEFT JOIN <<tenant>>_mdwdb.d_portfolio TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE CASE WHEN SRC.active =1 THEN 'Y' ELSE 'N' END <> COALESCE(TRGT.is_active ,'')
