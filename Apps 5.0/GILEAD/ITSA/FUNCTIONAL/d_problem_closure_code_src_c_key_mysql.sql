 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from 	
gilead_mdsdb.problem_final src
JOIN  gilead_mdwdb.d_problem  trgt
on  trgt.ROW_ID = src.SYS_ID and src.sourceinstance=trgt.source_id
join gilead_mdwdb.d_lov lkp
on COALESCE(CONCAT('CLOSURE_CODE_C','~','PROBLEM','~','~','~',UPPER(src.u_CLOSURE_CODE)),'UNSPECIFIED')=lkp.row_id
where  coalesce(lkp.row_key, case when src.u_CLOSURE_CODE is null then 0 else -1 end ) <>trgt.closure_code_src_c_key
 )c

