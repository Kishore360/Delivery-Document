SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_software_c.cost_center_key' ELSE 'SUCCESS' END as Message
from truist_mdsdb.cmdb_ci_spkg_final s
left join truist_mdwdb.d_software_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
left join truist_mdwdb.d_cost_center lkp
ON (s.cost_center= lkp.row_id 
and t.source_id = lkp.source_id)
where COALESCE(lkp.row_key,CASE WHEN s.cost_center IS NULL THEN 0 else -1 end) <>t.cost_center_key