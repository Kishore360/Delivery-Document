Server
SELECT SRC.NAME,SRC.install_status,SRC.sys_class_name,
SRC2.Name AS AG,SRC.sys_id,SRC1.sys_id,SRC1.sys_id,SRC1.correlation_id
FROM png_mdsdb.cmdb_ci_final SRC 
LEFT JOIN png_mdsdb.cmdb_ci_server_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN png_mdsdb.sys_user_group_final SRC2 ON SRC.assignment_group=SRC2.sys_id AND SRC.sourceinstance=SRC2.sourceinstance
where SRC.NAME in ('aspac-harv',
'azl-mmgr-1',	
'azl-netjbx1',	
'azl-netjbx2',	
'azl-nss-fw-01',	
'azl-nss-web-01',	
'azl-worker-01',
'azl-worker-02',	
'azw-ap-sftp-l3',	
'azw-caucm-1',	
'azw-core-dsview',	
'azw-core-sftp-p',	
'azw-edgetools3',
'azw-l3-sftp-eu',	
'azw-l3-sftp-p',	
'canfa-console',	
'eu-harvester',	
'na-harvester')
AND SRC.cdctype='X'
AND SRC.install_status='13'



-- Server APP Releationship 

SELECT SRC.NAME,SRC.install_status,SRC.sys_class_name,
SRC2.Name AS AG,SRC.sys_id,SRC1.sys_id,SRC1.sys_id,SRC1.correlation_id
FROM png_mdsdb.cmdb_ci_final SRC 
LEFT JOIN png_mdsdb.cmdb_ci_server_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN png_mdsdb.sys_user_group_final SRC2 ON SRC.assignment_group=SRC2.sys_id AND SRC.sourceinstance=SRC2.sourceinstance
WHERE
 SRC.NAME in 
('SWAPOGEEWKS6',
'C1 Security Center',	
'CLL Computer Room',	
'GOAPOGEESVR',	
'GOAPOGEEWKS2',	
'GOC08SPXCM24',	
'WHAPOGEEWKS07',	
'tor-dmp18-sn8033',	
'tor-dmp20-sn8035',	
'tor-dmp21-sn8036',	
'tor-dmp23-sn8038',	
'tor-dmp25-sn8040',	
'us-4587-co6-wayfinder02',	
'us-4578-c03-wayfinder11',	
'us-4587-te5-wayfinder01',	
'us-4587-te3-wayfinder01')	
AND SRC.cdctype='X'
AND SRC.install_status='13';


Device Count :

SELECT
SRC2.Name AS AG, Count(distinct SRC.sys_id)
FROM png_mdsdb.cmdb_ci_final SRC 
LEFT JOIN png_mdsdb.cmdb_ci_hardware_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN png_mdsdb.sys_user_group_final SRC2 ON SRC.assignment_group=SRC2.sys_id AND SRC.sourceinstance=SRC2.sourceinstance
WHERE SRC1.hardware_status='installed'
AND SRC.install_status='13'
AND SRC1.u_pg_yn_network_connected='YES'
AND SRC2.name='PG_ITAM_PC_Services'
group by 1;


% Software_Discovery 


SELECT SRC.NAME,SRC.install_status,SRC.sys_class_name,
SRC2.Name AS AG,SRC.name,SRC3.inventory_device_name
FROM png_mdsdb.cmdb_ci_final SRC 
LEFT JOIN png_mdsdb.sys_user_group_final SRC2 ON SRC.assignment_group=SRC2.sys_id AND SRC.sourceinstance=SRC2.sourceinstance
LEFT JOIN png_mdsdb.us_fnms_reports_final SRC3 ON SRC.name=SRC3.inventory_device_name
WHERE SRC.name IN(
'C02TP8NZHTD6',
'C02J30XDF51R',
'C02KQ1HGFFRR',
'C02L3298F6T6',
'C02N64MYG3QP',
'C02NC2Z3G3QR',
'C02NC3STG3QP',
'C02NRGT0G3QD',
'C02PG09UFVH8',
'C02RQ2FGFVH7',
'C02SWC0JHF1R',
'C02SWW7SGTF1',
'C02SWW7YGTF1',
'C02T35ZXHF1Q',
'C02T40X3HF1P',
'C02T83EKGTF1',
'C02TM2EVHTD6'
);

