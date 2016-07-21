

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request.over_due_flag' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.sc_request_final SRC 
 
  LEFT JOIN <<tenant>>_mdwdb.d_request TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
   LEFT JOIN (
 select source_id,max(lastupdated) as lastupdated from  <<tenant>>_mdwdb.d_o_data_freshness
 group by source_id
 ) FRESH  ON(FRESH.source_id=SRC.sourceinstance
 -- AND FRESH.etl_run_number = TRGT.etl_run_number
 )
 WHERE COALESCE( CASE WHEN SRC.due_date is NULL then 'N'when SRC.active = 1 and coalesce( SRC.due_date,0) < convert_tz(FRESH.lastupdated , 'America/Los_Angeles','GMT')
  then 'Y' else 'N' END ,'')<> COALESCE(TRGT.over_due_flag ,'')