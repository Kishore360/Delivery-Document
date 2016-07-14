
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_outage.start_on_key' ELSE 'SUCCESS - Without the source null handle' END as Message
 FROM <<tenant>>_mdsdb.cmdb_ci_outage_final SRC
 LEFT JOIN <<tenant>>_mdwdb.f_outage TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )

LEFT JOIN <<tenant>>_mdwdb.d_calendar_date LKP 
on (LKP.row_id  = date_format(convert_tz(SRC.begin,'GMT','America/Los_Angeles'),'%Y%m%d')  and LKP.source_id=0
)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.begin IS NULL THEN 0 else '-1' end)  <> COALESCE(TRGT.start_on_key,'0') 
