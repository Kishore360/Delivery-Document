SELECT Count(1) as CNT 
FROM png_mdsdb.cmdb_ci_final SRC 
LEFT JOIN png_mdsdb.cmdb_ci_hardware_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance AND SRC1.cdctype<>'D'
LEFT JOIN png_mdsdb.cmdb_ci_storage_device_final SRC2 ON SRC.sys_id=SRC2.sys_id AND SRC.sourceinstance=SRC2.sourceinstance AND SRC2.cdctype<>'D'
LEFT JOIN png_mdsdb.cmdb_ci_voice_hardware_final SRC3 ON SRC.sys_id=SRC2.sys_id AND SRC.sourceinstance=SRC2.sourceinstance AND SRC3.cdctype<>'D'
WHERE SRC.assignment_group iS NOT NULL 
AND SRC1.hardware_status='Installed' OR SRC2.u_pg_hardware_status='Installed' OR SRC3.u_pg_hardware_status='Installed'
AND SRC.cdctype<>'D';


select distinct hardware_status from  png_mdsdb.cmdb_ci_hardware_final;

select distinct u_pg_hardware_status from png_mdsdb.cmdb_ci_storage_device_final;

select distinct u_pg_hardware_status from  png_mdsdb.cmdb_ci_voice_hardware_final;

select distinct png_mdsdb.cmdb_ci_voice_hardware_final


SELECT SRC1.hardware_status,
Count(distinct SRC.sys_id) as CNT 
FROM png_mdsdb.cmdb_ci_final SRC 
LEFT JOIN png_mdsdb.cmdb_ci_hardware_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance AND SRC1.cdctype<>'D'
LEFT JOIN png_mdsdb.cmdb_ci_storage_device_final SRC2 ON SRC.sys_id=SRC2.sys_id AND SRC.sourceinstance=SRC2.sourceinstance AND SRC2.cdctype<>'D'
LEFT JOIN png_mdsdb.cmdb_ci_voice_hardware_final SRC3 ON SRC.sys_id=SRC2.sys_id AND SRC.sourceinstance=SRC2.sourceinstance AND SRC3.cdctype<>'D'
WHERE SRC.sys_class_name IN ('cmdb_ci_hardware','cmdb_ci_storage_device','cmdb_ci_voice_hardware')
AND SRC.cdctype<>'D'
group by 1;

==========================================

Cube Filter 

SELECT Count(1) as CNT 
FROM ldb.f_configuration_item a
JOIN ldb.d_configuration_item b ON a.configuration_item_key=b.row_key
JOIN ldb.d_lov_cmdb_ci_hardware_status_c c ON b.cmdb_ci_hardware_status_c_key=c.row_key
WHERE 
(b.hardware_applicable_flag_c='Y' AND
c.source_dimension_name NOT IN ('Decommissioned','Duplicate/Invalid','Duplicate / Invalid'))
OR (b.source_type_c='Tenable' and b.valid_unregistered_device_flag_c='Y')
AND b.operating_system_c
NOT IN ('HP Integrated Lights-Out','HP Integrated Lights Out','Oracle Integrated Lights Out Manager')