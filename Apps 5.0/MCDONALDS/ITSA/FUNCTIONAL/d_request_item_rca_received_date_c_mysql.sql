 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from mcdonalds_mdsdb.sc_req_item_final s
left  JOIN mcdonalds_mdwdb.d_request_item t 
on  t.ROW_ID=s.SYS_ID and s.sourceinstance=t.source_id 
where  
convert_tz(s.received_date,'GMT','America/New_york')
<> t.received_date_c) temp


