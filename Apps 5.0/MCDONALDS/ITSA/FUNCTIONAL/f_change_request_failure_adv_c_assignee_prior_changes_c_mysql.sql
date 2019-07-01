SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_incident.reported_by_department_name_c' ELSE 'SUCCESS' END as Message
from 
(select count(1) as cnt  from mcdonalds_mdwdb.f_change_request_failure_adv_c a11
JOIN mcdonalds_mdwdb.t_temp_change_records_c a12 
ON a11.row_id = a12.row_id AND a11.source_id = a12.source_id
where a11.assignee_prior_changes_c<>a12.assignee_prior_changes_c)a




