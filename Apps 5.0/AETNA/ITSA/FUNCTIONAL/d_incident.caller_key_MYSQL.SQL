SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM aetna_mdsdb.incident_final SRC 
JOIN aetna_mdwdb.d_incident TRGT ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id  and SRC.cdctype<>'D')
left join aetna_mdwdb.d_internal_contact lkp
on  caller_id =lkp.row_id and SRC.sourceinstance=lkp.source_id
join (select source_id,max(lastupdated) as lastupdated from aetna_mdwdb.d_o_data_freshness group by source_id) f1 on
 (f1.source_id = SRC.sourceinstance) and  (SRC.cdctime<=f1.lastupdated)
WHERE TRGT.soft_deleted_flag='N'
AND COALESCE(lkp.row_key,CASE WHEN SRC.caller_id IS NULL THEN 0 else -1 end)<>TRGT. caller_key
) temp;