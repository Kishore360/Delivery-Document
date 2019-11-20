
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_ext_c.release_name_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT count(1) as CNT
FROM png_mdsdb.pg_mega_cmdb_ci_appl_final SRC 
LEFT JOIN 
(
SELECT u_configuration_item,sourceinstance,GROUP_CONCAT(distinct u_release_version order by 1) AS RELEASE_NAME
FROM png_mdsdb.pg_mega_u_release_final where u_configuration_item IS NOT NULL and cdctype<>'D'
group by 1,2
) SRC1 ON SRC.sys_id=SRC1.u_configuration_item AND SRC.sourceinstance=SRC1.sourceinstance 
LEFT JOIN png_mdwdb.d_rita_application_ext_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC1.RELEASE_NAME,'UNSPECIFIED')<>TRGT.release_name_c
AND SRC.cdctype<>'D'
) temp;





Note:
*****

The data is matching except for the order of data display for release_name_c. 