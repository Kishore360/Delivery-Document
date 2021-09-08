


SELECT
CASE WHEN CNT  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT THEN 'MDS to DWH data validation failed for d_macm_c_component_macm_key' ELSE 'SUCCESS' END as Message
FROM
(
SELECT count(1) as CNT 
FROM mcd_mdsdb.x_scafe_mcdcr_chan_mcdcr_change_request_final macm
JOIN mcd_mdwdb.d_macm_c TRGT 
ON (macm.SYS_ID=TRGT.row_id AND macm.sourceinstance=TRGT.source_id) 
where CONCAT('<a href=\"','https://servicecafe.service-now.com/nav_to.do?uri=','x_scafe_mcdcr_chan_mcdcr_change_request.do?sys_id=',macm.sys_id,'\" target=\"_blank\">',macm.number,'</a>')<>source_url)a

