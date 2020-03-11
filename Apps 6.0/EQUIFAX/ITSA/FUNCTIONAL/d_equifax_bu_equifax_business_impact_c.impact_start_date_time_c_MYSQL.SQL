 
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_equifax_bu_equifax_business_impact_c.impact_start_date_time_c' ELSE 'SUCCESS' END as Message
FROM 
(
Select count(1) as cnt 
FROM equifax_mdsdb.x_59673_equifax_bu_equifax_business_impact_table_final SRC
LEFT JOIN equifax_mdwdb.d_equifax_bu_equifax_business_impact_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE CONVERT_TZ(SRC.u_impact_start_date,'GMT','America/New_York')<>TRGT.impact_start_date_time_c and SRC.cdctype<>'D'
) temp;



