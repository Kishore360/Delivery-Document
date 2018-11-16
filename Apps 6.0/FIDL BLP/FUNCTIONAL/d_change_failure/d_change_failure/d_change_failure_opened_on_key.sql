SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_change_failure.opened_on_key' ELSE 'SUCCESS' END as Message
 
from (select count(1) as cnt from (SELECT * FROM fidelity_mdsdb.change_request_final WHERE CDCTYPE<>'D') SRC

left join (SELECT * FROM fidelity_mdwdb.d_change_failure where year(effective_to)=2999) TRGT 
 
ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id) 

LEFT JOIN fidelity_mdwdb.d_calendar_date LKP 
on (LKP.row_id  = date_format(convert_tz(SRC.opened_at,'GMT','America/New_York'),'%Y%m%d') and LKP.source_id=0)
 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.opened_at IS NULL THEN 0 else -1 end) <> TRGT.opened_on_key) temp;
