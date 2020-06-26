select CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,

CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_case.dormant_flag' ELSE 'SUCCESS' END as Message

 from 
watson_mdsdb.sn_customerservice_case_final SRC 
 LEFT JOIN watson_mdwdb.d_case TRGT 
 ON (SRC.sys_id=TRGT.row_id  AND SRC.sourceinstance=TRGT.source_id )
 
  LEFT  JOIN 
  (SELECT src_key,source_id ,dimension_class,dimension_wh_code, 'Y' as dormant_flag   
  from watson_mdwdb.d_lov_map) dlm ON TRGT.state_src_key = dlm.src_key and TRGT.source_id= dlm.source_id and  dlm.dimension_class = 'STATE~CASE'
  AND dlm.dimension_wh_code not in ('RESOLVED','CLOSED')
  LEFT JOIN (
			SELECT lastupdated, 
				   source_id
			  FROM watson_mdwdb.d_o_data_freshness
			 WHERE etl_run_number = 0
	) df ON TRGT.source_id = df.source_id AND TRGT.row_key not in (0,-1) 
      
WHERE SRC.cdctype <>'D' AND   timestampdiff(DAY,TRGT.changed_on, df.lastupdated)>30  
  AND TRGT.dormant_flag <> dlm.dormant_flag

