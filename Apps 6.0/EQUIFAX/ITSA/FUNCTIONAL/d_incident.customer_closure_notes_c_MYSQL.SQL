SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_incident.customer_closure_notes_c' ELSE 'SUCCESS' END as Message
FROM 
(
Select count(1) as CNT 
FROM equifax_mdsdb.incident_final SRC 
LEFT JOIN equifax_mdwdb.d_incident TRGT ON SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE coalesce(substring(SRC.u_customer_closure_notes,0,3999),'UNSPECIFIED') <> coalesce(substring(TRGT.customer_closure_notes_c,0,3999),'UNSPECIFIED') and SRC.cdctype<>'D'

) temp
