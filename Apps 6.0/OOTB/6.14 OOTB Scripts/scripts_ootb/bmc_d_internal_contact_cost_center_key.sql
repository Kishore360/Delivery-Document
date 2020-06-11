
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact.cost_center_id' ELSE 'SUCCESS' END as Message
  FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_ctm_people_final WHERE CDCTYPE<>'D') SRC
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact TRGT 
	ON (CONCAT('INTERNAL_CONTACT~',SRC.person_id)=TRGT.row_id  
	AND SRC.sourceinstance =TRGT.source_id )
left outer join #DWH_TABLE_SCHEMA.d_cost_center lkp
	ON SRC.primarycostcenterinstance_id = lkp.row_id  
	AND SRC.sourceinstance =lkp.source_id 
WHERE COALESCE(lkp.row_key,case when SRC.primarycostcenterinstance_id is null then 0 else -1 end) <> coalesce(TRGT.cost_center_key,'')
 
