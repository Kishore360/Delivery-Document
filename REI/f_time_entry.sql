SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(*) as cnt from(select substring(row_id,1,32),count(1)  from rei_mdwdb.f_time_entry
group by 1
having count(1)>7)b) c;