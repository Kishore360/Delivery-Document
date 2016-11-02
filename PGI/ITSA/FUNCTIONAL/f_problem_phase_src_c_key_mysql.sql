SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt 
from
pgi_mdwdb.f_problem finc 
join
pgi_mdsdb.problem_final inc
ON finc.row_id = inc.sys_id and finc.source_id=inc.sourceinstance
JOIN pgi_mdwdb.d_lov lkp 
ON COALESCE(CONCAT('PHASE','~','PROBLEM','~','~','~',UPPER(inc.u_phase)),'UNSPECIFIED') = lkp.row_id
where coalesce(lkp.row_key,case when inc.u_phase is null then 0 else -1 end)<> finc.phase_src_c_key)a
