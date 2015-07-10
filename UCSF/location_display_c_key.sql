SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(1) as cnt
from ucsf_mdwdb.f_incident a

left join ucsf_workdb.fs_incident b

on a.row_id=b.row_id and

a.source_id=b.source_id

left join ucsf_mdwdb.d_location c

on c.row_id=coalesce(b.location_display_c_id,'UNSPECIFIED')

and c.source_id=b.source_id

where a.location_display_c_key<>c.row_key) a;