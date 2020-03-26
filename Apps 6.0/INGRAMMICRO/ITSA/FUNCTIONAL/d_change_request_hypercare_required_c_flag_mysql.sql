SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_change_request.hypercare_required_c_flag' ELSE 'SUCCESS' END as Message
FROM ingrammicro_mdsdb.change_request_final SRC
JOIN ingrammicro_mdwdb.d_change_request TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id
WHERE CASE WHEN u_hypercare_required='yes' THEN 'Y' ELSE 'N' END<> TRGT.hypercare_required_c_flag
and SRC.CDCTYPE<>'D';


