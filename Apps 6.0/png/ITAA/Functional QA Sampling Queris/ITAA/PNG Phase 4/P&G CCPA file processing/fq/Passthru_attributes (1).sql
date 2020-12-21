SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS d_png_ot_ccpa_numerita_c.adm_flag' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.adm_flag' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final SRC 
LEFT JOIN pgrita_mdwdb.d_png_ot_ccpa_numerita_c TRGT ON SRC.ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE IF(COALESCE(SRC.adm,'UNSPECIFIED')='TRUE','Y','N')<>TRGT.adm_c_flag
AND SRC.cdctype='X'
)temp
union all
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESSd_png_ot_ccpa_numerita_c.breach_resp_criteria' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.breach_resp_criteria' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final SRC 
LEFT JOIN pgrita_mdwdb.d_png_ot_ccpa_numerita_c TRGT ON SRC.ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE IF(SRC.Data_breach_response_Criteria IS NOT NULL  AND SRC.Data_breach_response_Criteria <>'',SRC.Data_breach_response_Criteria,'UNSPECIFIED')<>TRGT.data_breach_resp_criteria_c
AND SRC.cdctype='X'
)temp
UNION ALL
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS Legal entity' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.legal entity' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM  png_mdsdb.pg_ot_ccpa_pa_inventory_c_final SRC 
LEFT JOIN pgrita_mdwdb.d_png_ot_ccpa_numerita_c TRGT ON SRC.ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE IF(SRC.Legal_Entity IS NOT NULL  AND SRC.Legal_Entity <>'',SRC.Legal_Entity,'UNSPECIFIED')<>
TRGT.legal_entity_c
AND SRC.cdctype='X'
)temp
/*UNION ALL
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS data_subject_type' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.data_subject_type_pg_other' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final SRC 
LEFT JOIN pgrita_mdwdb.d_png_ot_ccpa_numerita_c TRGT ON SRC.ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.Data_subject_type,'UNSPECIFIED')<>TRGT.data
AND SRC.cdctype='X'
)temp*/
UNION ALL
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS inventory_criteria' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.inventory_criteria' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final SRC 
LEFT JOIN pgrita_mdwdb.d_png_ot_ccpa_numerita_c TRGT ON SRC.ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE IF(SRC.Inventory_Criteria IS NOT NULL  AND SRC.Inventory_Criteria <>'',SRC.Inventory_Criteria,'UNSPECIFIED')
<>TRGT.inventory_criteria_c
AND SRC.cdctype='X'
)temp
UNION ALL
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS infosec_criteria' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.infosec_criteria' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM   png_mdsdb.pg_ot_ccpa_pa_inventory_c_final SRC 
LEFT JOIN pgrita_mdwdb.d_png_ot_ccpa_numerita_c TRGT ON SRC.ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE IF(SRC.Reasonable_InfoSec_Criteria IS NOT NULL AND SRC.Reasonable_InfoSec_Criteria <>'', SRC.Reasonable_InfoSec_Criteria,'UNSPECIFIED') 
<>TRGT.infosec_criteria_c
AND SRC.cdctype='X'
)temp
UNION ALL
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS infosec_evidence_c' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.it_sec_ctrl_evidence' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final SRC 
LEFT JOIN pgrita_mdwdb.d_png_ot_ccpa_numerita_c TRGT ON SRC.ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE IF(SRC.Reasonable_InfoSec_Evidence IS NOT NULL  AND SRC.Reasonable_InfoSec_Evidence <>'',SRC.Reasonable_InfoSec_Evidence,'UNSPECIFIED')
<>TRGT.infosec_evidence_c
AND SRC.cdctype='X'
)temp
UNION ALL
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS last_reviewed_on_c' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.last_reviewed_on_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final SRC 
LEFT JOIN pgrita_mdwdb.d_png_ot_ccpa_numerita_c TRGT ON SRC.ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.Last_review_date, 'UNSPECIFIED') 
<>TRGT.last_reviewed_date_c
AND SRC.cdctype='X'
)temp
UNION ALL
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS last_reviewed_reviewer' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.last_reviewed_reviewer' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final SRC 
LEFT JOIN pgrita_mdwdb.d_png_ot_ccpa_numerita_c TRGT ON SRC.ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE IF(SRC.Last_reviewed_reviewer IS NULL  OR SRC.Last_reviewed_reviewer  = '','UNSPECIFIED', SRC.Last_reviewed_reviewer) 
<>TRGT.last_reviewed_reviewer_c
AND SRC.cdctype='X'
)temp
UNION ALL
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS Lawfulness_Basis_Criteria' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.law_basis_criteria' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final SRC 
LEFT JOIN pgrita_mdwdb.d_png_ot_ccpa_numerita_c TRGT ON SRC.ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE IF(SRC.Lawfulness_Basis_Criteria IS NOT NULL AND SRC.Lawfulness_Basis_Criteria <>'',SRC.Lawfulness_Basis_Criteria, 'UNSPECIFIED')
<>TRGT.lawfulness_basis_criteria_c
AND SRC.cdctype='X'
)temp
UNION ALL
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS law_basis_evidence' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.law_basis_evidence' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final SRC 
LEFT JOIN pgrita_mdwdb.d_png_ot_ccpa_numerita_c TRGT ON SRC.ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE IF(SRC.Lawfulness_Basis_Evidence IS NOT NULL AND SRC.Lawfulness_Basis_Evidence <>'',SRC.Lawfulness_Basis_Evidence,'UNSPECIFIED') 
<>TRGT.lawfulness_basis_evidence_c
AND SRC.cdctype='X'
)temp
UNION ALL
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS mini_criteria' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.mini_criteria' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final SRC 
LEFT JOIN pgrita_mdwdb.d_png_ot_ccpa_numerita_c TRGT ON SRC.ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE  IF(SRC.Minimization_Criteria IS NOT NULL AND SRC.Minimization_Criteria <>'',SRC.Minimization_Criteria, 'UNSPECIFIED') <>TRGT.mini_criteria_c
AND SRC.cdctype='X'
)temp
UNION ALL
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS mini_evidence' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.mini_evidence' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final SRC 
LEFT JOIN pgrita_mdwdb.d_png_ot_ccpa_numerita_c TRGT ON SRC.ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE  IF(SRC.Minimization_Evidence IS NOT NULL AND SRC.Minimization_Evidence <>'', SRC.Minimization_Evidence,'UNSPECIFIED')  <>TRGT.mini_evidence_c
AND SRC.cdctype='X'
)temp
UNION ALL
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS mini_criteria' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.mini_criteria' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final SRC 
LEFT JOIN pgrita_mdwdb.d_png_ot_ccpa_numerita_c TRGT ON SRC.ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE  IF(SRC.Minimization_Criteria IS NOT NULL AND SRC.Minimization_Criteria <>'',SRC.Minimization_Criteria, 'UNSPECIFIED') <>TRGT.mini_criteria_c
AND SRC.cdctype='X'
)temp
UNION ALL
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS notice_criteria' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.notice_criteria' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final SRC 
LEFT JOIN pgrita_mdwdb.d_png_ot_ccpa_numerita_c TRGT ON SRC.ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE  IF(SRC.Notice_Criteria IS NOT NULL AND SRC.Notice_Criteria <>'',SRC.Notice_Criteria,'UNSPECIFIED')<>TRGT.notice_criteria_c
AND SRC.cdctype='X'
)temp
UNION ALL
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS notice_evidence' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.notice_evidence' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final SRC 
LEFT JOIN pgrita_mdwdb.d_png_ot_ccpa_numerita_c TRGT ON SRC.ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE  IF(SRC.Notice_Evidence IS NOT NULL AND SRC.Notice_Evidence <>'',SRC.Notice_Evidence,'UNSPECIFIED') 
<>TRGT.notice_evidence_c
AND SRC.cdctype='X'
)temp
UNION ALL
SELECT
CASE WHEN CNT  THEN 'FAILURE' ELSE 'SUCCESS age_class' END as Result, 
CASE WHEN CNT  THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.ot_age_class_c_key' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) as CNT
FROM  pgrita_mdwdb.d_png_ot_ccpa_numerita_c a11
JOIN (Select x.source_id,max(x.lastupdated) as Lastupdated 
FROM pgrita_mdwdb.d_o_data_freshness x  group by source_id)  a12 ON a11.source_id = a12.source_id 
LEFT JOIN pgrita_mdwdb.d_lov lv_age ON lv_age.dimension_class = 'WH_OT_CCPA_AGE_CLASS_C~PROCESSING_ACTIVITIES'
AND timestampdiff(DAY,a11.created_on,convert_tz(a12.lastupdated,'GMT','America/New_York')) BETWEEN lv_age.lower_range_value and lv_age.upper_range_value
WHERE a11.ccpa_age_class_c_key IS NULL OR a11.ccpa_age_class_c_key <> lv_age.row_key 
)temp
/*UNION ALL
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_c.pii_handled_c_flag_flag' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final SRC 
LEFT JOIN pgrita_mdwdb.d_png_ot_ccpa_numerita_c TRGT ON SRC.ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE  
IF(SRC.pii_handled_c_flag IS NOT NULL AND SRC.pii_handled_c_flag <> '', SRC.pii_handled_c_flag,'UNSPECIFIED') 
<>TRGT.pii_handled_c_flag_flag
AND SRC.cdctype='X'
)temp*/
UNION ALL
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS ret_criteria' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_c.ret_criteria' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final SRC 
LEFT JOIN pgrita_mdwdb.d_png_ot_ccpa_numerita_c TRGT ON SRC.ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE IF(SRC.Data_retention_Criteria IS NOT NULL  AND SRC.Data_retention_Criteria <>'',
SRC.Data_retention_Criteria,'UNSPECIFIED') <>TRGT.data_retention_criteria_c
AND SRC.cdctype='X'
)temp
UNION ALL
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS data_retention_evidence_c' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_c.ret_evidence' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final SRC 
LEFT JOIN pgrita_mdwdb.d_png_ot_ccpa_numerita_c TRGT ON SRC.ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE  
IF(SRC.Data_retention_Evidence IS NOT NULL AND SRC.Data_retention_Evidence <>'',SRC.Data_retention_Evidence,'UNSPECIFIED')<>
TRGT.data_retention_evidence_c
AND SRC.cdctype='X'
)temp
UNION ALL
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_c.sub_rgt_criteria' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final SRC 
LEFT JOIN pgrita_mdwdb.d_png_ot_ccpa_numerita_c TRGT ON SRC.ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE  
IF(SRC.Data_Subject_Rights_Criteria IS NOT NULL 
AND SRC.Data_Subject_Rights_Criteria <>'',
SRC.Data_Subject_Rights_Criteria,
 'UNSPECIFIED')
<>TRGT.subj_right_criteria_c
AND SRC.cdctype='X'
)temp
UNION ALL
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS Data_Subject_Rights_Evidence' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_c.sub_rgt_evidence' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final SRC 
LEFT JOIN pgrita_mdwdb.d_png_ot_ccpa_numerita_c TRGT ON SRC.ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE  
IF(SRC.Data_Subject_Rights_Evidence IS NOT NULL  AND SRC.Data_Subject_Rights_Evidence <>'',
SRC.Data_Subject_Rights_Evidence, 'UNSPECIFIED') 
<>TRGT.subj_right_evidence_c
AND SRC.cdctype='X'
)temp
UNION ALL
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_c.vendors_evidence' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final SRC 
LEFT JOIN pgrita_mdwdb.d_png_ot_ccpa_numerita_c TRGT ON SRC.ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE  
IF(SRC.Vendors_Evidence IS NOT NULL  AND SRC.Vendors_Evidence <>'',SRC.Vendors_Evidence, 'UNSPECIFIED') 
<>TRGT.vendor_evidence_c
AND SRC.cdctype='X'
)temp
union all
SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS acc_name_pwd ' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_c.acc_name_pwd' ELSE 'SUCCESS' END as Message 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final  src
LEFT JOIN  pgrita_mdwdb.d_png_ot_ccpa_numerita_c trgt
on src.id = trgt.row_id and src.sourceinstance = trgt.source_id
where IF(src.Consumer_account_username_and_password = 'TRUE','Y','N')
       <> trgt.acct_name_pwd_c_flag
Union all
SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS adv_event_info' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_c.adv_event_info' ELSE 'SUCCESS' END as Message 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final  src
LEFT JOIN  pgrita_mdwdb.d_png_ot_ccpa_numerita_c trgt
on src.id = trgt.row_id and src.sourceinstance = trgt.source_id
where IF(src.Adverse_Event_Information = 'TRUE','Y','N') <> trgt.adverse_event_info_c_flag
union all
SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS bio_data' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_c.bio_data' ELSE 'SUCCESS' END as Message 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final  src
LEFT JOIN  pgrita_mdwdb.d_png_ot_ccpa_numerita_c trgt
on src.id = trgt.row_id and src.sourceinstance = trgt.source_id
where IF(src.Biometric_Data = 'TRUE','Y','N')  <> trgt.biometric_data_c_flag













 




