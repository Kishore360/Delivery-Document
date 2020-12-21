SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.data_subject_type_c_key'
 ELSE 'SUCCESS data_subject_type_c_key' END as Message 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final  src
LEFT JOIN  pgrita_mdwdb.d_png_ot_ccpa_numerita_c trgt
on src.id = trgt.row_id and src.sourceinstance = trgt.source_id
JOIN pgrita_mdwdb.d_lov lkp
ON COALESCE(CONCAT('OT_CCPA_DATA_SUBJECT_TYPE_PG_C~PROCESSING_ACTIVITIES~',src.Data_Subject_Type),'UNSPECIFIED') =lkp.row_id
where COALESCE(lkp.row_key,CASE WHEN src.Data_Subject_Type IS NULL THEN 0 else -1 end)<> trgt.data_subject_type_c_key;

SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.data stake holders' 
ELSE 'SUCCESS data stake holders' END as Message from (
select  count(1) from
  png_mdsdb.pg_ot_ccpa_pa_inventory_c_final  src
LEFT JOIN  pgrita_mdwdb.d_png_ot_ccpa_numerita_c trgt
on src.id = trgt.row_id and src.sourceinstance = trgt.source_id
JOIN pgrita_mdwdb.d_lov lkp
ON COALESCE(CONCAT('OT_CCPA_DATA_STAKEHOLDERS~PROCESSING_ACTIVITIES~',
src.num_of_Data_Stakeholders_from_US),'UNSPECIFIED') = lkp.row_id
where COALESCE(lkp.row_key,CASE WHEN src.num_of_Data_Stakeholders_from_US IS NULL THEN 0 else -1 end)<> trgt.ot_ccpa_data_stakeholders_c_key
)temp;


SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.life_cycle_status_c_key' ELSE 'SUCCESS Life_Cycle_Status' END as Message 
FROM  png_mdsdb.pg_ot_ccpa_pa_inventory_c_final  src
LEFT JOIN  pgrita_mdwdb.d_png_ot_ccpa_numerita_c trgt
on src.id = trgt.row_id and src.sourceinstance = trgt.source_id
JOIN pgrita_mdwdb.d_lov lkp
ON COALESCE(CONCAT('OT_CCPA_LIFE_CYCLE_STATUS_C~PROCESSING_ACTIVITIES~',src.Life_Cycle_Status),'UNSPECIFIED') =lkp.row_id
where COALESCE(lkp.row_key,CASE WHEN src.Life_Cycle_Status IS NULL THEN 0 else -1 end)<> trgt.ot_ccpa_life_cycle_status_c_key;



SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.sub_rgt_stats_c_key' 
ELSE 'SUCCESS subj_rights_status_c_key' END as Message 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final  src
LEFT JOIN  pgrita_mdwdb.d_png_ot_ccpa_numerita_c trgt
on src.id = trgt.row_id and src.sourceinstance = trgt.source_id
JOIN pgrita_mdwdb.d_lov lkp
ON COALESCE(CONCAT('OT_CCPA_CONTROL_STATUS_C~PROCESSING_ACTIVITIES~',src.Data_Subject_Rights_Status),'UNSPECIFIED') =lkp.row_id
where COALESCE(lkp.row_key,CASE WHEN src.Data_Subject_Rights_Status IS NULL THEN 0 else -1 end)<> trgt.subj_rights_status_c_key;
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_png_ot_ccpa_numerita_c.Owning_Organization' 
ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final SRC
LEFT JOIN  png_mdwdb.f_png_ot_ccpa_numerita_c TRGT ON SRC.id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
JOIN png_mdwdb.d_internal_organization LKP ON 
COALESCE(CONCAT('OT_CCPA_ORGANIZATION~',sha1(lower(COALESCE(SRC.Owning_Organization,'UNSPECIFIED')))),'UNSPECIFIED'
)=LKP.row_id 
AND SRC.sourceinstance=LKP.source_id
WHERE LKP.owning_org_c_key
<>TRGT.ccpa_owning_organization_c_key
AND SRC.cdctype='X'
) temp;


SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS ' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_internal_organization.owning organization' 
ELSE 'SUCCESS d_internal_organization.owning organization' END as Message
FROM 
(
Select Count(1) as CNT
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final SRC 
JOIN pgrita_mdwdb.f_png_ot_ccpa_numerita_c TRGT ON (SRC.ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN pgrita_mdwdb.d_internal_organization LKP1 ON 
 ((COALESCE(CONCAT('OT_CCPA_ORGANIZATION~',sha1(lower(COALESCE(SRC.Owning_Organization,'UNSPECIFIED')))),'UNSPECIFIED') = LKP1.row_id)) and 
(-- TRGT.ccpa_owning_organization_c_key=LKP1.row_key AND 
SRC.sourceinstance=LKP1.source_id)
-- JOIN pgrita_mdwdb.d_internal_contact LKP ON CONCAT('INTERNAL_CONTACT~',SRC.sys_id)=LKP.row_id AND SRC.sourceinstance=LKP.source_id
where TRGT.ccpa_owning_organization_c_key=LKP1.row_key
 ) temp;

-- ccpa_age_class_c_key

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS ' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for ccpa key' 
ELSE 'SUCCESS source to target ccpakey' END as Message
FROM 
(
Select Count(1) as CNT
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final SRC 
JOIN pgrita_mdwdb.f_png_ot_ccpa_numerita_c TRGT ON (SRC.ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN pgrita_mdwdb.d_png_ot_ccpa_numerita_c pngd on(pngd.row_id = TRGT.row_id and pngd.source_id = TRGT.source_id)
where pngd.row_id <> TRGT.row_id
 ) temp;



SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS ' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_internal_organization.sap vendor key' 
ELSE 'SUCCESS d_internal_organization.sap vendor key' END as Message
FROM 
(
Select Count(1) as CNT
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final SRC 
JOIN pgrita_mdwdb.f_png_ot_ccpa_numerita_c TRGT ON (SRC.ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN pgrita_mdwdb.d_internal_organization LKP1 ON (TRGT.ccpa_sap_vendor_c_key=LKP1.row_key AND SRC.sourceinstance=LKP1.source_id)
where TRGT.ccpa_sap_vendor_c_key<>LKP1.row_key
 ) temp;


 -- ccpa_age_class_c_key

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS ' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for ccpa_age_class_c_key' 
ELSE 'SUCCESS  ccpa_age_class_c_key' END as Message
FROM 
(
Select Count(1) as CNT
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final SRC join
pgrita_mdwdb.d_png_ot_ccpa_numerita_c a11 on a11.row_id=SRC.ID
JOIN pgrita_workdb.d_o_data_freshness a12 ON a11.source_id = a12.source_id -- AND a12.etl_run_number = 0
LEFT JOIN pgrita_mdwdb.d_lov lv_age ON lv_age.dimension_class='WH_OT_CCPA_AGE_CLASS_C~PROCESSING_ACTIVITIES'
 AND timestampdiff(DAY,a11.created_on,convert_tz(a12.lastupdated,'GMT','America/New_York')) 
 BETWEEN lv_age.lower_range_value and lv_age.upper_range_value

WHERE a11.ccpa_age_class_c_key IS NULL OR a11.ccpa_age_class_c_key <> lv_age.row_key
 ) temp;

 
 SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for ccpa.country_collected' ELSE 'SUCCESS' END as Message 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final  src
LEFT JOIN  pgrita_mdwdb.d_png_ot_ccpa_numerita_c trgt
on src.id = trgt.row_id and src.sourceinstance = trgt.source_id
where case when src.Country_Collected IS NULL or src.Country_Collected = ''
      then 'UNSPECIFIED'  else src.Country_Collected end <> trgt.country_collected;
	  
	  
	  SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.inventory_stats_c_key' 
ELSE 'SUCCESS d_png_ot_ccpa_numerita_c.inventory_stats_c_key' END as Message 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final  src
LEFT JOIN  pgrita_mdwdb.d_png_ot_ccpa_numerita_c trgt
on src.id = trgt.row_id and src.sourceinstance = trgt.source_id
JOIN pgrita_mdwdb.d_lov lkp
ON COALESCE(CONCAT('OT_CCPA_CONTROL_STATUS_C~PROCESSING_ACTIVITIES~',src.Inventory_Status),'UNSPECIFIED') =lkp.row_id
where COALESCE(lkp.row_key,CASE WHEN src.Inventory_Status IS NULL THEN 0 else -1 end)<> trgt.ccpa_inventory_status_c_key;


SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.law_basis_stats_c_key' ELSE 'SUCCESS law_basis_stats_c_key' END as Message 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final  src
LEFT JOIN  pgrita_mdwdb.d_png_ot_ccpa_numerita_c trgt
on src.id = trgt.row_id and src.sourceinstance = trgt.source_id
JOIN pgrita_mdwdb.d_lov lkp
ON COALESCE(CONCAT('OT_CCPA_CONTROL_STATUS_C~PROCESSING_ACTIVITIES~',src.Lawfulness_Basis_Status),'UNSPECIFIED') =lkp.row_id
where COALESCE(lkp.row_key,CASE WHEN src.Lawfulness_Basis_Status IS NULL THEN 0 else -1 end)<> trgt.ccpa_lawful_basis_status_c_key;

SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.mini_stats_c_key' 
ELSE 'SUCCESS mini_stats_c_key' END as Message 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final  src
LEFT JOIN  pgrita_mdwdb.d_png_ot_ccpa_numerita_c trgt
on src.id = trgt.row_id and src.sourceinstance = trgt.source_id
JOIN png_mdwdb.d_lov lkp
ON COALESCE(CONCAT('OT_CCPA_CONTROL_STATUS_C~PROCESSING_ACTIVITIES~',src.Minimization_Status),'UNSPECIFIED') =lkp.row_id
where COALESCE(lkp.row_key,CASE WHEN src.Minimization_Status IS NULL THEN 0 else -1 end)<> trgt.ccpa_mini_status_c_key;

SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.notice_stats_c_key'
 ELSE 'SUCCESS notice_stats_c_key' END as Message 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final  src
LEFT JOIN  pgrita_mdwdb.d_png_ot_ccpa_numerita_c trgt
on src.id = trgt.row_id and src.sourceinstance = trgt.source_id
JOIN png_mdwdb.d_lov lkp
ON COALESCE(CONCAT('OT_CCPA_CONTROL_STATUS_C~PROCESSING_ACTIVITIES~',src.Notice_Status),'UNSPECIFIED') =lkp.row_id
where COALESCE(lkp.row_key,CASE WHEN src.Notice_Status IS NULL THEN 0 else -1 end)<> trgt.ccpa_notice_status_c_key;

SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.repository_sub_type_c_key' ELSE 'SUCCESS repository_sub_type_c_key' END as Message 
FROM  png_mdsdb.pg_ot_ccpa_pa_inventory_c_final  src
LEFT JOIN  pgrita_mdwdb.d_png_ot_ccpa_numerita_c trgt
on src.id = trgt.row_id and src.sourceinstance = trgt.source_id
JOIN png_mdwdb.d_lov lkp
ON COALESCE(CONCAT('OT_CCPA_REPOSITORY_SUB_TYPE_C~PROCESSING_ACTIVITIES',src.Subtype),'UNSPECIFIED') =lkp.row_id
where COALESCE(lkp.row_key,CASE WHEN src.Subtype IS NULL THEN 0 else -1 end)<> trgt.ccpa_subtype_c_key;

SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.repository_type_c_key' 
ELSE 'SUCCESS repository_type_c_key' END as Message 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final  src
LEFT JOIN  pgrita_mdwdb.d_png_ot_ccpa_numerita_c trgt
on src.id = trgt.row_id and src.sourceinstance = trgt.source_id
JOIN png_mdwdb.d_lov lkp
ON COALESCE(CONCAT('OT_CCPA_REPOSITORY_TYPE_C~PROCESSING_ACTIVITIES~',src.Repository_Type),'UNSPECIFIED') =lkp.row_id
where COALESCE(lkp.row_key,CASE WHEN src.Repository_Type IS NULL THEN 0 else -1 end)<> trgt.ccpa_repository_type_c_key;

SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for pg_ot_ccpa_pa_inventory_c_final.scope_number_c_key' 
ELSE 'SUCCESS' END as Message 
FROM   png_mdsdb.pg_ot_ccpa_pa_inventory_c_final  src
LEFT JOIN  pgrita_mdwdb.d_png_ot_ccpa_numerita_c trgt
on src.id = trgt.row_id and src.sourceinstance = trgt.source_id
JOIN pgrita_mdwdb.d_lov lkp
ON COALESCE(CONCAT('OT_CCPA_SCOPE_NUMBER_C~PROCESSING_ACTIVITIES~',src.SCOPE_Number),'UNSPECIFIED') =lkp.row_id
where COALESCE(lkp.row_key,CASE WHEN src.SCOPE_Number IS NULL THEN 0 else -1 end)<> trgt.ccpa_scope_number_c_key;


SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for pg_ot_ccpa_pa_inventory_c_final.vendor_qualification_c_key' 
ELSE 'SUCCESS' END as Message  from(
select count(1) 
FROM  png_mdsdb.pg_ot_ccpa_pa_inventory_c_final  src
LEFT JOIN  pgrita_mdwdb.d_png_ot_ccpa_numerita_c trgt
on src.id = trgt.row_id and src.sourceinstance = trgt.source_id
JOIN png_mdwdb.d_lov lkp
ON COALESCE(CONCAT('OT_CCPA_VENDOR_QUALIFICATION_C~PROCESSING_ACTIVITIES~',src.Vendor_qualification),'UNSPECIFIED') =lkp.row_id
where COALESCE(lkp.row_key,CASE WHEN src.Vendor_qualification IS NULL THEN 0 else -1 end)<> trgt.ccpa_vendor_qualification_c_key) temp;


SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.vendors_stats_c_key' ELSE 'SUCCESS' END as Message 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final  src
LEFT JOIN pgrita_mdwdb.d_png_ot_ccpa_numerita_c trgt
on src.id = trgt.row_id and src.sourceinstance = trgt.source_id
JOIN  pgrita_mdwdb.d_lov lkp
ON COALESCE(CONCAT('OT_CCPA_CONTROL_STATUS_C~PROCESSING_ACTIVITIES~',src.Vendors_Status),'UNSPECIFIED') =lkp.row_id
where COALESCE(lkp.row_key,CASE WHEN src.Vendors_Status IS NULL THEN 0 else -1 end)<> trgt.ccpa_vendor_status_c_key;


SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for pg_ot_ccpa_pa_inventory_c_final.ret_stats_c_key' ELSE 'SUCCESS' END as Message 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final  src
LEFT JOIN  pgrita_mdwdb.d_png_ot_ccpa_numerita_c trgt
on src.id = trgt.row_id and src.sourceinstance = trgt.source_id
JOIN png_mdwdb.d_lov lkp
ON COALESCE(CONCAT('OT_CCPA_CONTROL_STATUS_C~PROCESSING_ACTIVITIES~',src.Data_retention_Status),'UNSPECIFIED') =lkp.row_id
where COALESCE(lkp.row_key,CASE WHEN src.Data_retention_Status IS NULL THEN 0 else -1 end)<> trgt.data_retentions_status_c_key;












