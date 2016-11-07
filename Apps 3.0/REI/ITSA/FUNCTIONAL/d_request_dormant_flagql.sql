SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.dormant_flag' ELSE 'SUCCESS' END as Message
 FROM rei_mdwdb.d_request TRGT 
 jOIN rei_mdwdb.f_request TRGTF
 ON (TRGTF.row_id =TRGT.row_id  
 AND TRGTF.source_id= TRGT.source_id  )
JOIN rei_mdwdb.d_lov_map LM ON TRGTF.state_src_key=LM.src_key
JOIN (
			SELECT lastupdated, 
				   source_id
			  FROM rei_mdwdb.d_o_data_freshness
			 	) df ON TRGT.source_id = df.source_id
 WHERE  CASE WHEN timestampdiff(DAY,TRGT.changed_on,(SELECT MAX(lastupdated) AS lastupdated
FROM rei_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'))>14
AND  LM.dimension_wh_code='OPEN' and LM.dimension_class = 'REQUEST_STATE~SC_REQUEST' THEN 'Y' ELSE 'N' END <> (TRGT.dormant_flag )
