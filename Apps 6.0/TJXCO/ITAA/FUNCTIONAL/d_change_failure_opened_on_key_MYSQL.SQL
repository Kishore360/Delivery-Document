SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.opened_on_key' ELSE 'SUCCESS' END as Message
from (SELECT * FROM tjxco_mdsdb.change_request_final WHERE CDCTYPE<>'D') SRC
left join (SELECT * FROM tjxco_mdwdb.d_change_failure where year(effective_to)=2999 
) TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id)

LEFT JOIN tjxco_mdwdb.d_calendar_date LKP 
on (LKP.row_id  = date_format(convert_tz(SRC.opened_at,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d') and LKP.source_id=0)

 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.opened_at IS NULL THEN '' else '' end)<> COALESCE(TRGT.opened_on_key,'')
