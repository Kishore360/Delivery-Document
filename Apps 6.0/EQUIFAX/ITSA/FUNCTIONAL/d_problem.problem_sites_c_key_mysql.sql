SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_problem.problem_sites_c_key' ELSE 'SUCCESS' END as Message
from
(select count(1) as CNT from (select * from equifax_mdsdb.problem_final where CDCTYPE<>'D') SRC
left join equifax_mdwdb.d_problem TRGT on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
left join equifax_mdwdb.d_lov LKP on coalesce(concat('SITES_C~PROBLEM~',SRC.u_sites),'UNSPECIFIED')=LKP.row_id
where coalesce(LKP.row_key, case when SRC.u_sites is null then 0 else -1 end) <> TRGT.problem_sites_c_key and SRC.cdctype<>'D') temp;