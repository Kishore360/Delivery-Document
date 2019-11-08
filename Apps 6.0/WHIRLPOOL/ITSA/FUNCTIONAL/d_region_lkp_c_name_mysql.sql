SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_region_lkp_c.name' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from 
  whirlpool_mdsdb.u_region_lkp_final a
 left join whirlpool_mdwdb.d_region_lkp_c b
 on a.sys_id=right(b.row_id,32) and a.sourceinstance=b.source_id
 where a.u_name<>b.name  and a.cdctype<>'D')ma;
 
 
 