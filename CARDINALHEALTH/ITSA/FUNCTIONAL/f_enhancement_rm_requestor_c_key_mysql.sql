 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from cardinalhealth_mdsdb.rm_enhancement_final a
JOIN  cardinalhealth_mdwdb.f_enhancement_rm b
on  b.row_id = a.sys_id and a.sourceinstance=b.source_id
join cardinalhealth_mdwdb.d_internal_contact lkp
on COALESCE( concat('INTERNAL_CONTACT~',a.u_requestor),'UNSPECIFIED') = lkp.row_id
where coalesce(lkp.row_key,case when a.u_requestor is null then 0 else -1 end)<> b.requestor_c_key)c
