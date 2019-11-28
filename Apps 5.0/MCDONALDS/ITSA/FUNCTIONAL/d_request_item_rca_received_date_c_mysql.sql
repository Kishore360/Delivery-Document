 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from mcdonalds_mdsdb.sc_req_item_final s
left join mcdonalds_mdsdb.sc_req_item_ext_final ext ON s.sys_id = ext.record_id AND s.sourceinstance = ext.sourceinstance
left  JOIN mcdonalds_mdwdb.d_request_item t 
on  t.ROW_ID=s.SYS_ID and s.sourceinstance=t.source_id 
where  
convert_tz(ext.receiveddate,'GMT','US/Central')
<> t.received_date_c) temp


