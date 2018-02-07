
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_eit_application_c.application' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) AS CNT
FROM bbandt_mdsdb.cmdb_ci_spkg_final SRC 
JOIN bbandt_mdsdb.us_technical_health_check_c_final a ON (SRC.name=a.row_id AND SRC.sourceinstance=a.sourceinstance)
JOIN bbandt_mdwdb.d_eit_application_c b ON a.archer_id=b.archer_id and a.sourceinstance=b.source_id
where SRC.name<>b.application
)temp;


