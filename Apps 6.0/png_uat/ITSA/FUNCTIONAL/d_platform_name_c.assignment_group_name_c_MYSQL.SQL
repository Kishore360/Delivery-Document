SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_platform_name_c.assignment_group_name_c' ELSE 'SUCCESS' END as Message
FROM 
(
Select *
FROM png_mdsdb.us_platform_names_final SRC 
LEFT JOIN png_mdwdb.d_platform_name_c TRGT ON SRC.Assignment_Group=TRGT.row_id
WHERE COALESCE(SRC.Assignment_Group,'UNSPECIFIED')<>TRGT.assignment_group_name_c
AND SRC.cdctype='X'
) temp; 


 
 
 