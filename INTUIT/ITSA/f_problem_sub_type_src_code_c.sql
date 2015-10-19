
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from  (
select count(1) as cnt from  
intuit_mdsdb.problem_final  SRC
left join intuit_mdwdb.f_problem TRG
on TRG.row_id=SRC.sys_id   and SRC.SourceInstance =TRG.source_id
where TRG.sub_type_src_code_c<>SRC.u_sub_type
) temp