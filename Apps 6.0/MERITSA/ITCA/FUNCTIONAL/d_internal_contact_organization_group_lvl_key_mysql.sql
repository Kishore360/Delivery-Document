SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
  CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact_organization.group lvl id' ELSE 'SUCCESS' END as Message
FROM meritsa_mdsdb.agroups_final SRC 
LEFT JOIN meritsa_mdwdb.d_internal_contact_organization TRGT 
 ON (concat(acd_no,'~',trim(item_name),'~',value) =TRGT.row_id 
 AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN meritsa_mdwdb.d_internal_organization INTORG
 ON ( CONCAT('GROUP_LEVEL~',SRC.acd_no,'~',trim(SRC.item_name)) = INTORG.row_id
 AND SRC.sourceinstance =INTORG.source_id )
WHERE COALESCE( INTORG.row_key,-1) <> COALESCE(TRGT.group_lvl_key ,'')