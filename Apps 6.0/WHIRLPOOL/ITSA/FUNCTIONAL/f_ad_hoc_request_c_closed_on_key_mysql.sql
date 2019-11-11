SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.closed_on_key' ELSE 'SUCCESS' END as Message
 FROM whirlpool_mdsdb.u_ad_hoc_request_final SRC
 LEFT JOIN whirlpool_mdwdb.f_ad_hoc_request_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
  JOIN whirlpool_mdwdb.d_lov_map dlm 
ON TRGT.state_src_key = dlm.src_key   and dlm.dimension_wh_code = 'CLOSED' and dimension_class ='STATE~INCIDENT'
LEFT JOIN whirlpool_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(coalesce(SRC.closed_at,sys_updated_on),'GMT','America/New_York'),'%Y%m%d') and LKP.source_id=0
)
WHERE  case when dlm.dimension_wh_code = 'CLOSED' then (LKP.row_key) else null end <> (TRGT.closed_on_key)
and SRC.cdctype='X'