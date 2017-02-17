 SELECT 
 CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
 FROM cardinalhealth_mdsdb.cmdb_ci_outage_final SRC 
 LEFT JOIN cardinalhealth_mdwdb.f_outage_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
join cardinalhealth_mdwdb.d_calendar_date lkp
on lkp.row_id=COALESCE(DATE_FORMAT(CONVERT_TZ(SRC.begin,'GMT','America/New_York'),'%Y%m%d'),
COALESCE(DATE_FORMAT(CONVERT_TZ(SRC.sys_created_on,'GMT','America/New_York'),'%Y%m%d'),
'UNSPECIFIED'))
 where COALESCE(lkp.row_key) <> TRGT.outage_start_key)temp;
 
 
 
 