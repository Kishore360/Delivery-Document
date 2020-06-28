SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_software_c.support_group_key' ELSE 'SUCCESS' END as Message
 -- select distinct CONCAT('GROUP~',s.support_group),lkp.row_id ,
 -- COALESCE(lkp.row_key,CASE WHEN s.support_group IS NULL THEN 0 else -1 end),t.support_group_key
from bbandt_mdsdb.cmdb_ci_spkg_final s
left join bbandt_mdwdb.d_software_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join bbandt_mdwdb.d_internal_organization lkp
ON ( COALESCE(CONCAT('GROUP~',s.support_group),'UNSPECIFIED')= lkp.row_id 
and s.sourceinstance = lkp.source_id)
where COALESCE(lkp.row_key,CASE WHEN s.support_group IS NULL THEN 0 else -1 end) <>t.support_group_key
and s.cdctype='X';