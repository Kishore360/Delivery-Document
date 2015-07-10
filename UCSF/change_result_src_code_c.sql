SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(1) as cnt 
from ucsf_mdwdb.d_change_request a

left join ucsf_workdb.ds_change_request b

on a.row_id=b.row_id and

a.source_id=b.source_id

where a.change_result_src_code_c<>b.change_result_src_code_c) a;