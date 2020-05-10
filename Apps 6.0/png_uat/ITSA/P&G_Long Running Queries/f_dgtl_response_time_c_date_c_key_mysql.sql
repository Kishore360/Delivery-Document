SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from  png_mdsdb.us_dgtl_response_time_data_final SRC
JOIN png_mdwdb.f_dgtl_response_time_c TRGT
ON concat (COALESCE(SRC.Test_Name,'UNSPECIFIED'),COALESCE(SRC.Date,'UNSPECIFIED')) = TRGT.row_id
join png_mdwdb.d_calendar_date l
on COALESCE(DATE_FORMAT(SRC.Date,'%Y%m%d'),'UNSPECIFIED')= l.row_id
WHERE COALESCE(l.row_key,CASE WHEN SRC.Date IS NULL THEN 0 else '-1' end)<>
 TRGT.c_key
) temp