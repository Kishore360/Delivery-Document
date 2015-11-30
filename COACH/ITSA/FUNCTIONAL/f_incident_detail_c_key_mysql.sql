


SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from coach_mdsdb.incident_final a
 left JOIN  coach_mdwdb.f_incident b
on  b.ROW_ID = a.SYS_ID and a.sourceinstance=b.source_id
 left join coach_mdwdb.d_lov c 
on  CONCAT('DETAIL~INCIDENT~~~',a.u_detail)=c.row_id and a.sourceinstance=c.source_id
 where case when u_detail is NULL then 0 
when c.row_id is NULL and u_detail is not NULL then -1 
else
c.row_key end <> b.detail_c_key  and  dimension_class like '%detail%' )b

