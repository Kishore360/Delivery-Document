SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_service.name' 
ELSE 'SUCCESS' END as Message 
from equifax_mdsdb.x_59673_equifax_bu_equifax_business_impact_table_final src
left join equifax_mdwdb.d_equifax_bu_equifax_business_impact_c t on src.sys_id=t.row_id and src.sourceinstance=t.source_id
where  src.u_revenue_lost <>t.revenue_lost_c and src.cdctype<>'D';