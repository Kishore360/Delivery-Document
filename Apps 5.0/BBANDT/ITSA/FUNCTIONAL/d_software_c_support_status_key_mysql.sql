SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_software_c.support_status_key' ELSE 'SUCCESS' END as Message
from bbandt_mdsdb.cmdb_ci_spkg_final s
left join bbandt_mdwdb.d_software_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join bbandt_mdwdb.d_lov lkp
ON ( CONCAT('SUPPORT_STATUS~SOFTWARE_C','~~~',UPPER(s.u_support_status))= lkp.src_rowid 
and t.source_id = lkp.source_id)
where COALESCE(lkp.row_key,CASE WHEN s.u_support_status IS NULL THEN 0 else -1 end) <>t.support_status_key