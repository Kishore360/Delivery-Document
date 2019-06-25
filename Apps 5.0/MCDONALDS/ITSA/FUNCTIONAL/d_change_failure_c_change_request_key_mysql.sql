SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_incident.reported_by_department_name_c' ELSE 'SUCCESS' END as Message
from 
(select count(1) as cnt  from mcdonalds_mdwdb.d_change_failure_c a11
JOIN mcdonalds_mdwdb.t_temp_change_records_c a12 
ON a11.row_id = a12.row_id AND a11.source_id = a12.source_id
where a11.change_request_key<>a12.change_request_key)a;


