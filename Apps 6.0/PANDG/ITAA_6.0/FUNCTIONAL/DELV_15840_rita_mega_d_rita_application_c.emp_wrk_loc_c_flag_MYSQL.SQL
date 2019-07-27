SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.emp_wrk_loc_c_flag' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_mega_pgb_application_rita_final as app
LEFT JOIN
(
SELECT app_hex, sourceinstance,group_concat(DISTINCT ATTRIBUTE_NAME) as res
FROM 
(
SELECT app_hex,sourceinstance,replace(ATTRIBUTE_NAME,char('124'),'@') AS ATTRIBUTE_NAME 
FROM png_mdsdb.pg_mega_pgv_application_data_model_final where app_hex  IS NOT NULL and ATTRIBUTE_NAME IS NOT NULL AND cdctype<>'D'
) SRC1 
WHERE 
SRC1.ATTRIBUTE_NAME ='Employee Work Location' OR SRC1.ATTRIBUTE_NAME like '%@Employee Work Location@%' OR SRC1.ATTRIBUTE_NAME like '%@Employee Work Location' OR SRC1.ATTRIBUTE_NAME like 'Employee Work Location@%'
GROUP BY 1,2
) X ON app.NAME=X.app_hex AND app.sourceinstance=X.sourceinstance
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON app.NAME=TRGT.row_id AND app.sourceinstance=TRGT.source_id
WHERE 
IF(X.res like '%Employee Work Location%','Y','N')<>TRGT.emp_wrk_loc_c_flag
)temp;













