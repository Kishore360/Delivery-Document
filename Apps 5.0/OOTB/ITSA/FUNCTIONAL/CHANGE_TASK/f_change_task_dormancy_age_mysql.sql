

select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_task.dormancy_age' ELSE 'SUCCESS' END as Message
 
FROM  tjx_mdsdb.change_task_final SRC 
 LEFT JOIN tjx_mdwdb.f_change_task TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
    
    left join tjx_mdwdb.d_lov_map lm 
  ON (lm.src_key = TRGT.state_src_key)
    
  
 LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from  tjx_mdwdb.d_o_data_freshness
 group by source_id
 ) df 
  ON (TRGT.source_id = df.source_id
 -- AND TRGT.etl_run_number = df.etl_run_number
 )
where lm.dimension_class = 'STATE~CHANGE_TASK'

AND  CASE WHEN lm.dimension_wh_code = 'OPEN' 
THEN TIMESTAMPDIFF(SECOND,coalesce(SRC.sys_updated_on,0), convert_tz(df.lastupdated, 'America/New_York','GMT') )
	ELSE 0 END <> coalesce(TRGT.dormancy_age,'')
