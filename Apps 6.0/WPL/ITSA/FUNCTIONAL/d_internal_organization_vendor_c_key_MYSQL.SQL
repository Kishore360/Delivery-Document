SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select  count(1) cnt 
from wpl_mdwdb.d_internal_organization f
left join 
 wpl_mdsdb.sys_user_group_final s 
ON RIGHT(f.row_id,32)=s.sys_id and f.source_id=s.sourceinstance
LEFT JOIN wpl_mdwdb.d_region_lkp_c  LKP
on COALESCE(CONCAT('SUBSIDIARY~',s.u_vendor),'UNSPECIFIED') =LKP.row_id
where COALESCE(LKP.row_key,CASE WHEN s.u_vendor IS NULL THEN 0 else -1 end)<> (f.vendor_c_key)
and s.cdctype<>'D'
)E;
