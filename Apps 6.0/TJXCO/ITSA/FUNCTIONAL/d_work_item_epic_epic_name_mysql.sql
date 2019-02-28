SELECT CASE WHEN CNT> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for incident.u_category' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) AS CNT 
FROM (select * from tjxco_mdsdb.epic_final where CDCTYPE<>'D') a 
JOIN tjxco_mdwdb.d_work_item_epic c ON a.`key`=c.row_id AND a.sourceinstance=c.source_id
and a.`key` is not null
WHERE a.name<>c.epic_name 
) temp;