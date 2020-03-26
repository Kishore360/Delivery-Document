SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_change_request.failure_flag' ELSE 'SUCCESS' END as Message
FROM ingrammicro_mdsdb.change_request_final SRC
JOIN ingrammicro_mdwdb.d_change_request TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id
JOIN ingrammicro_mdwdb.f_change_request TRGT1
ON TRGT.row_key=TRGT1.change_request_key
JOIN ingrammicro_mdwdb.d_lov_map lov on lov.dimension_class='STATE~CHANGE_REQUEST' and SRC.state=lov.dimension_code
WHERE (CASE WHEN lov.dimension_wh_code='CLOSED' and TRGT.post_deployment_status_c not in ('Successful','UNSPECIFIED') THEN 'Y'
WHEN lov.dimension_wh_code='OPEN' then 'X' ELSE 'N' END)<>TRGT.failure_flag and SRC.CDCTYPE<>'D'


