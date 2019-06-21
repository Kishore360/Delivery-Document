SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message  from 
(
select count(1) as cnt
from paloalto_mdsdb.change_request_final SRC
left join paloalto_mdwdb.d_change_request TRG
on TRG.row_id=SRC.sys_id and TRG.source_id=SRC.sourceinstance
left join 	paloalto_mdwdb.d_lov map
on map.row_id = coalesce(CONCAT('U_DOWNTIME~CHANGE_REQUEST~~~',upper(SRC.u_downtime)),'UNSPECIFIED')
and map.source_id =if(SRC.u_downtime is null ,0,SRC.sourceinstance)
where map.row_key <> TRG.downtime_c_key
)A
