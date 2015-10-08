SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,

 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.over_due_flag' ELSE 'SUCCESS' END as Message

 FROM  <<tenant>>_mdwdb.d_request REQ_ITM 
LEFT JOIN
 (SELECT max(lastupdated) as lastupdated, source_id ,etl_run_number FROM <<tenant>>_mdwdb.d_o_data_freshness
 group by source_id) ODF   ON  REQ_ITM.source_id = ODF.source_id
and ODF.etl_run_number=REQ_ITM.etl_run_number 

WHERE REQ_ITM.due_on IS NOT NULL
and  REQ_ITM.over_due_flag <> CASE WHEN (REQ_ITM.active_flag = 'Y') && (REQ_ITM.due_on < ODF.lastupdated) THEN 'Y' ELSE 'N' END
