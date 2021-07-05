SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_businessunit_custom_c.businessunit_name' ELSE 'SUCCESS' END as Message
from 
(select count(1) as cnt  from  mcd_mdsdb.us_bu_manager_vendor_map_c_final  src 
left join mcd_mdwdb.d_businessunit_custom_c trgt  ON src.business_unit=trgt.businessunit_name  and src.sourceinstance=trgt.source_id
left join (select source_id,max(lastupdated) as lastupdated from mcd_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = src.sourceinstance)
where (src.cdctime<=f1.lastupdated) and  COALESCE(src.business_unit ,'UNSPECIFIED') <> trgt.businessunit_name) temp;