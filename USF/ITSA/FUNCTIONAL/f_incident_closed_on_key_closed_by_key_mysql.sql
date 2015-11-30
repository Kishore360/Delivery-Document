 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(
select count(*) as cnt from usf_mdwdb.f_incident
where last_resolved_on_key <> closed_on_key or  last_resolved_by_key <>closed_by_key) c
 

