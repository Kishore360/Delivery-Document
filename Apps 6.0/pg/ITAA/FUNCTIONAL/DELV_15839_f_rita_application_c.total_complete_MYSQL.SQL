-- DELV_15839_f_rita_application_c.total_complete_MYSQL.SQL 

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_rita_application_c.total_complete' ELSE 'SUCCESS' END as Message
FROM 
(

SELECT Count(1) as CNT 
FROM 

(
select name,count(1) as total_complete
,100*((count(1))/13) as perc_completeness
,100.00 - 100*((count(1))/13) as perc_in_completeness
,13- (count(1)) as total_incomplete
from(SELECT Y.name, field, value from png_mdsdb.pg_mega_pgb_application_rita_final A
JOIN (
select name,'PG_APPLICATION_DESCRIPTION' as field, short_description  as value
from  png_mdsdb.pg_mega_cmdb_ci_appl_final
where short_description is not null and short_description <> ''
union all
select name,'VOLUME_OF_RECORDS_EU' as field, u_pg_volume_records_eu  as value
from png_mdsdb.pg_mega_cmdb_ci_appl_final
where u_pg_volume_records_eu  is not null and u_pg_volume_records_eu  <> ''
union all
select name,'VOLUME_OF_RECORDS_ALL' as field, u_pg_volume_records_all  as value
from png_mdsdb.pg_mega_cmdb_ci_appl_final
where u_pg_volume_records_all  is not null and u_pg_volume_records_all  <> ''
union all
select name,'AUTOMATED_DECISION_MAKING' as field, u_pg_automateddecision_making  as value
from png_mdsdb.pg_mega_cmdb_ci_appl_final
where u_pg_automateddecision_making  is not null and u_pg_automateddecision_making  <> ''
-- References
union all
select a.sys_id as name, 'Owning Organization', max(responsible_org_unit_hexid) as value , 1 as scope
from png_mds_viewdb.pg_mega_cmdb_ci_appl_final a
JOIN png_mds_viewdb.pg_mega_pgv_app_responsible_org_person_final b
ON a.u_pg_source_system_id = b.app_hexid
where (b.pg_development_org <>'N' AND b.pg_development_org is not null ) and b.cdctype <>'D' and b.app_hexid is not null and  b.responsible_org_unit_hexid is not null and responsible_org_unit_hexid <>''
group by app_hexid 
union all
select sys_id as name, 'P&G Asset Owner', max(owned_by) as value , 1 as scope
from png_mds_viewdb.pg_mega_cmdb_ci_appl_final 
where owned_by is not null
union all 
select u_configuration_item as name, 'Service Operations Supplier SAP Code', max(u_vendor) as value , 1 as scope
from png_mds_viewdb.pg_mega_u_ci_responsible_vendor_final rp
where (u_role = 'Service Operations Supplier') and rp.cdctype <>'D' 
group by 1
union all 
select u_configuration_item as name, 'Software Supplier SAP Code', max(u_role) as value , 1 as scope
from png_mds_viewdb.pg_mega_u_ci_responsible_vendor_final rp
where (u_role = 'Software Supplier') and rp.cdctype <>'D' 
group by 1
union all 
select u_configuration_item as name, 'Technology Supplier SAP Code', max(u_role) as value , 1 as scope
from png_mds_viewdb.pg_mega_u_ci_responsible_vendor_final rp
where (u_role = 'Technology Supplier') and rp.cdctype <>'D' 
group by 1
union all 
select u_configuration_item as name, 'Implementation Supplier SAP Code', max(u_role) as value , 1 as scope
from png_mds_viewdb.pg_mega_u_ci_responsible_vendor_final rp
where (u_role = 'Implementation Supplier') and rp.cdctype <>'D' 
group by 1
UNION ALL
-- removed as part of DELV-16543
/* select app_hexid as name, 'Other Supplier SAP Code', max(org.CARDINAL) as value
from   png_mdsdb.pg_mega_pgv_app_responsible_org_person_final as rp
inner join  
(select distinct name,CARDINAL from  png_mdsdb.pg_mega_pgb_org_unit_final) as org
on rp.responsible_org_unit_hexid = org.name
where  (third_party_with_access <>'No' AND third_party_with_access is not null) and rp.cdctype <>'D' and 
app_hexid is not null and  responsible_org_unit_hexid is not null and org.CARDINAL <> '' AND org.CARDINAL IS NOT NULL
group by app_hexid
union all */
select b.sys_id as name,'In which country are you collecting PII?',max(SITE_HEX) as value , 1 as scope from png_mds_viewdb.pg_mega_pgv_application_site_pii_final a 
JOIN png_mds_viewdb.pg_mega_cmdb_ci_appl_final b 
on b.u_pg_source_system_id = a.app_hex and a.sourceinstance = b.sourceinstance 
where app_hex is not null and SITE_HEX is not null and SITE_HEX <> ''  and b.cdctype <>'D'
 group by 1
union all
select b.sys_id  as name,'Business Process / Service - P&G Hierarchy',max(bp_hex) as value , 1 as scope from png_mds_viewdb.pg_mega_snv_app_assoc_business_process_final
a 
JOIN png_mds_viewdb.pg_mega_cmdb_ci_appl_final b 
on b.u_pg_source_system_id = a.app_hex and a.sourceinstance = b.sourceinstance 
where app_hex is not null and bp_hex is not null and bp_hex <> ''  and a.cdctype <>'D'
 group by 1
union all
select b.sys_id as name,'Contractual Data: What are the LE(s) receiving the services',max(le_hexid) as value, 1 as scope from png_mds_viewdb.pg_mega_pgv_app_le_final a 
JOIN png_mds_viewdb.pg_mega_cmdb_ci_appl_final b 
on b.u_pg_source_system_id = a.app_hexid and a.sourceinstance = b.sourceinstance
where app_hexid is not null and le_hexid is not null and le_hexid<> '' and a.cdctype <>'D'
group by 1
UNION ALL 
SELECT app_hex,'Data Elements Combined flag',max(ATTRIBUTE_NAME) as value 
FROM (SELECT app_hex,replace(ATTRIBUTE_NAME,char('124'),'@') as ATTRIBUTE_NAME FROM png_mdsdb.pg_mega_pgv_application_data_model_final where cdctype='X') a11
WHERE 
a11.ATTRIBUTE_NAME ='Data about teens 16-18' OR a11.ATTRIBUTE_NAME like '%@Data about teens 16-18@%' OR a11.ATTRIBUTE_NAME like '%@Data about teens 16-18' OR a11.ATTRIBUTE_NAME like 'Data about teens 16-18@%'
OR a11.ATTRIBUTE_NAME ='Other (e.g. customer) account username and password' OR a11.ATTRIBUTE_NAME like '%@Other (e.g. customer) account username and password@%' OR a11.ATTRIBUTE_NAME like '%@Other (e.g. customer) account username and password' OR a11.ATTRIBUTE_NAME like 'Other (e.g. customer) account username and password@%'
OR a11.ATTRIBUTE_NAME ='Employee account username and password' OR a11.ATTRIBUTE_NAME like '%@Employee account username and password@%' OR a11.ATTRIBUTE_NAME like '%@Employee account username and password' OR a11.ATTRIBUTE_NAME like 'Employee account username and password@%'
OR a11.ATTRIBUTE_NAME ='Birthdate' OR a11.ATTRIBUTE_NAME like '%@Birthdate@%' OR a11.ATTRIBUTE_NAME like '%@Birthdate' OR a11.ATTRIBUTE_NAME like 'Birthdate@%'
OR a11.ATTRIBUTE_NAME ='Behavioral Data' OR a11.ATTRIBUTE_NAME like '%@Behavioral Data@%' OR a11.ATTRIBUTE_NAME like '%@Behavioral Data' OR a11.ATTRIBUTE_NAME like 'Behavioral Data@%'
OR a11.ATTRIBUTE_NAME ='Browser Cookie Data' OR a11.ATTRIBUTE_NAME like '%@Browser Cookie Data@%' OR a11.ATTRIBUTE_NAME like '%@Browser Cookie Data' OR a11.ATTRIBUTE_NAME like 'Browser Cookie Data@%'
OR a11.ATTRIBUTE_NAME ='Email address' OR a11.ATTRIBUTE_NAME like '%@Email address@%' OR a11.ATTRIBUTE_NAME like '%@Email address' OR a11.ATTRIBUTE_NAME like 'Email address@%'
OR a11.ATTRIBUTE_NAME ='Employee Band Level' OR a11.ATTRIBUTE_NAME like '%@Employee Band Level@%' OR a11.ATTRIBUTE_NAME like '%@Employee Band Level' OR a11.ATTRIBUTE_NAME like 'Employee Band Level@%'
OR a11.ATTRIBUTE_NAME ='Employee T#' OR a11.ATTRIBUTE_NAME like '%@Employee T#@%' OR a11.ATTRIBUTE_NAME like '%@Employee T#' OR a11.ATTRIBUTE_NAME like 'Employee T#@%'
OR a11.ATTRIBUTE_NAME ='Employee Work Location' OR a11.ATTRIBUTE_NAME like '%@Employee Work Location@%' OR a11.ATTRIBUTE_NAME like '%@Employee Work Location' OR a11.ATTRIBUTE_NAME like 'Employee Work Location@%'
OR a11.ATTRIBUTE_NAME ='Gender' OR a11.ATTRIBUTE_NAME like '%@Gender@%' OR a11.ATTRIBUTE_NAME like '%@Gender' OR a11.ATTRIBUTE_NAME like 'Gender@%'
OR a11.ATTRIBUTE_NAME ='Geographic data, Imprecise (not within 3.2187KM)' OR a11.ATTRIBUTE_NAME like '%@Geographic data, Imprecise (not within 3.2187KM)@%' OR a11.ATTRIBUTE_NAME like '%@Geographic data, Imprecise (not within 3.2187KM)' OR a11.ATTRIBUTE_NAME like 'Geographic data, Imprecise (not within 3.2187KM)@%'
OR a11.ATTRIBUTE_NAME ='Information which contans\"pseudonymized data\"' OR a11.ATTRIBUTE_NAME like '%@Information which contans\"pseudonymized data\"@%' OR a11.ATTRIBUTE_NAME like '%@Information which contans\"pseudonymized data\"' OR a11.ATTRIBUTE_NAME like 'Information which contans\"pseudonymized data\"@%'
OR a11.ATTRIBUTE_NAME ='IP Address' OR a11.ATTRIBUTE_NAME like '%@IP Address@%' OR a11.ATTRIBUTE_NAME like '%@IP Address' OR a11.ATTRIBUTE_NAME like 'IP Address@%'
OR a11.ATTRIBUTE_NAME ='Mac Address' OR a11.ATTRIBUTE_NAME like '%@Mac Address@%' OR a11.ATTRIBUTE_NAME like '%@Mac Address' OR a11.ATTRIBUTE_NAME like 'Mac Address@%'
OR a11.ATTRIBUTE_NAME ='Marital Status' OR a11.ATTRIBUTE_NAME like '%@Marital Status@%' OR a11.ATTRIBUTE_NAME like '%@Marital Status' OR a11.ATTRIBUTE_NAME like 'Marital Status@%'
OR a11.ATTRIBUTE_NAME ='Mobile device Ids' OR a11.ATTRIBUTE_NAME like '%@Mobile device Ids@%' OR a11.ATTRIBUTE_NAME like '%@Mobile device Ids' OR a11.ATTRIBUTE_NAME like 'Mobile device Ids@%'
OR a11.ATTRIBUTE_NAME ='Mobile Phone Number' OR a11.ATTRIBUTE_NAME like '%@Mobile Phone Number@%' OR a11.ATTRIBUTE_NAME like '%@Mobile Phone Number' OR a11.ATTRIBUTE_NAME like 'Mobile Phone Number@%'
OR a11.ATTRIBUTE_NAME ='Name' OR a11.ATTRIBUTE_NAME like '%@Name@%' OR a11.ATTRIBUTE_NAME like '%@Name' OR a11.ATTRIBUTE_NAME like 'Name@%'
OR a11.ATTRIBUTE_NAME ='Phone Numbers (not Mobile)' OR a11.ATTRIBUTE_NAME like '%@Phone Numbers (not Mobile)@%' OR a11.ATTRIBUTE_NAME like '%@Phone Numbers (not Mobile)' OR a11.ATTRIBUTE_NAME like 'Phone Numbers (not Mobile)@%'
OR a11.ATTRIBUTE_NAME ='Other demographic and behavioral data gathered online' OR a11.ATTRIBUTE_NAME like '%@Other demographic and behavioral data gathered online@%' OR a11.ATTRIBUTE_NAME like '%@Other demographic and behavioral data gathered online' OR a11.ATTRIBUTE_NAME like 'Other demographic and behavioral data gathered online@%'
OR a11.ATTRIBUTE_NAME ='Postal address' OR a11.ATTRIBUTE_NAME like '%@Postal address@%' OR a11.ATTRIBUTE_NAME like '%@Postal address' OR a11.ATTRIBUTE_NAME like 'Postal address@%'
OR a11.ATTRIBUTE_NAME ='Salary amount or level' OR a11.ATTRIBUTE_NAME like '%@Salary amount or level@%' OR a11.ATTRIBUTE_NAME like '%@Salary amount or level' OR a11.ATTRIBUTE_NAME like 'Salary amount or level@%'
OR a11.ATTRIBUTE_NAME ='Salary or benefits data' OR a11.ATTRIBUTE_NAME like '%@Salary or benefits data@%' OR a11.ATTRIBUTE_NAME like '%@Salary or benefits data' OR a11.ATTRIBUTE_NAME like 'Salary or benefits data@%'
OR a11.ATTRIBUTE_NAME ='Zip codes' OR a11.ATTRIBUTE_NAME like '%@Zip codes@%' OR a11.ATTRIBUTE_NAME like '%@Zip codes' OR a11.ATTRIBUTE_NAME like 'Zip codes@%'
OR a11.ATTRIBUTE_NAME ='Government ID, government-issued ID' OR a11.ATTRIBUTE_NAME like '%@Government ID, government-issued ID@%' OR a11.ATTRIBUTE_NAME like '%@Government ID, government-issued ID' OR a11.ATTRIBUTE_NAME like 'Government ID, government-issued ID@%'
OR a11.ATTRIBUTE_NAME ='Credit card numbers' OR a11.ATTRIBUTE_NAME like '%@Credit card numbers@%' OR a11.ATTRIBUTE_NAME like '%@Credit card numbers' OR a11.ATTRIBUTE_NAME like 'Credit card numbers@%'
OR a11.ATTRIBUTE_NAME ='Financial account number' OR a11.ATTRIBUTE_NAME like '%@Financial account number@%' OR a11.ATTRIBUTE_NAME like '%@Financial account number' OR a11.ATTRIBUTE_NAME like 'Financial account number@%'
OR a11.ATTRIBUTE_NAME ='Genetic data' OR a11.ATTRIBUTE_NAME like '%@Genetic data@%' OR a11.ATTRIBUTE_NAME like '%@Genetic data' OR a11.ATTRIBUTE_NAME like 'Genetic data@%'
OR a11.ATTRIBUTE_NAME ='Biometric data' OR a11.ATTRIBUTE_NAME like '%@Biometric data@%' OR a11.ATTRIBUTE_NAME like '%@Biometric data' OR a11.ATTRIBUTE_NAME like 'Biometric data@%'
OR a11.ATTRIBUTE_NAME ='Sex life, sexual orientation questions' OR a11.ATTRIBUTE_NAME like '%@Sex life, sexual orientation questions@%' OR a11.ATTRIBUTE_NAME like '%@Sex life, sexual orientation questions' OR a11.ATTRIBUTE_NAME like 'Sex life, sexual orientation questions@%'
OR a11.ATTRIBUTE_NAME ='Data about children under 13' OR a11.ATTRIBUTE_NAME like '%@Data about children under 13@%' OR a11.ATTRIBUTE_NAME like '%@Data about children under 13' OR a11.ATTRIBUTE_NAME like 'Data about children under 13@%'
OR a11.ATTRIBUTE_NAME ='Criminal or judicial records' OR a11.ATTRIBUTE_NAME like '%@Criminal or judicial records@%' OR a11.ATTRIBUTE_NAME like '%@Criminal or judicial records' OR a11.ATTRIBUTE_NAME like 'Criminal or judicial records@%'
OR a11.ATTRIBUTE_NAME ='Precise geo location data' OR a11.ATTRIBUTE_NAME like '%@Precise geo location data@%' OR a11.ATTRIBUTE_NAME like '%@Precise geo location data' OR a11.ATTRIBUTE_NAME like 'Precise geo location data@%'
OR a11.ATTRIBUTE_NAME ='Racial or ethnic origin' OR a11.ATTRIBUTE_NAME like '%@Racial or ethnic origin@%' OR a11.ATTRIBUTE_NAME like '%@Racial or ethnic origin' OR a11.ATTRIBUTE_NAME like 'Racial or ethnic origin@%'
OR a11.ATTRIBUTE_NAME ='Political opinions, political party affiliation' OR a11.ATTRIBUTE_NAME like '%@Political opinions, political party affiliation@%' OR a11.ATTRIBUTE_NAME like '%@Political opinions, political party affiliation' OR a11.ATTRIBUTE_NAME like 'Political opinions, political party affiliation@%'
OR a11.ATTRIBUTE_NAME ='Trade union membership' OR a11.ATTRIBUTE_NAME like '%@Trade union membership@%' OR a11.ATTRIBUTE_NAME like '%@Trade union membership' OR a11.ATTRIBUTE_NAME like 'Trade union membership@%'
OR a11.ATTRIBUTE_NAME ='Protected Health Information (\“PHI\”) as defined by HIPAA' OR a11.ATTRIBUTE_NAME like '%@Protected Health Information (\“PHI\”) as defined by HIPAA@%' OR a11.ATTRIBUTE_NAME like '%@Protected Health Information (\“PHI\”) as defined by HIPAA' OR a11.ATTRIBUTE_NAME like 'Protected Health Information (\“PHI\”) as defined by HIPAA@%'
OR a11.ATTRIBUTE_NAME ='Other health or medical data' OR a11.ATTRIBUTE_NAME like '%@Other health or medical data@%' OR a11.ATTRIBUTE_NAME like '%@Other health or medical data' OR a11.ATTRIBUTE_NAME like 'Other health or medical data@%'
OR a11.ATTRIBUTE_NAME ='Digital signature data' OR a11.ATTRIBUTE_NAME like '%@Digital signature data@%' OR a11.ATTRIBUTE_NAME like '%@Digital signature data' OR a11.ATTRIBUTE_NAME like 'Digital signature data@%'
OR a11.ATTRIBUTE_NAME ='Data about teens between 13-15 years old' OR a11.ATTRIBUTE_NAME like '%@Data about teens between 13-15 years old@%' OR a11.ATTRIBUTE_NAME like '%@Data about teens between 13-15 years old' OR a11.ATTRIBUTE_NAME like 'Data about teens between 13-15 years old@%'
OR a11.ATTRIBUTE_NAME ='Consumer account username and password' OR a11.ATTRIBUTE_NAME like '%@Consumer account username and password@%' OR a11.ATTRIBUTE_NAME like '%@Consumer account username and password' OR a11.ATTRIBUTE_NAME like 'Consumer account username and password@%'
OR a11.ATTRIBUTE_NAME ='Adverse event information' OR a11.ATTRIBUTE_NAME like '%@Adverse event information@%' OR a11.ATTRIBUTE_NAME like '%@Adverse event information' OR a11.ATTRIBUTE_NAME like 'Adverse event information@%'
OR a11.ATTRIBUTE_NAME ='Identification Data' OR a11.ATTRIBUTE_NAME like '%@Identification Data@%' OR a11.ATTRIBUTE_NAME like '%@Identification Data' OR a11.ATTRIBUTE_NAME like 'Identification Data@%'
OR a11.ATTRIBUTE_NAME ='Electronic identification data' OR a11.ATTRIBUTE_NAME like '%@Electronic identification data@%' OR a11.ATTRIBUTE_NAME like '%@Electronic identification data' OR a11.ATTRIBUTE_NAME like 'Electronic identification data@%'
OR a11.ATTRIBUTE_NAME ='Personal characteristics' OR a11.ATTRIBUTE_NAME like '%@Personal characteristics@%' OR a11.ATTRIBUTE_NAME like '%@Personal characteristics' OR a11.ATTRIBUTE_NAME like 'Personal characteristics@%'
OR a11.ATTRIBUTE_NAME ='Family composition' OR a11.ATTRIBUTE_NAME like '%@Family composition@%' OR a11.ATTRIBUTE_NAME like '%@Family composition' OR a11.ATTRIBUTE_NAME like 'Family composition@%'
OR a11.ATTRIBUTE_NAME ='Profession' OR a11.ATTRIBUTE_NAME like '%@Profession@%' OR a11.ATTRIBUTE_NAME like '%@Profession' OR a11.ATTRIBUTE_NAME like 'Profession@%'
OR a11.ATTRIBUTE_NAME ='Image/sound recordings' OR a11.ATTRIBUTE_NAME like '%@Image/sound recordings@%' OR a11.ATTRIBUTE_NAME like '%@Image/sound recordings' OR a11.ATTRIBUTE_NAME like 'Image/sound recordings@%'
GROUP BY 1
)Y
ON Y.name=A.name
where A.cdctype<>'D'
) as t group by 1
)SRC
LEFT JOIN png_mdwdb.f_rita_application_c TRGT ON (SRC.NAME =TRGT.row_id)
WHERE SRC.total_complete<>TRGT.total_complete
) temp;
