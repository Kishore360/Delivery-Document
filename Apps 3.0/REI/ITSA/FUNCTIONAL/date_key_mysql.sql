SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt FROM rei_mdwdb.f_time_entry fi join rei_mdsdb.time_card_final a on (substring(fi.row_id,1,32) =a.sys_id) 
JOIN rei_mdwdb.d_calendar_date b ON (a.week_starts_on >= b.week_start_date and a.week_starts_on <= b.week_end_date 
AND a.sourceinstance=b.source_id) and fi.date_key<>b.row_key and fi.row_key <100) c;

