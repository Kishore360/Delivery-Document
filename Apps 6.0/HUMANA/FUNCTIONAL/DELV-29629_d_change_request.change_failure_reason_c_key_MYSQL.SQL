SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN cnt > 0 THEN 'Data did not Match' ELSE 'Data Matched' END AS Message  from 
(select count(1)  cnt
from humana_mdsdb.change_request_final SRC
join humana_mdwdb.d_change_request TRG on TRG.row_id=SRC.sys_id and TRG.source_id=SRC.sourceinstance
left join 	humana_mdwdb.d_lov map on map.row_id = coalesce(CONCAT('FAILURE_REASON~CHANGE_REQUEST~',upper(SRC.u_issue_failure_reason)),'UNSPECIFIED')
and map.source_id =if(SRC.u_issue_failure_reason is null ,0,SRC.sourceinstance)
where map.row_key <> TRG.change_failure_reason_c_key
)A


