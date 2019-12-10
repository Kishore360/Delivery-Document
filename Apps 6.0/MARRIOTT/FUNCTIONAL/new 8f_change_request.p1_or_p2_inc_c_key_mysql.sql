SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_change_request.p1_or_p2_inc_c_key' ELSE 'SUCCESS' END as Message
FROM marriott_mdsdb.change_request_final  SRC
left JOIN marriott_mdwdb.f_change_request TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )   and SRC.cdctype<>'D'
left join marriott_mdwdb.d_incident LKP
on COALESCE((SRC.u_p1_or_p2_incident),'UNSPECIFIED')=LKP.row_id
WHERE coalesce(LKP.row_key,case when SRC.u_p1_or_p2_incident is  null then 0 else -1 end )<> (TRGT.p1_or_p2_inc_c_key)