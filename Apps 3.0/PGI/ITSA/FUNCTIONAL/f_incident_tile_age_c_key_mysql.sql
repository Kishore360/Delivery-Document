SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(select count(1) as cnt from pgi_mdwdb.f_incident a
LEFT OUTER JOIN pgi_mdwdb.d_lov x ON floor(a.age/86400) BETWEEN x.lower_range_value AND x.upper_range_value and x.dimension_class = 'TILEAGEBUCKET_WH~INCIDENT'
WHERE (a.tile_age_c_key <> coalesce(x.row_key,case when a.age is null then 0 else -1 end ) ))b ; 



