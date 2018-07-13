SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
count(*) as cnt
from  nbcu_mdsdb.problem_final SRC
join nbcu_mdwdb.f_problem TRGT
ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN nbcu_mdwdb.d_internal_contact LKP ON (COALESCE(CONCAT('INTERNAL_CONTACT','~',SRC.u_root_cause_owner),'UNSPECIFIED')=LKP.row_id AND SRC.sourceinstance=LKP.source_id)
Where (coalesce(LKP.row_key,CASE WHEN SRC.u_root_cause_owner IS NULl THEN 0 ELSE -1 END)<>TRGT.root_cause_owner_c_key)
)temp;