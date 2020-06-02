SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.change_assigned_to_key' ELSE 'SUCCESS' END as Message
from (SELECT * FROM #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final WHERE CDCTYPE<>'D') SRC
left join(SELECT * FROM #MDS_TABLE_SCHEMA.hlx_ctm_people_final)SRC1
on SRC.aslogid=SRC1.remedy_login_id
left join (SELECT * FROM #DWH_TABLE_SCHEMA.d_change_failure where current_flag='Y') TRGT 
ON (SRC.infrastructure_change_id=TRGT.row_id 
AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP 
ON COALESCE(CONCAT('INTERNAL_CONTACT~',SRC1.Person_ID),'UNSPECIFIED')=LKP.row_id
AND SRC.sourceinstance = LKP.source_id 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC1.person_id IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.change_assigned_to_key ,'')

