-- DELV_15839_f_rita_application_c.perc_completeness_MYSQL.SQL 

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_rita_application_c.percent_complete' ELSE 'SUCCESS' END as Message
FROM 
(

SELECT Count(1) as CNT 
FROM 

(
select name,count(1) as total_complete,
100*((count(1))/17) as perc_completeness,
100.00 - 100*((count(1))/17) as perc_in_completeness,
17- (count(1)) as total_incomplete
from(SELECT Y.name, field, value from png_mdsdb.pg_mega_pgb_application_rita_final A
JOIN (
select name,'PG_APPLICATION_DESCRIPTION' as field, PG_APPLICATION_DESCRIPTION  as value
from  png_mdsdb.pg_mega_pgb_application_rita_final
where PG_APPLICATION_DESCRIPTION is not null and PG_APPLICATION_DESCRIPTION <> ''
union all
select name,'LEGITIMATE_INTEREST' as field, LEGITIMATE_INTEREST as value
from png_mdsdb.pg_mega_pgb_application_rita_final
where LEGITIMATE_INTEREST is not null and LEGITIMATE_INTEREST <> ''
union all
select name,'RETENTION_SPAN_YEARS' as field, RETENTION_SPAN_YEARS as value
from png_mdsdb.pg_mega_pgb_application_rita_final
where RETENTION_SPAN_YEARS is not null and RETENTION_SPAN_YEARS <> ''
union all
select name,'VOLUME_OF_RECORDS_EU' as field, VOLUME_OF_RECORDS_EU as value
from png_mdsdb.pg_mega_pgb_application_rita_final
where VOLUME_OF_RECORDS_EU is not null and VOLUME_OF_RECORDS_EU <> ''
union all
select name,'VOLUME_OF_RECORDS_ALL' as field, VOLUME_OF_RECORDS_ALL as value
from png_mdsdb.pg_mega_pgb_application_rita_final
where VOLUME_OF_RECORDS_ALL is not null and VOLUME_OF_RECORDS_ALL <> ''
union all
select name,'AUTOMATED_DECISION_MAKING' as field, AUTOMATED_DECISION_MAKING as value
from png_mdsdb.pg_mega_pgb_application_rita_final
where AUTOMATED_DECISION_MAKING is not null and AUTOMATED_DECISION_MAKING <> ''
-- References
union all
select app_hexid as name, 'Owning Organization', max(responsible_org_unit_hexid) as value
from png_mdsdb.pg_mega_pgv_app_responsible_org_person_final 
where (pg_development_org <>'N' AND pg_development_org is not null ) and cdctype <>'D' and app_hexid is not null and  responsible_org_unit_hexid is not null and responsible_org_unit_hexid <>''
group by app_hexid 
union all
select app_hexid as name, 'P&G Asset Owner', max(person_intranet_id) as value
from png_mdsdb.pg_mega_pgv_app_responsible_org_person_final 
where (application_manager <> 'N' AND application_manager is not null ) and cdctype <>'D' and  app_hexid is not null and person_intranet_id is not null and person_intranet_id is not null
group by app_hexid
union all 
select app_hexid as name, 'Service Operations Supplier SAP Code', max(org.CARDINAL) as value
from png_mdsdb.pg_mega_pgv_app_responsible_org_person_final as rp
inner join  (select distinct name,CARDINAL from png_mdsdb.pg_mega_pgb_org_unit_final) as org
on rp.responsible_org_unit_hexid = org.name
where (pg_service_manager_supplier <>'N' AND  pg_service_manager_supplier is not null) and rp.cdctype <>'D' and app_hexid is not null and  responsible_org_unit_hexid is not null and org.CARDINAL <> '' AND org.CARDINAL IS NOT NULL
group by app_hexid
union all 
select app_hexid as name, 'Software Supplier SAP Codee', max(org.CARDINAL) as value
from png_mdsdb.pg_mega_pgv_app_responsible_org_person_final as rp
inner join  (select distinct name,CARDINAL from png_mdsdb.pg_mega_pgb_org_unit_final) as org
on rp.responsible_org_unit_hexid = org.name
where  (pg_software_supplier <>'N' AND pg_software_supplier is not null) and rp.cdctype <>'D' and 
 app_hexid is not null and  responsible_org_unit_hexid is not null and org.CARDINAL <> ''  AND org.CARDINAL IS NOT NULL
group by app_hexid
union all 
select app_hexid as name, 'Technology Supplier SAP Code', max(org.CARDINAL) as value
from png_mdsdb.pg_mega_pgv_app_responsible_org_person_final as rp
inner join  (select distinct name,CARDINAL from png_mdsdb.pg_mega_pgb_org_unit_final) as org
on rp.responsible_org_unit_hexid = org.name
where (supplier <>'N' AND supplier  is not null) and rp.cdctype <>'D' and  app_hexid is not null and  responsible_org_unit_hexid is not null and org.CARDINAL <> ''   AND org.CARDINAL IS NOT NULL
group by app_hexid
union all 
select app_hexid as name, 'Implementation Supplier SAP Code', max(org.CARDINAL) as value
from png_mdsdb.pg_mega_pgv_app_responsible_org_person_final as rp
inner join  (select distinct name,CARDINAL from png_mdsdb.pg_mega_pgb_org_unit_final) as org
on rp.responsible_org_unit_hexid = org.name
where (pg_implementation_supplier <>'N' AND pg_implementation_supplier is not null) and rp.cdctype <>'D' and  app_hexid is not null and  responsible_org_unit_hexid is not null and org.CARDINAL <> ''   AND org.CARDINAL IS NOT NULL
group by app_hexid
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
select app_hexid as name,'Data Category', max(DATA_CAT_HEXID) as value from png_mdsdb.pg_mega_pgv_app_data_cat_final 
where app_hexid is not null and DATA_CAT_HEXID is not null and DATA_CAT_HEXID <> '' and cdctype <> 'D'
group by app_hexid
union all
select app_hex as name,'In which country are you collecting PII?',max(SITE_HEX) as value from png_mdsdb.pg_mega_pgv_application_site_pii_final 
where app_hex is not null and SITE_HEX is not null and SITE_HEX <> ''  and cdctype <>'D'
 group by app_hex
union all
select app_hex as name,'Business Process / Service - P&G Hierarchy',max(bp_hex) as value from png_mdsdb.pg_mega_snv_app_assoc_business_process_final 
where app_hex is not null and bp_hex is not null and bp_hex <> ''  and cdctype <>'D'
 group by app_hex
union all
select app_hexid as name,'Contractual Data: What are the LE(s) receiving the services',max(le_hexid) as value from png_mdsdb.pg_mega_pgv_app_le_final 
where app_hexid is not null and le_hexid is not null and le_hexid<> '' and cdctype <>'D'
group by app_hexid
UNION ALL 
SELECT app_hex,'Data Elements Combined flag',max(ATTRIBUTE_NAME) as value 
FROM (SELECT app_hex,replace(ATTRIBUTE_NAME,char('124'),'@') as ATTRIBUTE_NAME FROM png_mdsdb.pg_mega_pgv_application_data_model_final) a11
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
WHERE SRC.perc_completeness<>TRGT.percent_complete
) temp;
