SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from asu_mdsdb.problem_final s
left join asu_mdwdb.f_problem  t
on s.sys_id=t.row_id and s.sourceinstance=t.source_id
LEFT JOIN asu_mdwdb.d_lov LKP 
 ON (concat('U_CATEGORY~INCIDENT~~~',upper(u_category_2))= LKP.row_id 
AND s.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN s.u_category_2 IS NULL THEN 0 else '-1' end)<>
 COALESCE(t.prob_category_2_src_c_key,''))f 


