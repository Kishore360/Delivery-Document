SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(
select count(1) as cnt
from rei_mdsdb.us_acd_data_final a
JOIN rei_mdwdb.f_call_center_stats_c b
on a.sourceinstance=b.source_id
and MD5(CONCAT(month,stat)) = b.row_id 
join
rei_mdwdb.d_calendar_date c
on date_format(STR_TO_DATE(CONCAT('01-',a.`month`), '%d-%b-%Y'),'%Y%m%d') =c.row_id
where  coalesce(c.row_key,case when a.`month` is null then 0 else -1 end) <>b.month_key
)a;