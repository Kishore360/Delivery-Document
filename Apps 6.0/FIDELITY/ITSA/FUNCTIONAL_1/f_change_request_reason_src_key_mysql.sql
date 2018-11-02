SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_time_sheet_c.description' ELSE 'SUCCESS' END as Message
FROM  fidelity_mdsdb.change_request_final SRC
JOIN  fidelity_mdwdb.f_change_request TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
join fidelity_mdwdb.d_lov LKP
on COALESCE(CONCAT('REASON~CHANGE_REQUEST','~',UPPER(SRC.u_reason_for_change)),'UNSPECIFIED') =LKP.row_id
and LKP.source_id=SRC.sourceinstance and LKP.dimension_class='REASON~CHANGE_REQUEST'
WHERE COALESCE(LKP.row_key,case when SRC.u_reason_for_change is null then 0 else -1 end ) <> TRGT.reason_src_key; 