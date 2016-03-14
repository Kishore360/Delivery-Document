SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
count(*) as cnt
from  tivo_mdwdb.f_incident a11
left join tivo_mdwdb.d_incident a12
on a11.incident_key=a12.row_key
left join tivo_mdwdb.d_lov_map a13
on a11.parent_type_src_c_key=a13.src_key
and a13.dimension_class='PARENT_TYPE~INCIDENT'
where case when a13.dimension_wh_code = 'MAJOR' THEN 'Y'  ELSE 'N' END <>a12.major_incident_flag)a
