-- Correct Logic 

-- Hardware_Count
SELECT 'Hardware_Count', 
Count(distinct SRC.sys_id) as CNT
FROM png_mdsdb.cmdb_ci_final SRC 
LEFT JOIN png_mdwdb.d_configuration_item TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE 
(SRC.sys_id IN (SELECT SRC1.sys_id FROM png_mdsdb.cmdb_ci_hardware_final SRC1 WHERE SRC1.cdctype<>'D')
OR SRC.sys_id IN (SELECT SRC2.sys_id FROM png_mdsdb.cmdb_ci_storage_device_final SRC2 WHERE SRC2.cdctype<>'D')
OR SRC.sys_id IN (SELECT SRC3.sys_id FROM png_mdsdb.cmdb_ci_voice_hardware_final SRC3 WHERE SRC3.cdctype<>'D')
)
group by 1;
==========================================================

-- Registered_Devices
SELECT
'Registered_Devices',
Count(distinct SRC.sys_id) as Registered_Devices 
FROM png_mdsdb.cmdb_ci_final SRC 
LEFT JOIN png_mdwdb.d_configuration_item TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN png_mdwdb.d_lov LKP ON 
COALESCE(CONCAT('CMDB_CI~INSTALL_STATUS~',UPPER(SRC.install_status)),'UNSPECIFIED')=LKP.row_id AND SRC.sourceinstance=LKP.source_id 
WHERE  
(
(
SRC.sys_id IN (SELECT SRC1.sys_id FROM png_mdsdb.cmdb_ci_hardware_final SRC1 WHERE SRC1.cdctype<>'D' AND SRC1.hardware_status NOT IN ('Decommissioned') )
OR SRC.sys_id IN (SELECT SRC2.sys_id FROM png_mdsdb.cmdb_ci_storage_device_final SRC2 WHERE SRC2.cdctype<>'D' AND  
SRC2.u_pg_hardware_status NOT IN ('Decommissioned'))
OR SRC.sys_id IN (SELECT SRC3.sys_id FROM png_mdsdb.cmdb_ci_voice_hardware_final SRC3 WHERE SRC3.cdctype<>'D' AND SRC3.u_pg_hardware_status NOT IN ('Decommissioned'))
)
AND LKP.dimension_name NOT IN ('Not Used / Reference','duplicate_invalid')
)
AND SRC.cdctype<>'D'
group by 1

=============
SELECT
'Registered_Devices',
Count(distinct SRC.sys_id) as Registered_Devices 
FROM png_mdsdb.cmdb_ci_final SRC 
LEFT JOIN png_mdwdb.d_configuration_item TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN png_mdwdb.d_lov LKP ON 
COALESCE(CONCAT('CMDB_CI~INSTALL_STATUS~',UPPER(SRC.install_status)),'UNSPECIFIED')=LKP.row_id 
WHERE  (
SRC.sys_id IN (SELECT SRC1.sys_id FROM png_mdsdb.cmdb_ci_hardware_final SRC1 WHERE SRC1.cdctype<>'D' AND 
COALESCE(SRC1.hardware_status,'UNSPECIFIED') NOT IN ('Decommissioned') )
OR SRC.sys_id IN (SELECT SRC2.sys_id FROM png_mdsdb.cmdb_ci_storage_device_final SRC2 WHERE SRC2.cdctype<>'D' AND  
COALESCE(SRC2.u_pg_hardware_status,'UNSPECIFIED') NOT IN ('Decommissioned') )
OR SRC.sys_id IN (SELECT SRC3.sys_id FROM png_mdsdb.cmdb_ci_voice_hardware_final SRC3 WHERE SRC3.cdctype<>'D' AND COALESCE(SRC3.u_pg_hardware_status,'UNSPECIFIED') NOT IN ('Decommissioned'))
)
AND LKP.dimension_name NOT IN ('Not Used / Reference','duplicate_invalid')
AND SRC.cdctype<>'D'
group by 1; 

=============




-- Active Devices
SELECT 'Active Devices',
Count(distinct SRC.sys_id) as Active_Devices 
FROM png_mdsdb.cmdb_ci_final SRC 
LEFT JOIN png_mdwdb.d_configuration_item TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN png_mdwdb.d_lov LKP ON 
COALESCE(CONCAT('CMDB_CI~INSTALL_STATUS~',UPPER(SRC.install_status)),'UNSPECIFIED')=LKP.row_id AND SRC.sourceinstance=LKP.source_id 
WHERE 
( 
(
SRC.sys_id IN (SELECT SRC1.sys_id FROM png_mdsdb.cmdb_ci_hardware_final SRC1 WHERE SRC1.cdctype<>'D' AND SRC1.hardware_status ='Installed')
OR SRC.sys_id IN (SELECT SRC2.sys_id FROM png_mdsdb.cmdb_ci_storage_device_final SRC2 WHERE SRC2.cdctype<>'D' AND SRC2.u_pg_hardware_status ='Installed')
OR SRC.sys_id IN (SELECT SRC3.sys_id FROM png_mdsdb.cmdb_ci_voice_hardware_final SRC3 WHERE SRC3.cdctype<>'D' AND SRC3.u_pg_hardware_status ='Installed')
)
AND LKP.dimension_name IN ('Leverage/Optimize','Design/Build')
)
AND SRC.cdctype<>'D'
group by 1;

=============
SELECT active_device_flag_c,b.dimension_name,c.dimension_name,b.dimension_code from png_mdwdb.d_configuration_item a 
JOIN png_mdwdb.d_lov b 
ON a.cmdb_ci_hardware_status_c_key = b.row_key
JOIN png_mdwdb.d_lov c
ON a.cmdb_ci_install_status_c_key = c.row_key


where a.row_id in(
SELECT SRC.sys_id
FROM png_mdsdb.cmdb_ci_final SRC 
LEFT JOIN png_mdwdb.d_configuration_item TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN png_mdwdb.d_lov LKP ON 
COALESCE(CONCAT('CMDB_CI~INSTALL_STATUS~',UPPER(SRC.install_status)),'UNSPECIFIED')=LKP.row_id AND SRC.sourceinstance=LKP.source_id 
WHERE 
( 
(
SRC.sys_id IN (SELECT SRC1.sys_id FROM png_mdsdb.cmdb_ci_hardware_final SRC1 WHERE SRC1.cdctype<>'D' AND SRC1.hardware_status ='Installed')
OR SRC.sys_id IN (SELECT SRC2.sys_id FROM png_mdsdb.cmdb_ci_storage_device_final SRC2 WHERE SRC2.cdctype<>'D' AND SRC2.u_pg_hardware_status ='Installed')
OR SRC.sys_id IN (SELECT SRC3.sys_id FROM png_mdsdb.cmdb_ci_voice_hardware_final SRC3 WHERE SRC3.cdctype<>'D' AND SRC3.u_pg_hardware_status ='Installed')
)
AND LKP.dimension_name IN ('Leverage/Optimize','Design/Build')
)
AND SRC.cdctype<>'D'



AND SRC.sys_id not in (SELECT row_id from  png_mdwdb.d_configuration_item where active_device_flag_c ='Y' and hardware_applicable_flag_c ='Y' and soft_deleted_flag ='N'));


============


Managed_Devices:

SELECT (CASE WHEN SRC.sys_class_name IN ('cmdb_ci_win_server','cmdb_ci_computer','cmdb_ci_laptop_pc','cmdb_ci_desktop_pc','u_cmdb_ci_smartphone','u_cmdb_ci_tablet')
AND UPPER(COALESCE(SRC1.discovery_source,SRC2.discovery_source,SRC3.discovery_source)) NOT IN ('AUCMDB','INTERSTATES','MARIMBA','AIRWATCH')
THEN 'Y' ELSE 'N' END
),TRGT.managed_device_flag_c,Count(1) as CNT 
FROM png_mdsdb.cmdb_ci_final SRC 
LEFT JOIN png_mdsdb.cmdb_ci_hardware_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance AND SRC1.cdctype<>'D'
LEFT JOIN png_mdsdb.cmdb_ci_storage_device_final SRC2 ON SRC.sys_id=SRC2.sys_id AND SRC.sourceinstance=SRC2.sourceinstance AND SRC2.cdctype<>'D'
LEFT JOIN png_mdsdb.cmdb_ci_voice_hardware_final SRC3 ON SRC.sys_id=SRC2.sys_id AND SRC.sourceinstance=SRC2.sourceinstance AND SRC3.cdctype<>'D'
LEFT JOIN png_mdwdb.d_configuration_item TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
group by 1,2;


Tenable_Count 
Select count(1) AS Tenable_Count
FROM png_mdsdb.png_tnbl_tenable_asset_final a where a.cdctype='X' AND (a.hostnames IS NOT NULL OR a.fqdns IS NOT NULL);




SELECT SRC1.u_pg_area,
SRC1.u_pg_site_type,SRC1.country,
Count(SRC.sys_id) as CNT 
FROM png_mdsdb.cmdb_ci_final SRC 
LEFT JOIN png_mdsdb.cmn_location_final SRC1 ON SRC.location=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN png_mdwdb.d_configuration_item TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN png_mdwdb.d_location LKP ON SRC.location=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE SRC1.u_pg_area='NORTH AMER AREA'
AND SRC1.u_active='1'
group by 1,2,3;


SELECT SRC1.u_pg_area,
SRC1.u_pg_site_type,SRC1.country,
Count(SRC.sys_id) as CNT 
FROM png_mdsdb.cmdb_ci_final SRC 
LEFT JOIN png_mdsdb.cmn_location_final SRC1 ON SRC.location=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN png_mdwdb.d_configuration_item TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN png_mdwdb.d_location LKP ON SRC.location=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE SRC.name IN ('5cg5021w9q-x7','12416770253-w10')


group by 1,2,3;








