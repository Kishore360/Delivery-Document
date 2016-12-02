SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(*) as cnt from rei_mdsdb.time_card_final where sys_id  not in(
select substring(row_id,1,32) from rei_mdwdb.f_time_entry
) and year(week_starts_on) >= 1970)c; 
