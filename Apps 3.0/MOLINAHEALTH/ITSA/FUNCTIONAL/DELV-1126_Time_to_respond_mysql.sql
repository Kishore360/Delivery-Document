SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message

from molinahealth_mdsdb.sc_req_item_final s 
left join molinahealth_mdwdb.f_request_item d
ON  s.sys_id=d.row_id
AND d.source_id=s.sourceinstance
where TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',s.u_time_to_respond)<>time_to_respond_c