 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from cardinalhealth_mdwdb.d_defect_rm_c a
JOIN  cardinalhealth_mdwdb.f_defect_rm_c b
on  b.defect_c_key = a.row_key 
join cardinalhealth_mdwdb.d_lov_map lkp
on b.status_rm_src_c_key= lkp.src_key AND lkp.dimension_wh_code IN ('CLOSED')
Where 
(SELECT count(1)
	   FROM cardinalhealth_mdwdb.f_rm_activity_c
	   WHERE task_wh_type = 'rm_defect'
	   AND task_attribute_wh_name = 'due_date'
	   AND defect_c_key=b.defect_c_key
	   AND created_on between a.opened_date AND a.closed_date)<> b.no_of_times_due_date_changed_c)c

