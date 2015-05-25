SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select COUNT(*) AS cnt
from rambus_mdsdb.change_request_final s
inner join rambus_workdb.dwh_f_change_request i on s.sys_id collate utf8_unicode_ci=i.row_id 
where coalesce(s.u_application collate utf8_unicode_ci,' ')<>coalesce(i.category_src_code ,' ')




) c;