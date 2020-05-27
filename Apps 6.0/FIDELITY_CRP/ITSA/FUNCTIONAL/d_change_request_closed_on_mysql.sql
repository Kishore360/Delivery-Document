
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.closed_on' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM fidelity_mdsdb.change_request_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN fidelity_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
JOIN fidelity_mdwdb.f_change_request TRGTF
 ON (TRGT.row_id=TRGTF.row_id 
 AND TRGT.source_id=TRGTF.source_id )
 
JOIN fidelity_mdwdb.d_lov_map LM
 on(LM.dimension_code=TRGTF.state_src_code
 AND LM.dimension_class='STATE~CHANGE_REQUEST')and LM.dimension_wh_code='CLOSED'
WHERE  convert_tz(coalesce(SRC.closed_at,SRC.sys_updated_on) ,'UTC','US/Central') <> TRGT.closed_on 
