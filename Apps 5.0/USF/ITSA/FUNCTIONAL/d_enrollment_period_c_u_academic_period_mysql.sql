SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from  usf_mdsdb.u_enrollment_terms_final s
left  JOIN usf_mdwdb.d_enrollment_period_c t 
on  t.ROW_ID=s.SYS_ID and s.sourceinstance=t.source_id  
WHERE s.u_academic_period<>
 t.u_academic_period
) temp