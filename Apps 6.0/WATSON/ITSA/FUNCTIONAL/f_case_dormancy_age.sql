select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_case.dormancy_age' ELSE 'SUCCESS' END as Message
FROM  ibmwatson_mdsdb.sn_customerservice_case_final SRC 
 LEFT JOIN ibmwatson_mdwdb.f_case TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 left join ibmwatson_mdwdb.d_lov_map lm 
  ON (lm.src_key = TRGT.state_src_key and lm.source_id = TRGT.source_id and lm.dimension_class = 'STATE~CASE')
 LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from  ibmwatson_mdwdb.d_o_data_freshness
 group by source_id
 ) df 
  ON (TRGT.source_id = df.source_id
 -- AND TRGT.etl_run_number = df.etl_run_number
 )
where lm.dimension_class = 'STATE~CASE'
AND  CASE WHEN lm.dimension_wh_code = 'OPEN' THEN TIMESTAMPDIFF( DAY,coalesce(SRC.sys_updated_on,0),
convert_tz(df.lastupdated, 'GMT','America/New_York'))
	ELSE 0 END <> TRGT.dormancy_age