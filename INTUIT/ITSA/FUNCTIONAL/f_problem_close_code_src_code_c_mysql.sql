SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.close_code_src_code_c' ELSE 'SUCCESS' END as Message
from 
intuit_mdsdb.problem_final  SRC
left join intuit_mdwdb.f_problem TRG
on TRG.row_id=SRC.sys_id   and SRC.SourceInstance =TRG.source_id
where TRG.close_code_src_code_c<>SRC.u_close_code