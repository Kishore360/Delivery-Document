 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from 
svb_mdsdb.problem_final SRC
join 
svb_mdwdb.f_problem trgt
on SRC.sys_id=trgt.row_id and SRC.sourceinstance=trgt.source_id
join
svb_mdwdb.d_application lkp
on COALESCE(CONCAT('APPLICATION~',SRC.u_application),'UNSPECIFIED')=lkp.row_id
where COALESCE(lkp.row_key,case when SRC.u_application is null then 0 else -1 end )<>trgt.application_c_key
)c		
