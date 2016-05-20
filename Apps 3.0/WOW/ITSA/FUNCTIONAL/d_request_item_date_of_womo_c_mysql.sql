SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from wow_mdsdb.sc_req_item_final a
left join wow_mdsdb.catalog_variable_log_final b  
ON a.sys_id = b.u_requested_item
left join wow_mdwdb.d_request_item c
on a.sys_id=c.row_id and a.sourceinstance=c.source_id
where case when substring(b.u_date_of_womo,5,1) = '-' THEN str_to_date(b.u_date_of_womo,'%Y-%m-%d') 
else str_to_date(b.u_date_of_womo,'%m-%d-%Y') end <> c.date_of_womo_c) temp