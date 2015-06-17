SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select  count(*) as cnt
from ucsf_mdsdb.sc_req_item_final a
inner join ucsf_workdb.dwh_d_request_item b on a.sys_id collate utf8_general_ci = b.row_id
left outer join ucsf_mdsdb.cmn_cost_center_final c on  a.u_dpa_fund= c.sys_id 
 where #c.row_key is null and a.u_dpa_fund and
 case when  a.u_dpa_fund is null then 'No Fund Title Found' 
 else case when c.u_fund_title is null then '-1' else c.u_fund_title end end collate utf8_general_ci <> b.dpa_fund_title_c


) c;