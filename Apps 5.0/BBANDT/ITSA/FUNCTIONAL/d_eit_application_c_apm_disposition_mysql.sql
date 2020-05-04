select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_eit_application_c_apm_disposition' ELSE 'SUCCESS' END as Message 
-- tgt.apm_disposition,src.apm_disposition,src.cdctime,src.cdctype,tgt.dw_inserted_on,tgt.dw_updated_on 
from bbandt_mdwdb.d_eit_application_c tgt
join
(SELECT
a11.app_project_status AS apm_disposition,
a11.archer_id,
a11.cdctime,
a11.cdctype,
CONCAT(coalesce(TRIM(a11.application_name),TRIM(a12.application_name),'UNSPECIFIED'),'~',COALESCE(TRIM(appid),'UNSPECIFIED')) as row_id
FROM bbandt_mdsdb.us_technical_health_check_c_final a11
left join (select ci.u_archer_id as archer_id, ci.sourceinstance, max(name) as application_name,
COALESCE(substring_index(group_concat(ci.u_tier_rating order by ci.sys_updated_on desc separator '+'),'+',1),'UNSPECIFIED') AS tier_rating,
COALESCE(substring_index(group_concat(lob.u_division_manager order by ci.sys_updated_on desc separator '+'),'+',1),'UNSPECIFIED') AS division_manager,
COALESCE(substring_index(group_concat(lob.u_unit order by ci.sys_updated_on desc separator '+'),'+',1),'UNSPECIFIED') AS business_unit
from bbandt_mdsdb.cmdb_ci_spkg_final ci
left join bbandt_mdsdb.u_cmdb_etc_bus_unit_final lob on ci.u_line_of_business = lob.sys_id and ci.sourceinstance = lob.sourceinstance
where ci.sys_class_name in('cmdb_ci_application_software','cmdb_ci_inf_software','u_cmdb_ci_app_comp_software') and ci.install_status = 1 and ci.operational_status = 1 and ci.cdctype <> 'D'
group by 1,2) a12 on a11.appid = a12.archer_id and a11.sourceinstance = a12.sourceinstance
where a11.cdctype <> 'D'
union
SELECT
'UNSPECIFIED' AS apm_disposition,
concat('APPID-',u_archer_id) AS archer_id,
cdctime,
cdctype,
COALESCE(CONCAT(TRIM(name),'~',COALESCE(TRIM(u_archer_id),'UNSPECIFIED')),'UNSPECIFIED') AS row_id
FROM bbandt_mdsdb.cmdb_ci_spkg_final
WHERE cdctype<>'D' and sys_class_name in('cmdb_ci_application_software','cmdb_ci_inf_software','u_cmdb_ci_app_comp_software') and install_status = 1 and operational_status = 1 and (u_archer_id is null or u_archer_id
NOT IN (SELECT appid from bbandt_mdsdb.us_technical_health_check_c_final))
GROUP BY name, u_archer_id,sourceinstance)src
on tgt.archer_id=src.archer_id
where src.apm_disposition<>tgt.apm_disposition and tgt.current_flag='Y'  and tgt.soft_deleted_flag='N';