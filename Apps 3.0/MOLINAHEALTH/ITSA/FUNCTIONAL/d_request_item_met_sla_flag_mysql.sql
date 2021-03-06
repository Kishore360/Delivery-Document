SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message from(
select d.met_sla_flag trgt,
CASE 
when timestampdiff(second,sys_created_on,work_end)=604800  and  state  in (12,3) then 'Y' 
when timestampdiff(second,sys_created_on,work_end)<604800  and state  in (12,3) then 'Y' 
when timestampdiff(second,sys_created_on,work_end)>604800  and state  in (12,3) then 'N' 
when  state  not in (12,3) then 'N' else 'Y'
end src,
sys_created_on,work_end,timestampdiff(second,sys_created_on,work_end)
from molinahealth_mdsdb.sc_req_item_final s 
 join molinahealth_mdwdb.d_request_item d
ON  s.sys_id=d.row_id
AND s.sourceinstance=d.source_id
where sys_created_on<work_end)a
where src<>trgt;