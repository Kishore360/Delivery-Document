 
SELECT 

CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,

CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_maintenance_window_c.day_c' ELSE 'SUCCESS' END as Message

FROM 

(
Select Count(1) AS CNT 
FROM equifax_mdsdb.u_maintenance_window_final SRC 

LEFT JOIN equifax_mdwdb.d_maintenance_window_c TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id

WHERE SRC.u_day<>TRGT.day_c and SRC.cdctype<>'D'
) temp;

