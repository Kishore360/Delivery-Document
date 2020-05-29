SELECT
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact_organization.active_flag' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.agroups_bwd_delta WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact_organization TRGT 
 ON (concat(acd_no,'~',item_name,'~',value) =TRGT.row_id 
 AND SRC.sourceinstance =TRGT.source_id ) 
where TRGT.row_key  in (0,-1) and COALESCE(case when SRC.cdctype = 'D' then 'Y' else 'N' end, '' ) <> COALESCE(TRGT.active_flag ,'') 
