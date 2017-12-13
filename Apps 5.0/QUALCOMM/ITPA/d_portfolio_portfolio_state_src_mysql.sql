
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_portfolio.portfolio_state_src_key' ELSE 'SUCCESS' END as Message
 FROM qualcomm_mdsdb.pm_portfolio_final SRC 
 LEFT JOIN qualcomm_mdwdb.d_portfolio TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN qualcomm_mdwdb.d_lov LKP 
 ON ( concat('PORTFOLIO~','STATE~','~',SRC.state) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.state IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.portfolio_state_src_key ,'')
