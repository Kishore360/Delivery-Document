SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.u_planned_end_date_c' ELSE 'SUCCESS' END as Message FROM fidelity_mdsdb.change_request_final  SRC JOIN fidelity_mdwdb.d_change_request TRGT ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) WHERE convert_tz(SRC.u_planned_end_date,'GMT','America/New_York')<> (TRGT.u_planned_end_date_c)  and SRC.cdctype<>'D'
