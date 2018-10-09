SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from qualcomm_mdsdb.sc_item_option_final a 
join qualcomm_mdsdb.item_option_new_final b on b.sys_id = a.item_option_new AND b.sourceinstance = a.sourceinstance 
join qualcomm_mdsdb.sc_item_option_mtom_final c on c.sc_item_option = a.sys_id AND c.sourceinstance = a.sourceinstance 
join qualcomm_mdsdb.sc_req_item_final d on c.request_item = d.sys_id AND c.sourceinstance 
left join qualcomm_mdwdb.f_request_item_variable_c TRGT
on  concat(a.sys_id,'~',c.request_item) = TRGT.ROW_ID and a.sourceinstance=TRGT.source_id
left  JOIN  qualcomm_mdwdb.d_calendar_date Inter
on Inter.row_id = date_format(convert_tz(d.opened_at,'GMT','GMT'),'%Y%m%d') 
where Inter.row_key <> TRGT.opened_on_key) g

