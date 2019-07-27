 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.conflict_status' ELSE 'SUCCESS' END as Message
FROM (SELECT * FROM tjxco_mdsdb.change_request_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN tjxco_mdwdb.d_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 JOIN tjxco_mdwdb.f_change_request a on TRGT.row_key=a.change_request_key
LEFT JOIN tjxco_mdwdb.d_lov_map c 
 ON (c.src_rowid='WH_SCHEDULE_CHANGE_RISK~CHANGE_REQUEST')
 WHERE a.schedule_change_risk_c = 
CASE WHEN c.dimension_wh_code  = 'Very Low' THEN 1
WHEN c.dimension_wh_code  = 'Low' THEN 2
WHEN c.dimension_wh_code  = 'Medium' THEN 3 
WHEN c.dimension_wh_code  = 'High' THEN 5
WHEN c.dimension_wh_code  = 'Very High' THEN 8 END
AND   COALESCE(c.row_key,-1) = TRGT.change_request_schedule_risk_c_key;