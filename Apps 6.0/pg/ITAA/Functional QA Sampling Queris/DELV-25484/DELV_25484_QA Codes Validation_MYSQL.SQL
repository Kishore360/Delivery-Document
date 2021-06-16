Select 'Old',b.*
From png_mdsdb.cmdb_ci_final a 
LEFT JOIN png_mdsdb.pg_mega_irisk_assessment_issues_final b ON a.u_pg_source_system_id=b.MEGA_HEX_ID AND a.sourceinstance=b.sourceinstance;

Select 'New',b.*
From png_mdsdb.cmdb_ci_final a
LEFT JOIN png_mdsdb.pg_mega_irisk_assessment_issues_new_final b ON a.u_pg_source_system_id=b.MEGA_HEX_ID AND a.sourceinstance=b.sourceinstance;

Select 'Archer',b.MEGA_HEX_ID,a.iRisk_Status,a.*
From png_mdsdb.cmdb_ci_appl_final a 
LEFT JOIN png_mdsdb.pg_mega_archer_data_for_numerify_report_irisk_ng_c_final b 
ON a.u_pg_source_system_id=b.MEGA_HEX_ID and a.sourceinstance=b.sourceinstance  AND b.cdctype='X'
AND a.cdctype='X';



Select a.u_pg_source_system_id,a.name,b.number AS Request_Number
From png_mdsdb.cmdb_ci_appl_final a 
LEFT JOIN png_mdsdb.sc_req_item_final b ON a.sys_id=b.cmdb_ci AND a.sourceinstance=b.sourceinstance and b.cdctype='X'
Where a.u_pg_source_system_id='00230EB055357148'
AND a.cdctype='X';



Select 'Old',b.MEGA_HEX_ID
From png_mdsdb.cmdb_ci_final a 
LEFT JOIN png_mdsdb.pg_mega_irisk_assessment_issues_final b ON a.u_pg_source_system_id=b.MEGA_HEX_ID AND a.sourceinstance=b.sourceinstance
Where b.MEGA_HEX_ID='0AC90B0C5F1A0375'
UNION ALL
Select 'New',b.MEGA_HEX_ID
From png_mdsdb.cmdb_ci_final a
LEFT JOIN png_mdsdb.pg_mega_irisk_assessment_issues_new_final b ON a.u_pg_source_system_id=b.MEGA_HEX_ID AND a.sourceinstance=b.sourceinstance
Where b.MEGA_HEX_ID ='0AC90B0C5F1A0375'
UNION 
Select 'Archer',b.MEGA_HEX_ID
From png_mdsdb.cmdb_ci_appl_final a 
JOIN png_mdsdb.pg_mega_archer_data_for_numerify_report_irisk_ng_c_final b 
ON a.u_pg_source_system_id=b.MEGA_HEX_ID and a.sourceinstance=b.sourceinstance  AND b.cdctype='X'
AND a.cdctype='X'
AND b.MEGA_HEX_ID IN ('0AC90B0C5F1A0375')


Select b.MEGA_HEX_ID,b.Related_Application AS Asset_Name,b.iRisk_ID,b.iRisk_Status,b.Total_of_issues,b.Issues,
b.compliance_Area_completion,b.Additional_Closure_information,
b.Snow_EA_Completed_On,b.iRisk_Start_Date,a.u_irisk_completion_date AS IRisk_Completion_Date
From png_mdsdb.cmdb_ci_appl_final a 
JOIN png_mdsdb.pg_mega_archer_data_for_numerify_report_irisk_ng_c_final b 
ON a.u_pg_source_system_id=b.MEGA_HEX_ID and a.sourceinstance=b.sourceinstance  AND b.cdctype='X'
AND a.cdctype='X'
AND b.MEGA_HEX_ID IN ('0AC90B0C5F1A0375','0CF40D695F183DE0','67C9682A5F175556','8B108CCA55D12EB4','9D199D695F274E62');

Select b.MEGA_HEX_ID,b.Related_Application AS Asset_Name,b.iRisk_ID,b.iRisk_Status,b.Total_of_issues,b.Issues,
b.compliance_Area_completion,b.Additional_Closure_information,
b.Snow_EA_Completed_On,b.iRisk_Start_Date,a.u_irisk_completion_date AS IRisk_Completion_Date
From png_mdsdb.cmdb_ci_appl_final a 
JOIN png_mdsdb.pg_mega_archer_data_for_numerify_report_irisk_ng_c_final b 
ON a.u_pg_source_system_id=b.MEGA_HEX_ID and a.sourceinstance=b.sourceinstance  AND b.cdctype='X'
AND a.cdctype='X'
AND b.MEGA_HEX_ID IN ('0AC90B0C5F1A0375','0CF40D695F183DE0','67C9682A5F175556','8B108CCA55D12EB4','9D199D695F274E62')