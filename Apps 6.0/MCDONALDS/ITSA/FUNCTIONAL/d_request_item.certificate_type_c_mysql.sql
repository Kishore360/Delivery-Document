SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_request_item.certificate_type_c' ELSE 'SUCCESS' END as Message
from 
(select count(1) as cnt  from  mcd_mdsdb.sc_req_item_final  src 
left join mcd_mdsdb.sc_req_item_ext_final src1 on src.sys_id=src1.record_id and src.sourceinstance=src1.sourceinstance
left join mcd_mdwdb.d_request_item trgt  ON src.sys_id = trgt.row_id  and src.sourceinstance=trgt.source_id
left join (select source_id,max(lastupdated) as lastupdated from mcd_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = src.sourceinstance)
where (src.cdctime<=f1.lastupdated) and  COALESCE(src1.u_certificate_type ,'UNSPECIFIED') <> trgt.certificate_type_c) temp;