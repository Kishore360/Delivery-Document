
SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_service.name' ELSE 'SUCCESS' END as Message 
from (select count(1) as cnt from equifax_mdsdb.x_59673_equifax_bu_equifax_business_impact_table_final src
left join equifax_mdwdb.d_equifax_bu_equifax_business_impact_c trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
where coalesce(src.u_business_service,'UNSPECIFIED')<>trgt.business_service_c and src.cdctype<>'D')ma;

