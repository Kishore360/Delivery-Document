SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_request_item.application_name_c' ELSE 'SUCCESS' END as Message
from 
(select count(1) as cnt  from  mcdonalds_mdsdb.sc_req_item_final  src 
left join mcdonalds_mdsdb.sc_req_item_ext_final src1 on src.sys_id=src1.record_id and src.sourceinstance=src1.sourceinstance
left join mcdonalds_mdwdb.d_request_item trgt  ON src.sys_id = trgt.row_id  and src.sourceinstance=trgt.source_id
left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = src.sourceinstance)
where (src.cdctime<=f1.lastupdated) and  COALESCE(src1.application_name ,'UNSPECIFIED') <> trgt.application_name_c) temp;