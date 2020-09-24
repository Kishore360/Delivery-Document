


SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_internal.opened_by_service_desk_flag_c' ELSE 'SUCCESS' END as Message
from(Select count(1) as CNT
FROM   ntrust_mdsdb.problem_final SRC
   join ntrust_mdwdb.d_problem TRGT
 on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
  left JOIN ntrust_mdwdb.d_internal_organization TRGT2 ON coalesce(concat('DEPARTMENT~',SRC.u_business_caused),'UNSPECIFIED')=TRGT2.row_id
  AND SRC.sourceinstance=TRGT2.source_id
where coalesce(TRGT2.row_key,case when SRC.u_business_caused is null then 0 else -1 end)
         <> TRGT.problem_business_caused_c_key and SRC.cdctype='X' )temp;

