DELV-16955  P&G: Modify Attribute- Request Item Met All SLAs Flag


OPEN-RITM:

SELECT CASE WHEN Total_SLA_Count= Cancelled_SLA_Count   AND Total_SLA_Count > 0 THEN 'C'
WHEN NON_Cancelled_SLA_Resolution_Hasbreached_Count > 0 THEN 'N'
WHEN NON_Cancelled_SLA_Count >0 AND NON_Cancelled_SLA_Resolution_Hasbreached_Count =0 THEN 'Y'
WHEN task IS NULL THEN 'X'
ELSE 'X' END AS Source_Request_Item_SLA,
Count(distinct sys_id) AS Opened_RITM
FROM 
(
SELECT SRC.sys_id,SRC.number,SRC2.name,SRC1.stage,SRC2.target,SRC1.has_breached,SRC1.task,SRC.opened_at,
CASE WHEN (SRC2.target='resolution' OR SRC2.target IS NULL) THEN 'Resolution_SLA' ELSE 'Response_SLA' END IN ('Resolution_SLA','Response_SLA') AS Target_Source,
SUM(CASE WHEN CASE WHEN (SRC2.target='resolution' OR SRC2.target IS NULL) THEN 'Resolution_SLA' ELSE 'Response_SLA' END IN ('Resolution_SLA','Response_SLA')
THEN 1 ELSE 0 END ) Total_SLA_Count,
SUM(CASE WHEN
CASE WHEN (SRC2.target='resolution' OR SRC2.target IS NULL) THEN 'Resolution_SLA' ELSE 'Response_SLA' END IN ('Resolution_SLA','Response_SLA')
AND SRC1.stage<>'cancelled' THEN 1 ELSE 0 END)  NON_Cancelled_SLA_Count,
SUM(CASE WHEN
CASE WHEN (SRC2.target='resolution' OR SRC2.target IS NULL) THEN 'Resolution_SLA' ELSE 'Response_SLA' END IN ('Resolution_SLA','Response_SLA')
AND SRC1.stage<>'cancelled' AND SRC1.has_breached=1 THEN 1 ELSE 0 END)  NON_Cancelled_SLA_Resolution_Hasbreached_Count,
SUM(CASE WHEN
CASE WHEN (SRC2.target='resolution' OR SRC2.target IS NULL) THEN 'Resolution_SLA' ELSE 'Response_SLA' END IN ('Resolution_SLA','Response_SLA')
AND SRC1.stage<>'cancelled' AND SRC1.has_breached=0 THEN 1 ELSE 0 END)  NON_Cancelled_SLA_Resolution_Hasbreached_CountN,
SUM(CASE WHEN CASE WHEN (SRC2.target='resolution' OR SRC2.target IS NULL) THEN 'Resolution_SLA' ELSE 'Response_SLA' END IN ('Resolution_SLA','Response_SLA')
AND SRC1.stage='cancelled' THEN 1 ELSE 0 END) Cancelled_SLA_Count
FROM png_mdsdb.sc_req_item_final SRC 
LEFT JOIN png_mdsdb.task_sla_final SRC1 ON SRC.sys_id=SRC1.task AND SRC.sourceinstance=SRC1.sourceinstance AND SRC1.cdctype='X'
LEFT JOIN png_mdsdb.contract_sla_final SRC2 ON SRC1.sla=SRC2.sys_id AND SRC1.sourceinstance=SRC2.sourceinstance AND SRC2.cdctype='X'
WHERE  SRC.cdctype='X'
group by SRC.sys_id
) Y
LEFT JOIN png_mdwdb.d_calendar_date DA ON DATE_FORMAT(CONVERT_TZ(Y.opened_at,'GMT','America/New_York'),'%Y%m%d')=DA.row_key 
WHERE DA.lagging_count_of_month between 0 and 12
Group by 1;

ClOSED-RITM

SELECT CASE WHEN Total_SLA_Count= Cancelled_SLA_Count   AND Total_SLA_Count > 0 THEN 'C'
WHEN NON_Cancelled_SLA_Resolution_Hasbreached_Count > 0 THEN 'N'
WHEN NON_Cancelled_SLA_Count >0 AND NON_Cancelled_SLA_Resolution_Hasbreached_Count =0 THEN 'Y'
WHEN task IS NULL THEN 'X'
ELSE 'X' END AS Source_Request_Item_SLA,
Count(distinct sys_id) AS Opened_RITM
FROM 
(
SELECT SRC.sys_id,SRC.number,SRC2.name,SRC1.stage,SRC2.target,SRC1.has_breached,SRC1.task,SRC.opened_at,SRC.closed_at,SRC.state,SRC.sys_updated_on,
CASE WHEN (SRC2.target='resolution' OR SRC2.target IS NULL) THEN 'Resolution_SLA' ELSE 'Response_SLA' END IN ('Resolution_SLA','Response_SLA') AS Target_Source,
SUM(CASE WHEN CASE WHEN (SRC2.target='resolution' OR SRC2.target IS NULL) THEN 'Resolution_SLA' ELSE 'Response_SLA' END IN ('Resolution_SLA','Response_SLA')
THEN 1 ELSE 0 END ) Total_SLA_Count,
SUM(CASE WHEN
CASE WHEN (SRC2.target='resolution' OR SRC2.target IS NULL) THEN 'Resolution_SLA' ELSE 'Response_SLA' END IN ('Resolution_SLA','Response_SLA')
AND SRC1.stage<>'cancelled' THEN 1 ELSE 0 END)  NON_Cancelled_SLA_Count,
SUM(CASE WHEN
CASE WHEN (SRC2.target='resolution' OR SRC2.target IS NULL) THEN 'Resolution_SLA' ELSE 'Response_SLA' END IN ('Resolution_SLA','Response_SLA')
AND SRC1.stage<>'cancelled' AND SRC1.has_breached=1 THEN 1 ELSE 0 END)  NON_Cancelled_SLA_Resolution_Hasbreached_Count,
SUM(CASE WHEN
CASE WHEN (SRC2.target='resolution' OR SRC2.target IS NULL) THEN 'Resolution_SLA' ELSE 'Response_SLA' END IN ('Resolution_SLA','Response_SLA')
AND SRC1.stage<>'cancelled' AND SRC1.has_breached=0 THEN 1 ELSE 0 END)  NON_Cancelled_SLA_Resolution_Hasbreached_CountN,
SUM(CASE WHEN CASE WHEN (SRC2.target='resolution' OR SRC2.target IS NULL) THEN 'Resolution_SLA' ELSE 'Response_SLA' END IN ('Resolution_SLA','Response_SLA')
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
Group by 1;

































