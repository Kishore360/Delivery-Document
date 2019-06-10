  SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_organization.subsidiary_flag' ELSE 'SUCCESS' END as Message
FROM 
mercury_mdsdb.synonyms_final SRC_P
LEFT JOIN mercury_mdwdb.d_internal_organization TRGT 
ON (SRC_P.sourceinstance =TRGT.source_id 
and CONCAT('GROUP_LEVEL~',acd_no,'~',trim(SRC_P.value)) = TRGT.row_id ) and 
d_internal_organization.group_lvl_flag = 'Y' AND d_internal_organization.current_flag = 'Y'
  AND TRIM(organization_name) not like 'z8990%'
CASE                                   
                WHEN TRIM(organization_name) not like 'z8990%' then 'Agent Group'                                   
                else 'UNSPECIFIED'                           
            END            
             <> COALESCE(TRGT.group_type_c,'')
  