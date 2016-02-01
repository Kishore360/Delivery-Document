SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
incident_number,count(*) as cnt
from  tivo_mdwdb.f_incident a12
group by 1
having count(*)>1)a;