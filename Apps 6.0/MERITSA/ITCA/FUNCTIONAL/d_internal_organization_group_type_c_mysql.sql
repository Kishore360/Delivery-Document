SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_internal_organization.subsidiary_flag' ELSE 'SUCCESS' END as Message
FROM (select count(1) as cnt  FROM 
meritsa_mdsdb.synonyms_final SRC_P
LEFT JOIN meritsa_mdwdb.d_internal_organization TRGT 
ON (SRC_P.sourceinstance =TRGT.source_id 
and CONCAT('GROUP_LEVEL~',acd_no,'~',trim(SRC_P.value)) = TRGT.row_id ) and 
TRGT.group_lvl_flag = 'Y' AND TRGT.current_flag = 'Y'
  AND TRIM(organization_name) not like 'z8990%' where 
CASE  WHEN TRIM(organization_name) not like 'z8990%' then 'Agent Group'                                   
                else 'UNSPECIFIED' END <> TRGT.group_type_c)m;
  
  
  