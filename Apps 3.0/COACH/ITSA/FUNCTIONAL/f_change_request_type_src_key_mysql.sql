SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select 
count(1) as cnt
from coach_mdsdb.change_request_final SRC
left join coach_mdwdb.f_change_request TRG
on TRG.row_id =SRC.sys_id and TRG.source_id=SRC.sourceinstance
left join coach_mdwdb.d_lov d
on d.row_id=COALESCE(CONCAT('TYPE','~','CHANGE_REQUEST','~','~','~',UPPER(SRC.TYPE)),'UNSPECIFIED')
and  d.source_id=if(SRC.TYPE is null , 0 ,SRC.sourceinstance)
AND DATE_FORMAT(COALESCE(CONVERT_TZ (SRC.opened_at,'GMT','America/New_York'), CONVERT_TZ (SRC.closed_at,'GMT','America/New_York')) , '%Y-%m-%d %H:%i:%s') 
BETWEEN effective_from AND effective_to 
where d.row_key<>TRG.type_src_key )c
