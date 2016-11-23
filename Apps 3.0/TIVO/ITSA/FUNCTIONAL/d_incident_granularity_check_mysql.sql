SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from (
select
incident_number,count(*) as cnt
from  tivo_mdwdb.d_incident a12
where row_key not in (0,-1)
group by 1
having count(*)>1)b)a