 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt from usf_mdwdb.d_incident a join usf_mdwdb.f_incident b on
a.row_key=b.incident_key and a.source_id=b.source_id join
usf_mdwdb.d_lov_map c on b.state_src_key=c.src_key  where
  a.dormant_flag <> case when timestampdiff(day,a.changed_on,convert_tz(sysdate(),'GMT','AMERICA/NEw_YORK'))>7 then
'Y' else 'N' end
and c.dimension_wh_code='OPEN') c