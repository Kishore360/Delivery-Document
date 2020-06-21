
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.open_to_close_duration' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM terex_mdsdb.change_request_final WHERE CDCTYPE<>'D') SRC
 LEFT JOIN terex_mdwdb.d_lov_map L
 ON (SRC.u_change_state=L.dimension_code
 AND SRC.sourceinstance=L.source_id AND L.dimension_class = 'STATE~CHANGE_REQUEST' )
 LEFT JOIN terex_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
WHERE case when L.dimension_wh_code='CLOSED' THEN
		CASE WHEN SRC.opened_at <= COALESCE( SRC.closed_at,SRC.sys_updated_on) then COALESCE( TIMESTAMPDIFF(SECOND, SRC.opened_at, 
			COALESCE( SRC.closed_at,SRC.sys_updated_on)) ,'') else '' end
	  else '' end
<> COALESCE(TRGT.open_to_close_duration ,'')