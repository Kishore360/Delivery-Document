SELECT CaSE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END aS Result
,CaSE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END aS Message 
FROM (
select count(1) as cnt  from gilead_mdsdb.cmn_location_final a 
left join gilead_mdwdb.d_location b on a.sys_id=b.row_id and a.sourceinstance=b.source_id
inner join gilead_mdwdb.d_location lkp on b.site_c_key = lkp.row_key
where coalesce(a.u_region,lkp.region_c,'UNKNOWN')<>b.region_c)c;