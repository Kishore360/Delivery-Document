SELECT d.row_key ,
CASE WHEN dc.owner_accuracy_flag_c='Y'  THEN 'UNSPECIFIEDo' ELSE 'Owned by'  END as gap_column ,
CASE WHEN dc.owner_accuracy_flag_c='Y'  THEN 0 ELSE 1 END as gap_count , 1 as scope_count  
FROM (SELECT * FROM png_itam_hw_mdwdb.d_configuration_item WHERE soft_deleted_flag='N' AND class in ('Desktop PC') AND number_c='CI000375858' ) d
JOIN png_itam_hw_mdwdb.d_internal_contact dc ON d.owned_by_key=dc.row_key

UNION ALL

SELECT d.row_key ,
CASE WHEN dl.active_c ='Y'  THEN 'UNSPECIFIEDl' ELSE 'Location' END as gap_column ,
CASE WHEN dl.active_c ='Y'  THEN 0 ELSE 1 END as gap_count , 1 as scope_count  
FROM (SELECT * FROM png_itam_hw_mdwdb.d_configuration_item WHERE soft_deleted_flag='N' AND class in ('Desktop PC') AND number_c='CI000375858' ) d
JOIN png_itam_hw_mdwdb.d_location dl ON d.location_key=dl.row_key


UNION ALL

SELECT d.row_key ,
CASE WHEN dl.dimension_name in ('Decommissioned','Defective','Duplicate / Invalid','In Maintenance','In Stock','Installed','Missing','On Order','Pending decommission','Stolen / Lost')  THEN 'UNSPECIFIEDh' ELSE 'Hardware Status' END as gap_column ,
CASE WHEN dl.dimension_name in ('Decommissioned','Defective','Duplicate / Invalid','In Maintenance','In Stock','Installed','Missing','On Order','Pending decommission','Stolen / Lost')  THEN 0 ELSE 1 END as gap_count , 1 as scope_count  
FROM (SELECT * FROM png_itam_hw_mdwdb.d_configuration_item WHERE soft_deleted_flag='N' AND class in ('Desktop PC') AND number_c='CI000375858' ) d
JOIN png_itam_hw_mdwdb.d_lov dl ON d.cmdb_ci_hardware_status_c_key=dl.row_key

UNION ALL

SELECT d.row_key ,
CASE WHEN  d.last_discovered <= df.lastupdated  
  THEN 'UNSPECIFIEDm' ELSE 'Most recent discovery date' END as gap_column ,
CASE WHEN  d.last_discovered <= df.lastupdated
THEN 0 ELSE 1 END as gap_count , 1 as scope_count  
FROM png_itam_hw_mdwdb.f_configuration_item f 
JOIN (SELECT * FROM png_itam_hw_mdwdb.d_configuration_item WHERE soft_deleted_flag='N' AND class in ('Desktop PC') AND number_c='CI000375858' ) d ON f.configuration_item_key = d.row_key
JOIN (SELECT max(lastupdated) as lastupdated,source_id FROM png_itam_hw_mdwdb.d_o_data_freshness GROUP BY source_id) df ON f.source_id=df.source_id
JOIN png_itam_hw_mdwdb.d_lov dl ON d.hardware_pg_network_connected_c_key=dl.row_key
JOIN png_itam_hw_mdwdb.d_lov l ON d.cmdb_ci_discovery_source_c_key=l.row_key
INNER JOIN png_itam_hw_mdwdb.d_lov hard 
            ON d.cmdb_ci_hardware_status_c_key=hard.row_key
where hard.dimension_name ='Installed' and  (l.dimension_name <> 'Direct' or dl.dimension_name <>'No')


UNION ALL

SELECT d.row_key ,
CASE WHEN d.class in ('IP Switch','Laptop PC','Desktop PC','Smartphone','Windows Server','Linux Server','Hardware','Tablet','Network Gear','Voice System Hardware','Wireless Access Point',
'Printer','IP Router','ESX Server','IP Firewall','UNIX Server','Storage Device',
'Private Branch Exchange','Resource Group','Mobile Device','Server Chassis')  THEN 'UNSPECIFIEDd' ELSE 'Device Type' END as gap_column ,
CASE WHEN d.class in ('IP Switch','Laptop PC','Desktop PC','Smartphone','Windows Server','Linux Server','Hardware','Tablet','Network Gear','Voice System Hardware','Wireless Access Point',
'Printer','IP Router','ESX Server','IP Firewall','UNIX Server','Storage Device',
'Private Branch Exchange','Resource Group','Mobile Device','Server Chassis')  THEN 0 ELSE 1 END as gap_count , 1 as scope_count  
FROM (SELECT * FROM png_itam_hw_mdwdb.d_configuration_item WHERE soft_deleted_flag='N' AND class in ('Desktop PC') AND number_c='CI000375858' ) d


UNION ALL

SELECT d.row_key ,
CASE WHEN d.u_pg_storage_allocated_c>0  THEN 'UNSPECIFIEDs'  ELSE 'Storage' END as gap_column ,
CASE WHEN d.u_pg_storage_allocated_c>0  THEN 0 ELSE 1 END as gap_count , 1 as scope_count  
FROM (SELECT * FROM png_itam_hw_mdwdb.d_configuration_item WHERE soft_deleted_flag='N' AND class in ('Desktop PC') AND number_c='CI000375858' ) d
where d.class in ('Windows Server','Linux Server','ESX Server','UNIX Server')  

UNION ALL

SELECT d.row_key ,
CASE WHEN l.dimension_name IN ('Design/Build','Leverage/Optimize','Decommissioned','Not Used / Reference')  THEN 'UNSPECIFIEDls' ELSE 'Life Cycle Status' END as gap_column ,
CASE WHEN l.dimension_name IN ('Design/Build','Leverage/Optimize','Decommissioned','Not Used / Reference')  THEN 0 ELSE 1 END as gap_count , 1 as scope_count  
FROM (SELECT * FROM png_itam_hw_mdwdb.d_configuration_item WHERE soft_deleted_flag='N' AND class in ('Desktop PC') AND number_c='CI000375858' ) d
JOIN png_itam_hw_mdwdb.d_lov l ON d.cmdb_ci_install_status_c_key=l.row_key

UNION ALL

SELECT d.row_key ,
CASE WHEN l.dimension_name in ('Airwatch','auCMDB','BigFix','CA Spectrum','Cisco','Cloud','Direct','Interstate','Oracle','XEROX CORP','Lansweeper','Network')  THEN 'UNSPECIFIEDds' ELSE 'Discovery Source' END as gap_column ,
CASE WHEN l.dimension_name in ('Airwatch','auCMDB','BigFix','CA Spectrum','Cisco','Cloud','Direct','Interstate','Oracle','XEROX CORP','Lansweeper','Network')  THEN 0 ELSE 1 END as gap_count , 1 as scope_count  
FROM (SELECT * FROM png_itam_hw_mdwdb.d_configuration_item WHERE soft_deleted_flag='N' AND class in ('Desktop PC') AND number_c='CI000375858' ) d
JOIN png_itam_hw_mdwdb.d_lov l ON d.cmdb_ci_discovery_source_c_key=l.row_key

UNION ALL

SELECT d.row_key ,
CASE WHEN dl.dimension_name IN ('Development','Development Backup (aka Maintenance)','Firefighting','Production','QA: Quality Assurance','Sandbox','Test','Test-Acceptance (BAT)','Test-Integration (SIT)','Test-TrialCutOver (TCO)','Training') THEN 'UNSPECIFIEDe' ELSE 'Environment' END as gap_column ,
CASE WHEN dl.dimension_name IN ('Development','Development Backup (aka Maintenance)','Firefighting','Production','QA: Quality Assurance','Sandbox','Test','Test-Acceptance (BAT)','Test-Integration (SIT)','Test-TrialCutOver (TCO)','Training')  THEN 0 ELSE 1 END as gap_count , 1 as scope_count  
FROM (SELECT * FROM png_itam_hw_mdwdb.d_configuration_item WHERE soft_deleted_flag='N' AND class in ('Desktop PC') AND number_c='CI000375858' ) d
LEFT JOIN png_itam_hw_mdwdb.d_lov l ON d.cmdb_ci_discovery_source_c_key = l.row_key
LEFT JOIN png_itam_hw_mdwdb.d_lov dl ON d.ci_pg_environment_c_key = dl.row_key
where (d.class in ('Windows Server','Linux Server') and l.dimension_name <>'Interstate')

UNION ALL

SELECT d.row_key ,
CASE WHEN COALESCE(dt.application_relationship,'UNSPECIFIED')='UNSPECIFIED' THEN 'Application Relationship' ELSE 'UNSPECIFIEDa' END as gap_column ,
CASE WHEN COALESCE(dt.application_relationship,'UNSPECIFIED')='UNSPECIFIED' THEN 1 ELSE 0 END as gap_count , 1 as scope_count  
FROM png_itam_hw_mdwdb.f_configuration_item f 
JOIN (SELECT * FROM png_itam_hw_mdwdb.d_configuration_item WHERE soft_deleted_flag='N' AND class in ('Desktop PC') AND number_c='CI000375858' ) d ON f.configuration_item_key = d.row_key
LEFT JOIN (select child_config_item_c_key,
group_concat(distinct name separator ' , ') as application_relationship
from (select b.child_config_item_c_key,d.name,b.parent_config_item_c_key
from (select row_key,name
from png_itam_hw_mdwdb.d_configuration_item 
where soft_deleted_flag='N' and ci_hardware_c_flag='Y') a
join png_itam_hw_mdwdb.d_cmdb_rel_ci_c b on b.child_config_item_c_key=a.row_key
join png_itam_hw_mdwdb.d_cmdb_rel_type_c c on b.rel_type_c_key=c.row_key and c.name ='Runs on::Runs'
join png_itam_hw_mdwdb.d_configuration_item d on b.parent_config_item_c_key=d.row_key
join png_itam_hw_mdwdb.d_application da on d.application_c_key=da.row_key
JOIN png_itam_hw_mdwdb.d_lov dl on d.cmdb_ci_install_status_c_key=dl.row_key
WHERE dl.dimension_name<>'Decommissioned') a
group by child_config_item_c_key) dt ON d.row_key = dt.child_config_item_c_key
LEFT JOIN png_itam_hw_mdwdb.d_internal_organization g ON f.assignment_group_key = g.row_key
where d.class in ('Windows Server','Linux Server','UNIX Server') AND (g.organization_name like 'PG_ITAM_Cloud%'
OR g.organization_name='DXC_ITAM_AUCMDB')

UNION ALL

SELECT d.row_key ,
CASE WHEN timestampdiff(year,dt.hw_status_last_update_date_c,df.lastupdated) <=1  THEN 'UNSPECIFIEDp'  ELSE 'Pending Decommission' END as gap_column ,
CASE WHEN timestampdiff(year,dt.hw_status_last_update_date_c,df.lastupdated) <=1  THEN 0 ELSE 1 END as gap_count , 1 as scope_count  
FROM (SELECT * FROM png_itam_hw_mdwdb.d_configuration_item WHERE soft_deleted_flag='N' AND class in ('Desktop PC') AND number_c='CI000375858' ) d
LEFT JOIN png_itam_hw_mdwdb.d_configuration_item_ext_c dt ON d.configuration_item_ext_c_key = dt.row_key
LEFT JOIN png_itam_hw_mdwdb.d_lov dl ON d.cmdb_ci_hardware_status_c_key=dl.row_key
LEFT JOIN (SELECT max(lastupdated) as lastupdated,source_id FROM png_itam_hw_mdwdb.d_o_data_freshness where soft_deleted_flag='N'
GROUP BY source_id) df ON d.source_id=df.source_id
where dl.dimension_name ='Pending decommission'

UNION ALL

SELECT d.row_key ,
CASE WHEN (dt.target_decommission_date_c is not null or dt.target_decommission_date_c <>'' or dt.target_decommission_date_c<df.lastupdated)  THEN 'UNSPECIFIEDe' 
 ELSE 'End Of Life' END as gap_column ,
CASE WHEN (dt.target_decommission_date_c is not null or dt.target_decommission_date_c <>'' or dt.target_decommission_date_c<df.lastupdated)  THEN 0 ELSE 1 END as gap_count , 1 as scope_count  
FROM (SELECT * FROM png_itam_hw_mdwdb.d_configuration_item WHERE soft_deleted_flag='N' AND class in ('Desktop PC') AND number_c='CI000375858' ) d
LEFT JOIN png_itam_hw_mdwdb.d_configuration_item_ext_c dt ON d.configuration_item_ext_c_key = dt.row_key
LEFT JOIN png_itam_hw_mdwdb.d_lov dl ON d.cmdb_ci_install_status_c_key=dl.row_key
LEFT JOIN (SELECT max(lastupdated) as lastupdated,source_id FROM png_itam_hw_mdwdb.d_o_data_freshness where soft_deleted_flag='N'
GROUP BY source_id) df ON d.source_id=df.source_id
where  dl.dimension_name in ('SUNSET','RETIRED')
;
