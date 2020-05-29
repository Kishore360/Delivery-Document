SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' ELSE 'Data Matched' END AS Message 
FROM (
select  count(1) cnt 
from wpl_mdwdb.d_internal_organization f
left join 
 wpl_mdsdb.sys_user_group_final s 
ON RIGHT(f.row_id,32)=s.sys_id and f.source_id=s.sourceinstance
LEFT JOIN wpl_mdsdb.u_region_lkp_final  LKP
on s.u_region_lkp =LKP.sys_id
where f.region_c <> COALESCE(LKP.u_name,'UNSPECIFIED')
and s.cdctype<>'D'
)E;
