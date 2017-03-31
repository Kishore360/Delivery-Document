SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from  usf_mdsdb.u_enrollment_terms_final s
left  JOIN usf_mdwdb.f_enrollment_terms_c t 
on  t.ROW_ID=s.SYS_ID and s.sourceinstance=t.source_id  
join usf_mdwdb.d_calendar_date l
on COALESCE(DATE_FORMAT(s.u_end_date,'%Y%m%d'),'UNSPECIFIED')= l.row_id
WHERE COALESCE(l.row_key,CASE WHEN s.u_end_date IS NULL THEN 0 else '-1' end)<>
 t.u_end_date_key
) temp