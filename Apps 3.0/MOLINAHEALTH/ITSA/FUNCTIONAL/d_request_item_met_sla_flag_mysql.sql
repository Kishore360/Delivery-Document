SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message from(
select d.met_sla_flag trgt,
CASE 
when timestampdiff(second,opened_at,coalesce(closed_at,sys_updated_on))=604800  and  state  in (12,3) then 'Y' 
when timestampdiff(second,opened_at,coalesce(closed_at,sys_updated_on))<604800  and state  in (12,3) then 'Y' 
when timestampdiff(second,opened_at,coalesce(closed_at,sys_updated_on))>604800  and state  in (12,3) then 'N' 
when  state  not in (12,3) then 'N' else 'Y'
end src,
opened_at,closed_at,timestampdiff(second,opened_at,closed_at)
from molinahealth_mdsdb.sc_req_item_final s 
 join molinahealth_mdwdb.d_request_item d
ON  s.sys_id=d.row_id
AND s.sourceinstance=d.source_id
where opened_at<closed_at)a
where src<>trgt;
