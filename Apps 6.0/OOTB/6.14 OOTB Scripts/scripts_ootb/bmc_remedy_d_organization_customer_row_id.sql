 
 
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_com_company_final WHERE CDCTYPE<>'D' AND  #MDS_TABLE_SCHEMA.hlx_com_company_final.Company_Entry_ID NOT IN (0,-1)  ) SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_organization_customer TRGT 
 ON (CONCAT('ORG_CUST~',SRC.Company_Entry_ID)=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE(SRC.company_entry_id,'') <> COALESCE(TRGT.row_id,'')  AND lower(SRC.company_type) = 'customer' 