
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from wow_mdsdb.sc_req_item_final a
left join wow_mdsdb.catalog_variable_log_final b  
ON a.sys_id = b.u_requested_item
left join wow_mdwdb.f_request_item c
on a.sys_id=c.row_id and a.sourceinstance=c.source_id
where (CAST(REPLACE(b.u_current_womo_account_balance,'$','') AS DECIMAL(65,2)))<>c.current_womo_account_balance_c)temp;