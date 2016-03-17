SELECT CASE WHEN count(1) > 1 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 1 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(
select distinct sourcename from <<tenant>>_mdwdb.d_o_data_freshness
group by sourcename having sourcename like '%ServiceNow%')a