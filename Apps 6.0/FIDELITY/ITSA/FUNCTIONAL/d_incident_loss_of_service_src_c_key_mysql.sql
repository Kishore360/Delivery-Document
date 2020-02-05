SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_time_sheet_c.description' ELSE 'SUCCESS' END as Message
FROM  fidelity_mdsdb.incident_final SRC
JOIN  fidelity_mdwdb.d_incident TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
join fidelity_mdwdb.d_lov LKP
on COALESCE( CONCAT('U_LOSS_OF_SERVICE','~','INCIDENT','~',upper(SRC.u_loss_of_service)),'UNSPECIFIED')=LKP.row_id
and LKP.source_id=SRC.sourceinstance and LKP.dimension_class='U_LOSS_OF_SERVICE~INCIDENT'
WHERE COALESCE(LKP.row_key,case when SRC.u_loss_of_service is null then 0 else -1 end ) <> TRGT.loss_of_service_src_c_key and SRC.cdctype<>'D'
; 