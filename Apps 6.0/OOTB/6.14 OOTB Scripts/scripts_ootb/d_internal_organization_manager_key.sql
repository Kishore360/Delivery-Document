SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_organization.manager_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT E_TRGT.ROW_ID AS GROUP_ID, E_TRGT.source_id,
STG.MANAGER AS MGR_ID, 
CASE WHEN E_TRGT.ROW_ID LIKE 'GROUP~%' THEN M_TRGT.ROW_KEY
WHEN E_TRGT.ROW_ID NOT LIKE 'GROUP~%' THEN 0 END  AS MGR_ROW_KEY
FROM #DWH_TABLE_SCHEMA.d_internal_organization E_TRGT 
LEFT OUTER JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_user_group_final WHERE CDCTYPE<>'D') STG
ON CONCAT('GROUP~',STG.SYS_ID) = E_TRGT.ROW_ID
LEFT OUTER JOIN #DWH_TABLE_SCHEMA.d_internal_contact M_TRGT
ON CONCAT('INTERNAL_CONTACT~',STG.MANAGER) = M_TRGT.ROW_ID
where E_TRGT.ROW_KEY not in (0,-1) and E_TRGT.source_id = 2
) SRC
LEFT JOIN 
#DWH_TABLE_SCHEMA.d_internal_organization TRGT 
	ON (SRC.GROUP_ID =TRGT.row_id 
	AND SRC.source_id =TRGT.source_id )
WHERE COALESCE(CASE WHEN SRC.MGR_ID IS NULL THEN 0 
               when SRC.MGR_ID is not null and SRC.MGR_ROW_KEY IS NULL THEN -1 
               ELSE SRC.MGR_ROW_KEY END,'')<> COALESCE(TRGT.MANAGER_KEY,'')
