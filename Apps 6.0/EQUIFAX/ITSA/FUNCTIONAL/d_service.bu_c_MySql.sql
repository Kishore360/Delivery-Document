SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_service.name' 
ELSE 'SUCCESS' END as Message 
from (select * from equifax_mdsdb.cmdb_ci_service_final where cdctype<>'D') src
 left join equifax_mdwdb.d_service t on RIGHT(t.row_id,32)=src.sys_id and src.sourceinstance=t.source_id
where coalesce(src.u_bu_coe,'UNSPECIFIED')<>t.bu_c and src.cdctype<>'D';


