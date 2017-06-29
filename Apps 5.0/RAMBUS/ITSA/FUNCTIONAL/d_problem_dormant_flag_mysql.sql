SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_problem.dormant_flag' ELSE 'SUCCESS' END as Message
 FROM rambus_mdwdb.d_problem TRGT 
 jOIN rambus_mdwdb.f_problem TRGTF
 ON (TRGTF.row_id =TRGT.row_id  
 AND TRGTF.source_id= TRGT.source_id  )
JOIN rambus_mdwdb.d_lov_map LM ON TRGTF.state_src_key=LM.src_key
AND  LM.dimension_wh_code='OPEN' and LM.dimension_class = 'STATE~PROBLEM'
JOIN (
			SELECT lastupdated, 
				   source_id
			  FROM rambus_mdwdb.d_o_data_freshness
			 	) df ON TRGT.source_id = df.source_id
 WHERE  CASE WHEN timestampdiff(DAY,TRGT.changed_on,(SELECT MAX(lastupdated) AS lastupdated
FROM rambus_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'))>30
AND  LM.dimension_wh_code='OPEN' and LM.dimension_class = 'STATE~PROBLEM' THEN 'Y' ELSE 'N' END <> (TRGT.dormant_flag )
