SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for cmdb_ci_service_final.u_bu_coe' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
from (select * from equifax_mdsdb.cmdb_ci_service_final where cdctype<>'D') src
left join equifax_mdwdb.d_service t on RIGHT(t.row_id,32)=src.sys_id and src.sourceinstance=t.source_id
where coalesce(src.u_bu_coe,'UNSPECIFIED')<>t.bu_c 
) temp;



