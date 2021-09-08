SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from mcd_mdsdb.sc_req_item_final a
 left  JOIN   mcd_mdwdb.d_request_item b
on  b.ROW_ID=a.SYS_ID and a.sourceinstance=b.source_id
where a.u_status <> b.status_c) temp;

