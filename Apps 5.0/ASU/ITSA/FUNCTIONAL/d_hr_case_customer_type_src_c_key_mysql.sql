SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from asu_mdsdb.hr_case_final s
left  JOIN asu_mdwdb.d_hr_case t 
on  t.ROW_ID=s.SYS_ID and s.sourceinstance=t.source_id 
left join asu_mdwdb.d_lov l
on concat('CUSTOMERTYPE_C~HRCASE~~~',upper(s.u_customer_type))=l.row_id and s.sourceinstance=l.source_id
where l.row_key <> t.customer_type_src_c_key) temp
