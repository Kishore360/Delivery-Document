 
 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_asset.configuration_item_key' ELSE 'SUCCESS' END as Message
 FROM schneider_mdsdb.ast_assetpeople_final_final SRC 
 left join schneider_mdsdb.ctm_people_final_final_final emp_lkp on SRC.peoplegroupinstanceid = emp_lkp.instanceid and SRC.sourceinstance = emp_lkp.sourceinstance
  JOIN  schneider_mdwdb.f_asset_people_c TRGT 
 ON (SRC.instanceid=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN schneider_mdwdb.d_internal_contact LKP 
 ON ( CONCAT('INTERNAL_CONTACT~',emp_lkp.person_id) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
 WHERE DATE_FORMAT(from_unixtime(SRC.create_date) , '%Y-%m-%d %H:%i:%s') BETWEEN effective_from AND effective_to
 and COALESCE(LKP.row_key,CASE WHEN emp_lkp.person_id IS NULL THEN 0 else -1 end)<>(TRGT.employee_key)
 
 
 