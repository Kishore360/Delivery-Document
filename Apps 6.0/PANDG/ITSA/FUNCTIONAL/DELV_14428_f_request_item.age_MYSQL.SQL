SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_request_item.age' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM pandg_mdwdb.f_request_item f 
JOIN pandg_mdwdb.d_request_item a ON a.row_key = f.request_item_key AND f.source_id = a.source_id
JOIN (select max(lastupdated) as lastupdated,source_id from pandg_workdb.d_o_data_freshness group by source_id) df ON f.source_id = df.source_id
WHERE 
(CASE 
WHEN a.active_flag='Y' THEN timestampdiff(second, CONVERT_TZ(a.opened_on,'America/New_York','GMT'), CONVERT_TZ(df.lastupdated,'America/New_York','GMT'))
WHEN a.active_flag='N' THEN timestampdiff(second, CONVERT_TZ(a.opened_on,'America/New_York','GMT'), CONVERT_TZ(a.closed_on,'America/New_York','GMT')) ELSE NULL 
END)<>f.age
) temp;



