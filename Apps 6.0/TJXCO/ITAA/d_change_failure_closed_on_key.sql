SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.closed_on_key' ELSE 'SUCCESS' END as Message
from (SELECT * FROM tjxco_mdsdb.change_request_final WHERE CDCTYPE<>'D') SRC
left join (SELECT * FROM tjxco_mdwdb.d_change_failure where year(effective_to)=2999 
) TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )

left join tjxco_mdwdb.f_change_request req
 ON (req.row_id=TRGT.row_id 
 AND req.source_id=TRGT.source_id )
 
left join tjxco_mdwdb.d_lov_map LM
 on(LM.dimension_code=req.state_src_code
 AND LM.dimension_class='STATE~CHANGE_REQUEST')
 
LEFT JOIN tjxco_mdwdb.d_calendar_date LKP 
on (LKP.row_id  = date_format(convert_tz(coalesce(SRC.closed_at,SRC.sys_updated_on),'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d') and LKP.source_id=0)
 WHERE CASE WHEN LM.dimension_wh_code='CLOSED' THEN
 COALESCE(LKP.row_key,CASE WHEN coalesce(SRC.closed_at,SRC.sys_updated_on) IS NULL THEN 0 else null end) 
 ELSE 0 END 
<> COALESCE(TRGT.closed_on_key,'');
