CLOSE-RITMs Resolution_SLA 

SELECT CASE WHEN Resolution_SLA_Count= Cancelled_SLA_Count   AND Resolution_SLA_Count > 0 THEN 'C'
WHEN NON_Cancelled_SLA_Resolution_Hasbreached_Count > 0 THEN 'N'
WHEN NON_Cancelled_SLA_Count >0 AND NON_Cancelled_SLA_Resolution_Hasbreached_Count =0 THEN 'Y'
WHEN task IS NULL THEN 'X'
ELSE 'X' END AS Source_Resolution_SLA_Met_Flag,
Count(distinct sys_id)
FROM 
(
SELECT SRC.sys_id,SRC.number,SRC2.name,SRC1.stage,SRC2.target,SRC1.has_breached,SRC1.task,SRC.opened_at,SRC.closed_at,SRC.state,SRC.sys_updated_on,
TIMESTAMPDIFF(MINUTE,SRC.opened_at,coalesce(SRC.u_pg_itsm_resolved,SRC.closed_at,SRC.sys_updated_on)) AS Completed_Duration,
CASE WHEN (SRC2.target='resolution' OR SRC2.target IS NULL) THEN 'Resolution_SLA' ELSE 'Response_SLA' END='Resolution_SLA' AS Target_Source,
SUM(CASE WHEN CASE WHEN (SRC2.target='resolution' OR SRC2.target IS NULL) THEN 'Resolution_SLA' ELSE 'Response_SLA' END='Resolution_SLA' 
THEN 1 ELSE 0 END ) Resolution_SLA_Count,
SUM(CASE WHEN
CASE WHEN (SRC2.target='resolution' OR SRC2.target IS NULL) THEN 'Resolution_SLA' ELSE 'Response_SLA' END='Resolution_SLA'
AND SRC1.stage<>'cancelled' THEN 1 ELSE 0 END)  NON_Cancelled_SLA_Count,
SUM(CASE WHEN
CASE WHEN (SRC2.target='resolution' OR SRC2.target IS NULL) THEN 'Resolution_SLA' ELSE 'Response_SLA' END='Resolution_SLA'
AND SRC1.stage<>'cancelled' AND SRC1.has_breached=1 THEN 1 ELSE 0 END)  NON_Cancelled_SLA_Resolution_Hasbreached_Count,
SUM(CASE WHEN
CASE WHEN (SRC2.target='resolution' OR SRC2.target IS NULL) THEN 'Resolution_SLA' ELSE 'Response_SLA' END='Resolution_SLA'
AND SRC1.stage<>'cancelled' AND SRC1.has_breached=0 THEN 1 ELSE 0 END)  NON_Cancelled_SLA_Resolution_Hasbreached_CountN,
SUM(CASE WHEN CASE WHEN (SRC2.target='resolution' OR SRC2.target IS NULL) THEN 'Resolution_SLA' ELSE 'Response_SLA' END='Resolution_SLA' 
AND SRC1.stage='cancelled' THEN 1 ELSE 0 END) Cancelled_SLA_Count
FROM png_mdsdb.sc_req_item_final SRC 
LEFT JOIN png_mdsdb.task_sla_final SRC1 ON SRC.sys_id=SRC1.task AND SRC.sourceinstance=SRC1.sourceinstance AND SRC1.cdctype='X'
LEFT JOIN png_mdsdb.contract_sla_final SRC2 ON SRC1.sla=SRC2.sys_id AND SRC1.sourceinstance=SRC2.sourceinstance AND SRC2.cdctype='X'
WHERE  SRC.cdctype='X'
group by SRC.sys_id
) Y
LEFT JOIN png_mdwdb.d_calendar_date DA ON DATE_FORMAT(CONVERT_TZ(COALESCE(Y.closed_at,Y.sys_updated_on),'GMT','America/New_York'),'%Y%m%d')=DA.row_key 
WHERE DA.lagging_count_of_month between 0 and 12
AND Y.state IN (3,4,7,10,24,217)
AND Y.Completed_Duration <=60
Group by 1;

CLOSED-RITMs Respose_SLA- X

SELECT CASE 
WHEN Response_SLA_Count = Cancelled_Response_SLA_Count AND Response_SLA_Count >0 THEN 'C'
WHEN NON_Cancelled_SLA_Response_Hasbreached_Count > 0 THEN 'N'
WHEN NON_Cancelled_Response_SLA_Count > 0 AND NON_Cancelled_SLA_Response_Hasbreached_Count =0 THEN 'Y'
WHEN task IS NULL THEN 'X'
ELSE 'X' END AS Source_Response_SLA_Met_Flag,
Count(distinct Y.sys_id)
FROM 
(
SELECT SRC.sys_id,SRC.number,SRC2.name,SRC1.stage,SRC2.target,SRC1.has_breached,SRC1.task,SRC.opened_at,SRC.closed_at,SRC.state,SRC.sys_updated_on,
TIMESTAMPDIFF(MINUTE,SRC.opened_at,coalesce(SRC.u_pg_itsm_resolved,SRC.closed_at,SRC.sys_updated_on)) AS Completed_Duration,
CASE WHEN SRC2.target='response' THEN 'Response_SLA' ELSE 'Resolution_SLA' END = 'Response_SLA' AS SLA,
SUM(CASE WHEN CASE WHEN SRC2.target='response' THEN 'Response_SLA' ELSE 'Resolution_SLA' END = 'Response_SLA' THEN 1 ELSE 0 END)
 AS Response_SLA_Count,
SUM(CASE WHEN CASE WHEN SRC2.target='response' THEN 'Response_SLA' ELSE 'Resolution_SLA' END = 'Response_SLA'  AND SRC1.stage<>'cancelled'
 THEN 1 ELSE 0 END) AS NON_Cancelled_Response_SLA_Count,
SUM( CASE WHEN CASE WHEN SRC2.target='response' THEN 'Response_SLA' ELSE 'Resolution_SLA' END = 'Response_SLA'  AND SRC1.stage<>'cancelled'
 AND SRC1.has_breached =1 THEN 1 ELSE 0 END) AS NON_Cancelled_SLA_Response_Hasbreached_Count,
SUM(CASE WHEN CASE WHEN SRC2.target='response' THEN 'Response_SLA' ELSE 'Resolution_SLA' END = 'Response_SLA'  AND SRC1.stage='cancelled' THEN 
1 ELSE 0 END) AS Cancelled_Response_SLA_Count,
Count(1) as CNT 
FROM png_mdsdb.sc_req_item_final SRC 
LEFT JOIN png_mdsdb.task_sla_final SRC1 ON SRC.sys_id=SRC1.task AND SRC.sourceinstance=SRC1.sourceinstance AND SRC1.cdctype='X'
LEFT JOIN png_mdsdb.contract_sla_final SRC2 ON SRC1.sla=SRC2.sys_id AND SRC1.sourceinstance=SRC2.sourceinstance AND SRC2.cdctype='X'
WHERE  SRC.cdctype='X'
group by SRC.sys_id
) Y
LEFT JOIN png_mdwdb.d_calendar_date DA ON DATE_FORMAT(CONVERT_TZ(COALESCE(Y.closed_at,Y.sys_updated_on),'GMT','America/New_York'),'%Y%m%d')=DA.row_key 
WHERE DA.lagging_count_of_month between 0 and 12
AND Y.state IN (3,4,7,10,24,217)
AND Y.Completed_Duration <=60
Group by 1;