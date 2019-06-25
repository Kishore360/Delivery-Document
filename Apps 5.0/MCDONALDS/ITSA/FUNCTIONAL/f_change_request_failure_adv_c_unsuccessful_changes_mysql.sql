SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_incident.reported_by_department_name_c' ELSE 'SUCCESS' END as Message
from 
(select count(1) as cnt  from mcdonalds_mdwdb.f_change_request_failure_adv_c trgt
join mcdonalds_mdwdb.f_change_request t1 on trgt.change_request_key = t1.change_request_key
left JOIN mcdonalds_mdwdb.d_lov lov
on  t1.state_src_key=lov.row_key and lov.dimension_class = 'STATE~CHANGE_REQUEST' 
left JOIN mcdonalds_mdwdb.d_lov_map lov_map
on  lov.row_key=lov_map.src_key
  and lov_map.dimension_class = 'STATE~CHANGE_REQUEST'

where trgt.unsuccessful_changes <> if(
(if ((lov_map.dimension_wh_code !='CLOSED' or lov.dimension_name = 'Cancelled'),'N/A',trgt.alternative_change_failure_c_flag)='Y')
,1,0
))a





