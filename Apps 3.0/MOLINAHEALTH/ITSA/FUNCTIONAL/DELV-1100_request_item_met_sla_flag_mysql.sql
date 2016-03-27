SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message from(

select d.met_sla_flag trgt,CASE WHEN open_to_close_duration>604800 then 'N' else 'Y' end src
from molinahealth_mdsdb.sc_req_item_final s 
 join molinahealth_mdwdb.d_request_item d
ON  s.sys_id=d.row_id
AND s.sourceinstance=d.source_id
 join molinahealth_mdwdb.f_request_item f
 ON d.row_key=f.request_item_key AND d.source_id=f.source_id)a
where src<>trgt  ;
