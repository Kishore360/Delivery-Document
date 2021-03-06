SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_internal_organization.group_type_id_c' ELSE 'SUCCESS' END as Message
from 
(select count(1) as cnt  from  mcd_mdsdb.sys_user_group_final src 
left join mcd_mdwdb.d_internal_organization trgt  ON CONCAT('GROUP','~',src.sys_id)= trgt.row_id and src.sourceinstance=trgt.source_id
left join (select source_id,max(lastupdated) as lastupdated from mcd_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = src.sourceinstance)
where (src.cdctime<=f1.lastupdated) and src.type <> trgt.group_type_id_c) temp;