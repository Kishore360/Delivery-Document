SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from  png_mdsdb.us_dgtl_psat_scorecard_report_final SRC
left  JOIN png_mdwdb.f_dgtl_psat_scorecard_report_c TRGT 
on  concat (COALESCE(FLOOR(SRC.Touchpoint_Number),'-','UNSPECIFIED'),COALESCE(SRC.FileDate,'UNSPECIFIED')) = TRGT.row_id
join png_mdwdb.d_calendar_date l
on COALESCE(DATE_FORMAT(SRC.Security_Finish_Date,'%Y%m%d'),'UNSPECIFIED')= l.row_id
WHERE COALESCE(l.row_key,CASE WHEN SRC.Security_Finish_Date IS NULL THEN 0 else '-1' end)<>
 TRGT.security_finish_c_key
) temp