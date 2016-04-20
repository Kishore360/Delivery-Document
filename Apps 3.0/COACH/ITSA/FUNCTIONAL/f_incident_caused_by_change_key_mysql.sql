SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message from  
(
select count(1) as cnt
from coach_mdsdb.incident_final SRC
left join coach_mdwdb.f_incident TRG
on TRG.row_id =SRC.sys_id and TRG.source_id=SRC.sourceinstance
left join coach_mdwdb.d_change_request d
on d.row_id=coalesce(SRC.caused_by ,'UNSPECIFIED' )
and d.source_id=if(SRC.caused_by is null , 0 , TRG.source_id)
where 
-- d.row_key !=0
d.row_key<>TRG.caused_by_change_key 
)c
