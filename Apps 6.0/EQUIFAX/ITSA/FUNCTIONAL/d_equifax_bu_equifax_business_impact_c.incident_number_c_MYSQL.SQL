SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_equifax_bu_equifax_business_impact_c.incident_number_c' ELSE 'SUCCESS' END as Message
FROM 
(
Select count(1) as CNT 
FROM equifax_mdsdb.x_59673_equifax_bu_equifax_business_impact_table_final SRC
LEFT JOIN equifax_mdwdb.d_equifax_bu_equifax_business_impact_c TRGT ON SRC.sys_id=TRGT.row_id AND 
SRC.sourceinstance=TRGT.source_id 
WHERE SRC.u_incident_number<>TRGT.incident_number_c and SRC.cdchash<>'D' and TRGT.soft_deleted_flag='N'
) temp;
