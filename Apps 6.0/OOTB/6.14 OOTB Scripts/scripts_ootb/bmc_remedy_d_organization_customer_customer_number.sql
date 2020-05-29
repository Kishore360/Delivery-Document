
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_com_company_final WHERE CDCTYPE<>'D' ) SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_organization_customer TRGT 
 ON (CONCAT('ORG_CUST~',SRC.Company_Entry_ID)=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE(SRC.company,'') <> COALESCE(TRGT.customer_number,'')  AND lower(SRC.company_type) = 'customer'