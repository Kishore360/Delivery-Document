SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message  from 
(select count(1)  cnt
from pan6_mdsdb.change_request_final SRC
left join pan6_mdwdb.d_change_request TRG
on TRG.row_id=SRC.sys_id and TRG.source_id=SRC.sourceinstance
left join  pan6_mdwdb.d_lov map
on map.row_id = coalesce(CONCAT('U_CATEGORY_2~CHANGE_REQUEST~~~',upper(SRC.u_category_2)),'UNSPECIFIED')
and map.source_id =if(SRC.u_category_2 is null ,0,SRC.sourceinstance)
where map.row_key <> TRG.category_2_c_key
)A
