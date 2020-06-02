select SRC.sourceinstance,TRGT.source_id,SRC.acd_no,SRC.item_name,SRC.value,(concat(acd_no,'~',trim(item_name),'~',value)),TRGT.row_id , COALESCE(case when SRC.cdctype = 'D' then 'Y' else 'N' end, '' ) ,COALESCE(TRGT.active_flag ,'') 
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.agroups_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact_organization TRGT 
 ON (concat(acd_no,'~',trim(item_name),'~',value) =TRGT.row_id 
 AND SRC.sourceinstance =TRGT.source_id ) 
where COALESCE(case when SRC.cdctype = 'D' then 'N' else 'Y' end, '' ) <> COALESCE(TRGT.active_flag ,'') 