SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM ( select count(1) as cnt from gogo_mdsdb.incident_final a
inner join gogo_mdwdb.f_incident  b on a.sys_id=b.row_id and a.sourceinstance=b.source_id and b.row_key <300
left outer join gogo_mdwdb.d_lov c on a.u_level_3=c.dimension_code and dimension_class='LEVEL_3~INCIDENT'
 where case when  a.u_level_3 is null then '0' 
 else case when c.row_key is null then '-1' else c.row_key end end <>b.level_3_src_c_key
 ) c;
