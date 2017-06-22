
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from  (
select count(1) as cnt 
from 
intuit_mdsdb.problem_final  b
left join intuit_mdwdb.f_problem TRG
on TRG.row_id=b.sys_id   and b.SourceInstance =TRG.source_id
left join intuit_mdwdb.d_lov c
on c.src_rowid =  CASE WHEN b.state IS NULL THEN 'UNSPECIFIED' ELSE UPPER(CONCAT('STATE~PROBLEM','~','~','~',COALESCE(b.state,''))) end 
AND c.source_id = CASE WHEN b.state IS NULL THEN 0 ELSE TRG.source_id end 
where TRG.state_src_key <> COALESCE(c.row_key,-1)) temp


