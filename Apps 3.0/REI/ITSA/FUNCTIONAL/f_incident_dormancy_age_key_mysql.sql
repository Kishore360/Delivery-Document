SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt 
from
rei_mdwdb.f_incident a 
 JOIN 
rei_mdwdb.d_lov b 
ON (a.dormancy_age div 86400) 
where (a.dormancy_age_key IS NULL
       OR a.dormancy_age_key <> b.row_key)
                   AND 
                   (b.dimension_class = 'DORMANCYBUCKET_WH~INCIDENT'
                   OR b.row_key in (0,-1)) and coalesce(b.row_key,-1)<> a.dormancy_age_key)a