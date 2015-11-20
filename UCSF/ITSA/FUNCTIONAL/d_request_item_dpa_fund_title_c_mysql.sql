SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from

ucsf_mdsdb.sc_req_item_final a
join ucsf_mdsdb.cmn_cost_center_final b
on a.u_dpa_fund=b.sys_id and a.sourceinstance=b.sourceinstance
left join ucsf_mdwdb.d_request_item c
on c.row_id=a.sys_id and c.source_id=a.sourceinstance
where c.dpa_fund_title_c<>coalesce(b.u_fund_title,'No fund title found');