SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)
THEN 'MDS to DWH data validation failed for d_change_request.cab_recommendation_c' ELSE 'SUCCESS' END as Message
FROM ingrammicro_mdsdb.change_request_final  SRC
JOIN ingrammicro_mdwdb.d_change_request TRGT
ON SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id
 WHERE COALESCE(SRC.cab_recommendation,'UNSPECIFIED')<>TRGT.cab_recommendation_c and SRC.CDCTYPE<>'D';
 
 
 