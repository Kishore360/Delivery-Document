SELECT 
CASE WHEN CNT  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT  THEN 'MDS to DWH data validation failed for f_change_request.scafe_core_realm_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT COUNT(1) as CNT 
FROM mcdonalds_mdsdb.change_request_final a 
JOIN mcdonalds_mdwdb.f_change_request b ON (a.sys_id=b.row_id AND a.sourceinstance=b.source_id)
JOIN mcdonalds_mdwdb.d_scafe_core_realm_c LKP ON (a.x_scafe_core_realm=LKP.row_id AND a.sourceinstance=LKP.source_id)
left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = kb.sourceinstance)
where (src.cdctime<=f1.lastupdated) and LKP.row_key <> b.scafe_core_realm_c_key
)tem;

