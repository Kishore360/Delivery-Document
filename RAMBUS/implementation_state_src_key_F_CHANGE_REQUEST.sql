SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select COUNT(*) AS cnt
from rambus_workdb.dwh_f_change_request f
left outer join rambus_workdb.dwh_d_lov l on f.implementation_state_src_code_c = l.dimension_code
and l.dimension_class ='IMPLEMENTATION_STATE~CHANGE_REQUEST' 
where case when f.implementation_state_src_code_c is null then '0' else
case when  l.dimension_code is null then '-1' else l.row_key end end<>f.implementation_state_src_key_c


) c;