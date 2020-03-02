SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_change_request.hypercare_start_date_c' ELSE 'SUCCESS' END as Message
FROM ingrammicro_mdsdb.change_request_final SRC
JOIN ingrammicro_mdwdb.d_change_request TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id
WHERE CONVERT_TZ (SRC.u_hypercare_start_date,'GMT','America/Los_Angeles')<> TRGT.hypercare_start_date_c
and SRC.CDCTYPE<>'D';

