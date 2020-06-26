SELECT  CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_case.backlog_flag' ELSE 'SUCCESS' END as Message
 FROM  watson_mdsdb.sn_customerservice_case_final SRC 
 LEFT JOIN watson_mdwdb.d_case TRGT 
 ON (SRC.sys_id=TRGT.row_id  AND SRC.sourceinstance=TRGT.source_id )
 JOIN 
 (SELECT src_key,dimension_wh_code,dimension_class,'Y' as backlog_flag  from   watson_mdwdb.d_lov_map) lov_map
on TRGT.state_src_key = lov_map.src_key and lov_map.dimension_wh_code NOT IN('RESOLVED','CLOSED')	  and lov_map.dimension_class = 'STATE~CASE' 
 where lov_map.backlog_flag<>(TRGT.backlog_flag )