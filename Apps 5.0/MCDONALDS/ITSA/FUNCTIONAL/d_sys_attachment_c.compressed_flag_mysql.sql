SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_sys_attachment_c.compressed_flag' ELSE 'SUCCESS' END as Message
from 
(select count(1) as cnt  from (select sys_id, sourceinstance, cdctime, compressed from  mcdonalds_mdsdb.sys_attachment_final) src 
left join  mcdonalds_mdwdb.d_sys_attachment_c trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = src.sourceinstance)
where (src.cdctime<=f1.lastupdated) and  CASE WHEN src.compressed = 1 THEN 'Y' WHEN src.compressed = 0 THEN 'N' ELSE NULL END <> trgt.compressed_flag) temp;