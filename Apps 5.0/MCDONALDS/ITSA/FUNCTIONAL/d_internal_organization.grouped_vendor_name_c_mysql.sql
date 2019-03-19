  SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_internal_organization.grouped_vendor_name_c' ELSE 'SUCCESS' END as Message
from 
(select count(1) as cnt  from  mcdonalds_mdsdb.us_vendor_group_map_c_final src 
left join mcdonalds_mdwdb.d_internal_organization trgt  ON trgt.organization_name = src.vendor
left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = src.sourceinstance)
where (src.cdctime<=f1.lastupdated) and  COALESCE(src.grouped_vendor_name, 'UNSPECIFIED') = trgt.grouped_vendor_name_c) temp;