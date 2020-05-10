SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message  from 
(select count(1)  cnt
from gilead_mdsdb.problem_final SRC
 join gilead_mdwdb.d_problem TRG
on TRG.row_id=SRC.sys_id and TRG.source_id=SRC.sourceinstance
left join  gilead_mdwdb.d_lov map
on map.row_id = coalesce(CONCAT('CAUSED_BY_VENDOR_C~PROBLEM~~~',upper(SRC.u_caused_by_vendor)),'UNSPECIFIED')
and map.source_id =if(SRC.u_caused_by_vendor is null ,0,SRC.sourceinstance)
where coalesce(map.row_key,case when u_caused_by_vendor is null then 0 else -1 end) <> TRG.caused_by_vendor_src_c_key
)A


