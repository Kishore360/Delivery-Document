SELECT 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.device_category_c' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) as CNT 
FROM
from png_mdwdb.d_configuration_item a 
 JOIN
 (SELECT  tenable_asset.id ,tenable_asset.sourceinstance,  CASE WHEN tenable_asset.fqdns LIKE '%clients%' OR RIGHT(substring_index(tenable_asset.fqdns,'.',1), 3) = '-X7' 
          OR RIGHT(substring_index(tenable_asset.fqdns,'.',1),4) = '-W10'  
          OR tenable_asset.netbios_names LIKE '%clients%' 
          OR RIGHT(substring_index(tenable_asset.netbios_names,'.',1),3) = '-X7' 
          OR RIGHT(substring_index(tenable_asset.netbios_names,'.',1),4) = '-W10'  THEN 'PC Services - MyPGS' 
     WHEN tenable_asset.fqdns LIKE '%pbx%' OR  tenable_asset.netbios_names LIKE '%pbx%' OR  tenable_asset.fqdns LIKE '%cdr%' THEN 'PBX - Voice Networks' 
     WHEN tenable_asset.fqdns LIKE '%xerox%' OR tenable_asset.netbios_names LIKE '%xerox%' THEN 'Xerox Printer - Printing Services - ITS' 
     WHEN tenable_asset.operating_systems LIKE '%Camera%' THEN 'IP Camera - Facilities' 
     WHEN tenable_asset.operating_systems LIKE '%Cisco Video%' THEN 'Video Collaboration' 
     WHEN tenable_asset.operating_systems LIKE '%Cisco%' THEN 'Network Gear - ITS' 
     WHEN tenable_asset.operating_systems LIKE '%FortiOS%' THEN 'FortiOS' 
     WHEN tenable_asset.operating_systems LIKE '%Microsoft Windows Server%' THEN 'Windows Services' 
     WHEN tenable_asset.operating_systems LIKE '%Windows%' THEN 'Non-standard Windows Device' 
     WHEN tenable_asset.operating_systems LIKE '%Crestron AirMedia%' THEN 'Facilities' 
	 WHEN tenable_asset.operating_systems LIKE '%Linux Kernel%' THEN 'Linux Kernel' 
     ELSE 'Uncategorized' END device_category FROM
                png_mdsdb.png_tnbl_tenable_asset_final tenable_asset 
UNION 

SELECT cmdb_ci.sys_id , cmdb_ci.sourceinstance , CASE WHEN cmdb_ci.fqdn LIKE '%clients%' OR RIGHT(substring_index(cmdb_ci.fqdn,'.',1),3) = '-X7' 
          OR RIGHT(substring_index(cmdb_ci.fqdn,'.',1),4) = '-W10' THEN 'PC Services - MyPGS' 
     WHEN cmdb_ci.fqdn LIKE '%pbx%' OR cmdb_ci.fqdn LIKE '%cdr%' OR cmdb_ci.comments LIKE '%pbx%' THEN 'PBX - Voice Networks' 
     WHEN cmdb_ci.fqdn LIKE '%xerox%' THEN 'Xerox Printer - Printing Services - ITS' 
     WHEN cmdb_ci.comments LIKE '%xerox%' THEN 'Xerox Printer - Printing Services - ITS' 
     ELSE 'Uncategorized' END device_category
	 from png_mdsdb.cmdb_ci_final cmdb_ci) b 
     ON a.row_id = b.id and a.source_id= b.sourceinstance
     where a.device_category_c <> b.device_category
) temp;

 