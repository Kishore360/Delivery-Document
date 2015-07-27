SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(1) as cnt from pgi_mdwdb.d_incident a
where caller_region <> CASE WHEN SUBSTR(created_by,1,4)='ats\\' THEN 'North America' WHEN SUBSTR(created_by,1,7)='europe\\'
THEN 'EMEA' WHEN SUBSTR(created_by,1,8)='asiapac\\' THEN 'APAC' ELSE 'General' END)c;
 