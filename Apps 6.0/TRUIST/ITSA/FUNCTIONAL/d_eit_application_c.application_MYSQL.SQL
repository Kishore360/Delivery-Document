SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_eit_application_c.application' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) AS CNT
from
(SELECT 
coalesce(a11.application_name,a12.application_name,'UNSPECIFIED') as application_name,
a11.appid,
a11.archer_id,
CONCAT(coalesce(TRIM(a11.application_name),TRIM(a12.application_name),'UNSPECIFIED'),'~',COALESCE(TRIM(appid),'UNSPECIFIED'))
 as row_id,
a11.sourceinstance
FROM truist_mdsdb.us_technical_health_check_c_final a11
left join (select ci.u_archer_id as archer_id, ci.sourceinstance, max(name) as application_name,
-- group_concat(ci.sys_updated_on order by ci.sys_updated_on desc ),
COALESCE(substring_index(group_concat(ci.u_tier_rating order by ci.sys_updated_on desc separator '+'),'+',1),'UNSPECIFIED') AS tier_rating,
COALESCE(substring_index(group_concat(lob.u_division_manager order by ci.sys_updated_on desc separator '+'),'+',1),'UNSPECIFIED') AS division_manager,
COALESCE(substring_index(group_concat(lob.u_unit order by ci.sys_updated_on desc separator '+'),'+',1),'UNSPECIFIED') AS business_unit
from truist_mdsdb.cmdb_ci_spkg_final ci 
left join truist_mdsdb.u_cmdb_etc_bus_unit_final lob on ci.u_line_of_business = lob.sys_id and ci.sourceinstance = lob.sourceinstance
where ci.sys_class_name in('cmdb_ci_application_software','cmdb_ci_inf_software','u_cmdb_ci_app_comp_software') and ci.install_status = 1 and ci.operational_status = 1 and ci.cdctype <> 'D'
group by 1,2) a12 on a11.appid = a12.archer_id and a11.sourceinstance = a12.sourceinstance
where a11.cdctype <> 'D' 
UNION
SELECT 
name AS application_name,
case 
	when (u_archer_id REGEXP '^[0-9]+$')
			then u_archer_id
		else null
	end AS appid,
	concat('APPID-',u_archer_id) AS archer_id,
COALESCE(CONCAT(TRIM(name),'~',COALESCE(TRIM(u_archer_id),'UNSPECIFIED')),'UNSPECIFIED') AS row_id,
sourceinstance
FROM truist_mdsdb.cmdb_ci_spkg_final
WHERE cdctype<>'D' and sys_class_name in('cmdb_ci_application_software','cmdb_ci_inf_software','u_cmdb_ci_app_comp_software') and install_status = 1 and operational_status = 1 and (u_archer_id is null or u_archer_id NOT IN (SELECT appid from truist_mdsdb.us_technical_health_check_c_final))
GROUP BY name, u_archer_id,sourceinstance) ci 
join
truist_mdwdb.d_eit_application_c  b
on ci.row_id=b.row_id and ci.sourceinstance=b.source_id
where ci.application_name<>b.application and b.soft_deleted_flag='N'
)temp;


