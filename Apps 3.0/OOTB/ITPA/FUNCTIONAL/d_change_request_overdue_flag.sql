SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.overdue_flag' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.change_request_final SRC 
 
 LEFT JOIN <<tenant>>_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )

  left join app_test.lsm_ls_source_timezone tz 
  ON (tz.sourceid = SRC.sourceinstance)
   
  
LEFT JOIN <<tenant>>_mdwdb.d_lov_map LM
 on concat('STATE~CHANGE_REQUEST~~~',upper(SRC.state) )= LM.src_rowid
and LM.dimension_class='STATE~CHANGE_REQUEST' 

LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from  <<tenant>>_mdwdb.d_o_data_freshness
 group by source_id
 ) FRESH  ON(FRESH.source_id=SRC.sourceinstance
 -- AND FRESH.etl_run_number = TRGT.etl_run_number
 ) 
WHERE CASE WHEN (LM.dimension_wh_code  IN('CLOSED') and coalesce( SRC.closed_at,0)>coalesce( SRC.due_Date,0) and SRC.due_date is not null)
or (LM.dimension_wh_code  IN ('OPEN') and coalesce( SRC.due_date,0) < convert_tz(FRESH.lastupdated,tz.target_time_zone , tz.source_time_zone)
and SRC.due_date is not null)
 THEN 'Y' ELSE 'N' END <> TRGT.overdue_flag 

