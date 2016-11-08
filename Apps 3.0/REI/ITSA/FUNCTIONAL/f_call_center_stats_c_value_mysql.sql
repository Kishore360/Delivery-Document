SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(
select count(1) as cnt
from rei_mdsdb.us_acd_data_final a
JOIN rei_mdwdb.f_call_center_stats_c b
on a.sourceinstance=b.source_id
and MD5(CONCAT(month,stat)) = b.row_id 
where  CASE WHEN stat like '%time%' THEN TIME_TO_SEC(CONCAT('00:',REPLACE(data,'%',0))) ELSE REPLACE(data,'%',0) END  <>b.value
)a;