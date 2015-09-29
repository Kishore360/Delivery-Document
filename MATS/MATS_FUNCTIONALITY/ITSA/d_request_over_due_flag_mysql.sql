SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request.over_due_flag' ELSE 'SUCCESS' END as 
Message FROM (
 

SELECT TRGT.over_due_flag , CASE WHEN (TRGT.active_flag = 'Y') 
AND (TRGT.due_on < FRESH.lastupdated) THEN 'Y' ELSE 'N' END from
 <<tenant>>_mdwdb.d_request TRGT
 LEFT JOIN <<tenant>>_mdwdb.d_o_data_freshness FRESH  ON(FRESH.source_id=TRGT.source_id
and FRESH.etl_run_number=TRGT.etl_run_number)
Where due_on is not null and 
TRGT.over_due_flag <> CASE WHEN (TRGT.active_flag = 'Y') and (TRGT.due_on < FRESH.lastupdated) THEN 'Y' ELSE 'N' END)a