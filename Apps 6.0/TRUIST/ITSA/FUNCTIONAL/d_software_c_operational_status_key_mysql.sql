SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_software_c.operational_status_key' ELSE 'SUCCESS' END as Message
from (select count(1) as cnt from truist_mdsdb.cmdb_ci_spkg_final s
left join truist_mdwdb.d_software_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join truist_mdwdb.d_lov lkp
ON ( CONCAT('OPERATIONAL_STATUS~SOFTWARE_C','~',UPPER(s.operational_status))= lkp.src_rowid 
and s.sourceinstance = lkp.source_id)
where COALESCE(lkp.row_key,CASE WHEN s.operational_status IS NULL THEN 0 else -1 end) <>t.operational_status_key
and s.CDCTYPE<>'D' and t.soft_deleted_flag='N')ma