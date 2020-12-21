SELECT distinct a.row_id,tnb.id,tnb.fqdns,snow.fqdn
FROM png_mdwdb.d_configuration_item a 
JOIN 
(
SELECT id ,sourceinstance ,fqdns , 
cast( if(SUBSTRING(fqdns,1,locate('.',fqdns)-1) = '',NULL,SUBSTRING(fqdns,1,locate('.',fqdns)-1)) as char(255)) COLLATE utf8_unicode_ci as fqdns_substr,
cast( if(SUBSTRING(hostnames,1,locate('.',hostnames)-1) = '',NULL,SUBSTRING(hostnames,1,locate('.',hostnames)-1)) as char(255)) COLLATE utf8_unicode_ci as hostnames_substr, 
hostnames,  
cast( netbios_names as char(255)) COLLATE utf8_unicode_ci  netbios_name, 
cast( if(SUBSTRING(netbios_names,1,locate('.',netbios_names)-1) = '',NULL,SUBSTRING(netbios_names,1,locate('.',netbios_names)-1)) as char(255))
COLLATE utf8_unicode_ci as netbios_name_substr,
cast( CASE WHEN netbios_names LIKE '%-x7' THEN SUBSTRING(netbios_names,1,locate('-x7',lower(netbios_names))-1)
WHEN netbios_names LIKE '%-w10' THEN SUBSTRING(netbios_names,1,locate('-w10',lower(netbios_names))-1)
WHEN netbios_names LIKE '%-w7' THEN SUBSTRING(netbios_names,1,locate('-w7',lower(netbios_names))-1)
ELSE NULL END  as char(255)) COLLATE utf8_unicode_ci as bios_upg_substr,
cast( CASE WHEN hostnames LIKE '%-x7' THEN SUBSTRING(hostnames,1,locate('-x7',lower(hostnames))-1)
WHEN hostnames LIKE '%-w10' THEN SUBSTRING(hostnames,1,locate('-w10',lower(hostnames))-1)
WHEN hostnames LIKE '%-w7' THEN SUBSTRING(hostnames,1,locate('-w7',lower(hostnames))-1)
ELSE NULL END  as char(255)) COLLATE utf8_unicode_ci as hostnames_upg_substr
FROM png_mdsdb.png_tnbl_tenable_asset_final where cdctype ='X' 
) tnb ON a.row_id=tnb.id AND a.source_id=tnb.sourceinstance
JOIN 
(
SELECT sys_id, sourceinstance , fqdn , cast( SUBSTRING(fqdn,1,locate('.',fqdn)-1) as char(255)) COLLATE utf8_unicode_ci as fqdn_substr,
cast( SUBSTRING(name,1,locate('.',name)-1) as char(255)) COLLATE utf8_unicode_ci as name_substr, name, 
cast( CASE WHEN name LIKE '%-x7' THEN SUBSTRING(name,1,locate('-x7',lower(name))-1)
WHEN name LIKE '%-w10' THEN SUBSTRING(name,1,locate('-w10',lower(name))-1)
WHEN name LIKE '%-w7' THEN SUBSTRING(name,1,locate('-w7',lower(name))-1)
ELSE NULL END  as char(255)) COLLATE utf8_unicode_ci as upg_substr
FROM png_mdsdb.cmdb_ci_final where cdctype ='X' and discovery_source
not in ('NS','AFR','AFRS','AIRWATCH, LLC')
) snow ON tnb.fqdns = snow.fqdn





SELECT id ,sourceinstance ,fqdns,ipv4s, 
cast( if(SUBSTRING(fqdns,1,locate('.',fqdns)-1) = '',NULL,SUBSTRING(fqdns,1,locate('.',fqdns)-1)) as char(255)) COLLATE utf8_unicode_ci as fqdns_substr,
cast( if(SUBSTRING(hostnames,1,locate('.',hostnames)-1) = '',NULL,SUBSTRING(hostnames,1,locate('.',hostnames)-1)) as char(255)) COLLATE utf8_unicode_ci as hostnames_substr, 
hostnames,  
cast( netbios_names as char(255)) COLLATE utf8_unicode_ci  netbios_name, 
cast( if(SUBSTRING(netbios_names,1,locate('.',netbios_names)-1) = '',NULL,SUBSTRING(netbios_names,1,locate('.',netbios_names)-1)) as char(255))
COLLATE utf8_unicode_ci as netbios_name_substr,
cast( CASE WHEN netbios_names LIKE '%-x7' THEN SUBSTRING(netbios_names,1,locate('-x7',lower(netbios_names))-1)
WHEN netbios_names LIKE '%-w10' THEN SUBSTRING(netbios_names,1,locate('-w10',lower(netbios_names))-1)
WHEN netbios_names LIKE '%-w7' THEN SUBSTRING(netbios_names,1,locate('-w7',lower(netbios_names))-1)
ELSE NULL END  as char(255)) COLLATE utf8_unicode_ci as bios_upg_substr,
cast( CASE WHEN hostnames LIKE '%-x7' THEN SUBSTRING(hostnames,1,locate('-x7',lower(hostnames))-1)
WHEN hostnames LIKE '%-w10' THEN SUBSTRING(hostnames,1,locate('-w10',lower(hostnames))-1)
WHEN hostnames LIKE '%-w7' THEN SUBSTRING(hostnames,1,locate('-w7',lower(hostnames))-1)
ELSE NULL END  as char(255)) COLLATE utf8_unicode_ci as hostnames_upg_substr
FROM png_mdsdb.png_tnbl_tenable_asset_final where cdctype ='X';
-- AND fqdns='15yhnv2-w10.clients.pg.com';

Site_Address:

select address as StartIPAddress,EA_Site as ea_site
, CONCAT(cast(SUBSTRING_INDEX(nullif(ia.address,''),'.',1) as SIGNED)+cdr.Octet1,'.'
,cast(SUBSTRING_INDEX(SUBSTRING_INDEX(nullif(ia.address,''),'.',2),'.',-1) as signed)+cdr.Octet2,'.'
,cast(SUBSTRING_INDEX(SUBSTRING_INDEX(nullif(ia.address,''),'.',-2),'.',1) as signed)+cdr.Octet3,'.'
,cast(SUBSTRING_INDEX(nullif(ia.address,''),'.',-1) as signed)+cdr.Octet4) as EndIPAddress
,INET_ATON(address) as StartIPAddressInteger
,INET_ATON(CONCAT(cast(SUBSTRING_INDEX(nullif(ia.address,''),'.',1) as SIGNED)+cdr.Octet1,'.'
,cast(SUBSTRING_INDEX(SUBSTRING_INDEX(nullif(ia.address,''),'.',2),'.',-1) as signed)+cdr.Octet2,'.'
,cast(SUBSTRING_INDEX(SUBSTRING_INDEX(nullif(ia.address,''),'.',-2),'.',1) as signed)+cdr.Octet3,'.'
,cast(SUBSTRING_INDEX(nullif(ia.address,''),'.',-1) as signed)+cdr.Octet4)) as EndIPAddressInteger,
ia.comment
from png_mdsdb.png_tnbl_infoblox_allnetworks_final as ia
INNER JOIN png_mdsdb.png_tnbl_cidrtosubnet_config_final sb on nullif(ia.netmask,'') = sb.DottedDecimal
INNER JOIN png_mdsdb.png_tnbl_cidrv4notation_config_final cdr ON cdr.CIDRv4 = sb.CIDR;


Mac Address:

Select distinct a.mac_addresses
from png_mdsdb.png_tnbl_tenable_asset_final a where a.cdctype='X' and a.mac_addresses like '1C%';

Select a.netbios_names,a.fqdns,a.hostnames,a.last_seen,a.mac_addresses
from png_mdsdb.png_tnbl_tenable_asset_final a where a.cdctype='X' 
and a.mac_addresses like '1C%'
AND datediff(now(),a.last_seen) between 0 and 60;

Select a.name,a.mac_address
FROM png_mdsdb.cmdb_ci_final a
WHERE a.name iN ('5cg85192ld-w10','5cg8521fxt-w10','r90ny5ta-w10','DocuPrint 340A-AP 218005','DocuPrint C3360 584175');