SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_organization.subsidiary_flag' ELSE 'SUCCESS' END as Message
FROM 
meritsa_mdsdb.synonyms_final SRC_P
LEFT JOIN meritsa_mdwdb.d_internal_organization TRGT 
ON (SRC_P.sourceinstance =TRGT.source_id 
and CONCAT('GROUP_LEVEL~',acd_no,'~',trim(SRC_P.value)) = TRGT.row_id ) and 
TRGT.group_lvl_flag = 'Y' AND TRGT.current_flag = 'Y'
  AND TRIM(organization_name) not like 'z8990%'
  WHERE 
CASE                  
                WHEN TRIM(organization_name) = 'AIS Sales All' or TRIM(organization_name) like '%z8990550%' then 'Sales'                  
                WHEN TRIM(organization_name) = 'AIS Service' or TRIM(organization_name) like '%z8990560%' then 'Service'     
                else 'Other'              
            END <> TRGT.ais_sales_service_type_c
