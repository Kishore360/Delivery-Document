SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
 select count(1) cnt
from
cardinalhealth_mdwdb.d_change_request d 

 JOIN cardinalhealth_mdwdb.f_change_request f ON d.row_key=f.change_request_key

 where  d.failure_flag<> CASE WHEN f.success_status_src_code_c LIKE '%fail%' THEN 'Y' ELSE 'N' END 
    

 )b
 
 
 
 
 