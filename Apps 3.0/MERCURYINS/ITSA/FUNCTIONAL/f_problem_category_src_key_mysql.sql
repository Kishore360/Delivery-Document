SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.change_request_key' ELSE 'SUCCESS' END as Message
from mercuryins_mdsdb.problem_final SRC
join
mercuryins_mdwdb.f_problem TRGT
on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
join
mercuryins_mdwdb.d_lov LKP
on COALESCE(CONCAT('CATEGORY','~','PROBLEM','~','~','~',UPPER(SRC.category)),'UNSPECIFIED')= LKP.row_id  
where coalesce(LKP.row_key,case when SRC.category is null then 0 else -1 end)<>TRGT.category_src_key