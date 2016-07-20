select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
count(*) as cnt
from
pgi_mdsdb.u_external_incident_final SRC
join
pgi_mdwdb.f_incident TRGT
on SRC.sys_id = TRGT.row_id and SRC.sourceinstance=TRGT.source_id
join
pgi_mdwdb.d_lov LKP
on concat('U_AREA_OF_FOCUS~U_EXTERNAL_INCIDENT~~~',upper(SRC.u_area_of_focus))= LKP.row_id
and  TRGT.source_id=LKP.source_id
where coalesce(LKP.row_key,CASE WHEN SRC.u_area_of_focus IS NULL THEN 0 else -1 end)<>TRGT.area_of_focus_c_key)a