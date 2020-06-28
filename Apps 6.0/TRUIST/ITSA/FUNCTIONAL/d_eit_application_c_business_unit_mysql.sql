select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_eit_application_c_business_unit' ELSE 'SUCCESS' END as Message 
-- ,tgt.dw_inserted_on,tgt.dw_updated_on ,tgt.app_id,src.archer_id 
from truist_mdwdb.d_eit_application_c tgt
join
 (select ci.u_archer_id as archer_id, ci.sourceinstance,
COALESCE(substring_index(group_concat(lob.u_unit order by ci.sys_updated_on desc separator '+'),'+',1),'UNSPECIFIED') AS business_unit
from truist_mdsdb.cmdb_ci_spkg_final ci
left join truist_mdsdb.u_cmdb_etc_bus_unit_final lob on ci.u_line_of_business = lob.sys_id and ci.sourceinstance = lob.sourceinstance
where ci.sys_class_name in('cmdb_ci_application_software','cmdb_ci_inf_software','u_cmdb_ci_app_comp_software') 
and ci.install_status = 1 and ci.operational_status = 1 and ci.cdctype = 'X' and lob.cdctype='X'
group by 1,2)src
on tgt.app_id=src.archer_id and src.sourceinstance=tgt.source_id
where COALESCE(src.business_unit,'UNSPECIFIED')<>tgt.business_unit and tgt.current_flag='Y'  and tgt.soft_deleted_flag='N';