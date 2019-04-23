SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_change_request.operational_status_key' ELSE 'SUCCESS' END as Message
from (select count(1) as cnt from bbandt_mdsdb.cmdb_ci_final s
left join bbandt_mdwdb.d_configuration_item t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join bbandt_mdwdb.d_lov lkp
ON ( CONCAT('OPERATIONAL_STATUS_C~CONFIGURATION_ITEM','~~~',UPPER(s.operational_status))= lkp.row_id 
and t.source_id = lkp.source_id)
where COALESCE(lkp.row_key,CASE WHEN s.operational_status IS NULL THEN 0 else -1 end) <>t.operational_status_c_key
and t.soft_deleted_flag='Y' and s.CDCTYPE<>'D')ma