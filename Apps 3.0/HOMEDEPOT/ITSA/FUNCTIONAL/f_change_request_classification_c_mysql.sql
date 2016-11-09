SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from homedepot_mdsdb.change_request_final a
 left join homedepot_mdwdb.d_lov c 
on  CONCAT('CLASSIFICATION~CHANGE_REQUEST~~~',a.u_classification)=c.row_id 
 left JOIN  homedepot_mdwdb.f_change_request b
on  b.ROW_ID = a.SYS_ID and a.sourceinstance=b.source_id
 where c.row_key <> b.classification_c_key and  dimension_class like '%CLASSIFICATION%' )b