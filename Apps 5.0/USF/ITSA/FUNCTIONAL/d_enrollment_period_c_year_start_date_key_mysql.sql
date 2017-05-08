SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_asset.computer_usage_c' ELSE 'SUCCESS' END as Message from
(select count(1) as cnt
from  usf_mdsdb.u_enrollment_terms_final s
left  JOIN usf_mdwdb.d_enrollment_period_c t 
on  t.ROW_ID=s.SYS_ID and s.sourceinstance=t.source_id  
join usf_mdwdb.d_calendar_date l
on COALESCE(CAST(CONCAT(LEFT(DATE_FORMAT(s.u_start_date,'%Y%m%d'),4),'0101') as UNSIGNED),'UNSPECIFIED')= l.row_id
WHERE COALESCE(l.row_key,CASE WHEN s.u_start_date IS NULL THEN 0 else -1 end)<>
 t.year_start_date_key 