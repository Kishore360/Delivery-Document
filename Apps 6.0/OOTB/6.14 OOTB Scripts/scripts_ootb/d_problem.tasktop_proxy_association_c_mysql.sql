SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_problem.tasktop_proxy_association_c' ELSE 'SUCCESS' END as Message
from
(select count(1) as CNT from (select * from equifax_mdsdb.problem_final where CDCTYPE<>'D') SRC
left join equifax_mdwdb.d_problem TRGT on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where TRGT.soft_deleted_flag<>'Y' and   coalesce(SRC.u_tasktop_proxy_association, 'UNSPECIFIED')  <> TRGT.tasktop_proxy_association_c) temp;