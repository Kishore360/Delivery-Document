SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_product_model.long_desc' ELSE 'SUCCESS' END as Message
from 
(select count(1) as cnt  from (SELECT  sys_id, cdctime,sourceinstance,comments FROM mcd_mdsdb.cmdb_model_final) src 
left join mcd_mdwdb.d_product_model trgt  ON src.sys_id = trgt.row_id  and src.sourceinstance=trgt.source_id
left join (select source_id,max(lastupdated) as lastupdated from mcd_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = src.sourceinstance)
where (src.cdctime<=f1.lastupdated) and  src.comments <> trgt.long_desc) temp;