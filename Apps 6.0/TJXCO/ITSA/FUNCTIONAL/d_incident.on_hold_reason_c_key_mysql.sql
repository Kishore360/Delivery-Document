SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_incident.on_hold_reason_c_key' ELSE 'SUCCESS' END as  Message
FROM 
(select count(1) as CNT
FROM tjxco_mdsdb.incident_final src1 
left join tjxco_mdwdb.d_incident trgt on src1.sys_id=trgt.row_id and src1.sourceinstance=trgt.source_id
left join tjxco_mdwdb.d_lov lkp on concat('ON_HOLD_REASON_C~INCIDENT~',src1.hold_reason)=lkp.row_id
WHERE coalesce(lkp.row_key, case when src1.hold_reason is null then 0 else -1 end ) <> trgt.on_hold_reason_c_key)temp;