 SELECT CaSE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END aS Result
,CaSE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END aS Message 
FROM (
select count(1) as cnt  from gilead_mdsdb.cmn_location_final a 
left join 
gilead_mdwdb.d_location b on 
a.sys_id=b.row_id and a.sourceinstance=b.source_id
where coalesce(a.u_region,'UNKNOWN')<>b.region_c)c 