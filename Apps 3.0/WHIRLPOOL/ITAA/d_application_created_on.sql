
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_application.created_on' ELSE 'SUCCESS' END as Message
  FROM whirlpool_mdsdb.cmdb_ci_appl_final SRC 
 LEFT JOIN whirlpool_mdwdb.d_application TRGT 
 ON (convert(concat('APPLICATION~', SRC.sys_id) using utf8) =convert(TRGT.row_id using utf8) 
 AND SRC.sourceinstance=TRGT.source_id )

 WHERE CONVERT(convert_tz(SRC.sys_created_on,'GMT','America/New_York') using utf8)<> CONVERT(TRGT.created_on using utf8)
