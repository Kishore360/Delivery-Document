
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_portfolio.changed_on' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.pm_portfolio_final SRC 
  
 LEFT JOIN <<tenant>>_mdwdb.d_portfolio TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE  COALESCE(convert_tz(SRC.sys_updated_on,<<TENANT_SSI_TIME_ZONE>>,<<DW_TARGET_TIME_ZONE>>) ,'')<> COALESCE(TRGT.changed_on ,'')
