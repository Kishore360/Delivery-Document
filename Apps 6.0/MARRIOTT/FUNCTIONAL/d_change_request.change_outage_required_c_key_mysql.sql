SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.change_outage_required_c_key' ELSE 'SUCCESS' END as Message
FROM marriott_mdsdb.change_request_final  SRC
left JOIN marriott_mdwdb.d_change_request TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )   and SRC.cdctype<>'D'
left join marriott_mdwdb.d_lov LKP
on COALESCE(CONCAT('OUTAGE_REQUIRED_C~CHANGE_REQUEST','~',UPPER(SRC.u_outage_required)),'UNSPECIFIED')=LKP.row_id
WHERE coalesce(LKP.row_key,case when SRC.u_outage_required is  null then 0 else -1 end )<> (TRGT.change_outage_required_c_key)
;