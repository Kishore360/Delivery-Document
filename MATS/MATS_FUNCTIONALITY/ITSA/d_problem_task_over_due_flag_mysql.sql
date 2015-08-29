 

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.over_due_flag' ELSE 'SUCCESS' END as Message
 FROM  <<tenant>>_mdwdb.d_problem_task TRGT 
 LEFT JOIN <<tenant>>_mdwdb.d_o_data_freshness FRESH  ON(FRESH.source_id=TRGT.source_id
and FRESH.etl_run_number=TRGT.etl_run_number 
 )
 WHERE  TRGT.due_on is not null and 
COALESCE( CASE WHEN (TRGT.active_flag = 'Y') and (due_on < FRESH.lastupdated) then 'Y' else 'N' END,'')<> COALESCE(TRGT.over_due_flag ,'')