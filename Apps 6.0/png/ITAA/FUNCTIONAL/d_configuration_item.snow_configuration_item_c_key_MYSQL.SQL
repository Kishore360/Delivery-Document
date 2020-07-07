-- Tenable.fqdns = cmdb_ci.fqdn 
-- SUBSTRING(cmdb_ci.fqdn,1,locate('.',cmdb_ci.fqdn)-1) = Tenable.fqdns
-- SUBSTRING(Tenable.fqdns,1,locate('.',Tenable.fqdns)-1) = cmdb_ci.fqdn
-- lower(cmdb_ci.fqdn)=lower(Tenable.hostnames)
-- SUBSTRING(cmdb_ci.fqdn,1,locate('.',cmdb_ci.fqdn)-1)=lower(Tenable.hostnames)
-- SUBSTRING(Tenable.hostnames,1,locate('.',Tenable.hostnames)-1)=lower(cmdb_ci.fqdn)
-- lower(Tenable.fqdns)=lower(cmdb_ci.name)
-- SUBSTRING(cmdb_ci.name,1,locate('.',cmdb_ci.name)-1) = Tenable.fqdns
-- SUBSTRING(Tenable.fqdns,1,locate('.',Tenable.fqdns)-1) = cmdb_ci.name
-- Tenable.hostnames = cmdb_ci.name
-- SUBSTRING(cmdb_ci.name,1,locate('.',cmdb_ci.name)-1) = Tenable.hostnames
-- SUBSTRING(Tenable.hostnames,1,locate('.',Tenable.hostnames)-1) = cmdb_ci.name


SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.snow_configuration_item_c_key' ELSE 'SUCCESS' END as Message
FROM
(

SELECT Count(1) as CNT 
FROM png_mdwdb.d_configuration_item TRGT 
JOIN 
(
SELECT id ,sourceinstance,fqdns, 
cast( CASE WHEN SUBSTRING(fqdns,1,locate('.',fqdns)-1) = '' THEN NULL  WHEN RIGHT(SUBSTRING(fqdns,1,locate('.',fqdns)-1),3) in ('oa1','oa2','bck','bur','vc1','vc2','vc3','vc4','vc5') 
THEN IF(RIGHT(SUBSTRING(fqdns,1,locate('.',fqdns)-4),1)='-',SUBSTRING(fqdns,1,locate('.',fqdns)-5),SUBSTRING(fqdns,1,locate('.',fqdns)-4)) ELSE SUBSTRING(fqdns,1,locate('.',fqdns)-1) END as char(255)) COLLATE utf8_unicode_ci as fqdns_substr
,cast( if(SUBSTRING(hostnames,1,locate('.',hostnames)-1) = '',NULL,SUBSTRING(hostnames,1,locate('.',hostnames)-1)) as char(255)) COLLATE utf8_unicode_ci as hostnames_substr, hostnames,cast( netbios_names as char(255)) COLLATE utf8_unicode_ci  netbios_name , 
cast( if(SUBSTRING(netbios_names,1,locate('.',netbios_names)-1) = '',NULL,SUBSTRING(netbios_names,1,locate('.',netbios_names)-1)) as char(255))
COLLATE utf8_unicode_ci as netbios_name_substr,
cast( CASE WHEN netbios_names LIKE '%-x7' THEN SUBSTRING(netbios_names,1,locate('-x7',lower(netbios_names))-1)
WHEN netbios_names LIKE '%-w10' THEN SUBSTRING(netbios_names,1,locate('-w10',lower(netbios_names))-1)
WHEN netbios_names LIKE '%-w7' THEN SUBSTRING(netbios_names,1,locate('-w7',lower(netbios_names))-1)
ELSE NULL END  as char(255)) COLLATE utf8_unicode_ci as bios_upg_substr,
cast( CASE WHEN hostnames LIKE '%-x7'  THEN SUBSTRING(hostnames,1,locate('-x7',lower(hostnames))-1)
WHEN hostnames LIKE '%-w10' THEN SUBSTRING(hostnames,1,locate('-w10',lower(hostnames))-1)
WHEN hostnames LIKE '%-w7' THEN SUBSTRING(hostnames,1,locate('-w7',lower(hostnames))-1)
ELSE NULL END  as char(255)) COLLATE utf8_unicode_ci as hostnames_upg_substr,
cast( left(mac_addresses,255) as char(255)) COLLATE utf8_unicode_ci as mac_addresses, 
cast( CASE WHEN fqdns LIKE '%-con.na.pg.com' OR fqdns LIKE '%-con.eu.pg.com' OR fqdns LIKE '%-con.ap.pg.com' OR fqdns LIKE '%-con.la.pg.com'
THEN SUBSTRING(fqdns,1,length(SUBSTRING(fqdns,1,locate('pg.com',lower(fqdns))-1))-8) 
WHEN fqdns LIKE '%cons.na.pg.com' OR fqdns LIKE '%cons.eu.pg.com' OR fqdns LIKE '%cons.ap.pg.com' OR fqdns LIKE '%cons.la.pg.com'
THEN SUBSTRING(fqdns,1,length(SUBSTRING(fqdns,1,locate('pg.com',lower(fqdns))-1))-8) 
ELSE NULL END  as char(255)) COLLATE utf8_unicode_ci  as fqdns_substr_new,
cast( CASE WHEN fqdns LIKE '%-ilo.na.pg.com' OR fqdns LIKE '%-ilo.eu.pg.com' OR fqdns LIKE '%-ilo.ap.pg.com' OR fqdns LIKE '%-ilo.la.pg.com'
THEN SUBSTRING(fqdns,1,length(SUBSTRING(fqdns,1,locate('pg.com',lower(fqdns))-1))-8)
WHEN fqdns LIKE '%ilo.na.pg.com' OR fqdns LIKE '%ilo.eu.pg.com' OR fqdns LIKE '%ilo.ap.pg.com' OR fqdns LIKE '%ilo.la.pg.com'
THEN SUBSTRING(fqdns,1,length(SUBSTRING(fqdns,1,locate('pg.com',lower(fqdns))-1))-7)
ELSE NULL END  as char(255)) COLLATE utf8_unicode_ci  as fqdns_substr_ilo 
FROM png_mdsdb.png_tnbl_tenable_asset_final where cdctype ='X'
) tnb ON TRGT.row_id=tnb.id AND TRGT.source_id=tnb.sourceinstance
JOIN 
(
SELECT 
sys_id, sourceinstance , fqdn , cast( SUBSTRING(fqdn,1,locate('.',fqdn)-1) as char(255)) COLLATE utf8_unicode_ci as fqdn_substr,
cast( SUBSTRING(name,1,locate('.',name)-1) as char(255)) COLLATE utf8_unicode_ci as name_substr, name , 
cast( CASE WHEN name LIKE '%-x7' THEN SUBSTRING(name,1,locate('-x7',lower(name))-1)
WHEN name LIKE '%-w10' THEN SUBSTRING(name,1,locate('-w10',lower(name))-1)
WHEN name LIKE '%-w7' THEN SUBSTRING(name,1,locate('-w7',lower(name))-1)
ELSE NULL END  as char(255)) COLLATE utf8_unicode_ci as upg_substr,
mac_address
FROM png_mdsdb.cmdb_ci_final where cdctype ='X' and (discovery_source not in ('NS','AFR','AFRS','AIRWATCH, LLC') OR discovery_source is  null) 
) snow ON tnb.fqdns=snow.fqdn OR tnb.fqdns = snow.fqdn_substr OR tnb.fqdns_substr = snow.fqdn 
OR tnb.hostnames = snow.fqdn OR tnb.hostnames = snow.fqdn_substr
OR tnb.hostnames_substr = snow.fqdn OR tnb.fqdns = snow.name
OR tnb.fqdns = snow.name_substr OR tnb.fqdns_substr = snow.name 
OR  tnb.hostnames = snow.name OR tnb.hostnames = snow.name_substr OR tnb.hostnames_substr = snow.name 
JOIN png_mdwdb.d_configuration_item LKP ON snow.sys_id=LKP.row_id AND snow.sourceinstance=LKP.source_id
WHERE 
COALESCE(LKP.row_key, CASE WHEN snow.sys_id IS NULL THEN 0 ELSE -1 END) <> TRGT.snow_configuration_item_c_key
) temp;




