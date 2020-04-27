SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_change_request.failure_flag' ELSE 'SUCCESS' END as Message
FROM ingrammicro_mdsdb.change_request_final SRC
JOIN ingrammicro_mdwdb.d_change_request TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id and SRC.cdctype<>'D'
JOIN ingrammicro_mdwdb.f_change_request TRGT1
ON TRGT.row_key=TRGT1.change_request_key
JOIN ingrammicro_mdwdb.d_lov_map lov on lov.dimension_class='STATE~CHANGE_REQUEST' and SRC.state=lov.dimension_code
 WHERE (CASE WHEN lov.dimension_wh_code='OPEN' then 'X'
  WHEN lov.dimension_wh_code='CLOSED' and SRC.u_post_deployment_status not in ('Successful','Partially Successful') THEN 'Y' ELSE 'N' END)<>TRGT.failure_flag 
  and SRC.CDCTYPE<>'D'


