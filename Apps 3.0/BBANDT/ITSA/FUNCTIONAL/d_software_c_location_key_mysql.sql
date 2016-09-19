SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_software_c.location_key' ELSE 'SUCCESS' END as Message
from bbandt_mdsdb.cmdb_ci_spkg_final s
left join bbandt_mdwdb.d_software_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join bbandt_mdwdb.d_location lkp
ON (s.location= lkp.row_id 
and t.source_id = lkp.source_id)
where COALESCE(lkp.row_key,CASE WHEN s.location IS NULL THEN 0 else -1 end) <>t.location_key