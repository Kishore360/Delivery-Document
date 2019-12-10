SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.change_assessment_c_key' ELSE 'SUCCESS' END as Message
FROM marriott_mdsdb.change_request_final  SRC
left JOIN marriott_mdwdb.d_change_request TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )   and SRC.cdctype<>'D'
left join marriott_mdwdb.d_lov LKP
on COALESCE(CONCAT('ASSESSMENT_C~CHANGE_REQUEST','~',UPPER(SRC.u_change_assessment)),'UNSPECIFIED')=LKP.row_id
WHERE coalesce(LKP.row_key,case when SRC.u_change_assessment is  null then 0 else -1 end )<> (TRGT.change_assessment_c_key)