


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from coach_mdsdb.change_request_final a
 left JOIN  coach_mdwdb.f_change_request b
on  b.ROW_ID = a.SYS_ID and a.sourceinstance=b.source_id
 left join coach_mdwdb.d_lov c 
on  CONCAT('SUBCATEGORY~CHANGE_REQUEST~~~',a.u_subcategory)=c.row_id 
 where 
case when u_subcategory is NULL then 0 
when c.row_id is NULL and u_subcategory is not NULL then -1 
else
c.row_key <> b.subcategory_c_key end and  dimension_class like '%SUBCATEGORY%' )b

