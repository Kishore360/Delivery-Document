-- OPENED Incidents 

SELECT
CASE 
WHEN Y.Total_SLA_Count = Y.Cancelled_SLA_Count AND Y.Total_SLA_Count > 0 THEN 'C'
WHEN Y.NON_Cancelled_Has_Breached_Count > 0 THEN 'N'
WHEN Y.NON_Cancelled_Count > 0 AND Y.NON_Cancelled_Has_Breached_Count = 0 THEN 'Y'
WHEN Y.task IS NULL THEN 'X'
ELSE 'X' END AS INCIDENT_MET_ALL_SLA,
Count(distinct Y.sys_id) as Open_Incident_Count  
FROM 
(
SELECT SRC.sys_id,SRC.number,SRC2.name,SRC1.stage,SRC2.target,SRC1.has_breached,SRC1.task,SRC.opened_at,
CASE WHEN (SRC2.target='resolution' OR SRC2.target IS NULL) THEN 'Resolution_SLA' ELSE 'Response_SLA' END 
IN ('Resolution_SLA','Response_SLA') AS Target_Source,
SUM(CASE WHEN CASE WHEN (SRC2.target='resolution' OR SRC2.target IS NULL) THEN 'Resolution_SLA' ELSE 'Response_SLA' END IN ('Resolution_SLA','Response_SLA')
THEN 1 ELSE 0 END ) Total_SLA_Count,
SUM(CASE WHEN 
CASE WHEN (SRC2.target='resolution' OR SRC2.target IS NULL) THEN 'Resolution_SLA' ELSE 'Response_SLA' END IN ('Resolution_SLA','Response_SLA')
AND SRC1.stage <>'cancelled' THEN 1 ELSE 0 END) AS NON_Cancelled_Count,
SUM(CASE WHEN
CASE WHEN (SRC2.target='resolution' OR SRC2.target IS NULL) THEN 'Resolution_SLA' ELSE 'Response_SLA' END IN ('Resolution_SLA','Response_SLA') 
AND SRC1.stage <>'cancelled' AND SRC1.has_breached=1 THEN 1 ELSE 0 END) AS NON_Cancelled_Has_Breached_Count,
SUM(CASE WHEN
CASE WHEN (SRC2.target='resolution' OR SRC2.target IS NULL) THEN 'Resolution_SLA' ELSE 'Response_SLA' END IN ('Resolution_SLA','Response_SLA') 
AND SRC1.stage ='cancelled' THEN 1 ELSE 0 END) AS Cancelled_SLA_Count
FROM png_mdsdb.incident_final SRC
LEFT JOIN png_mdsdb.task_sla_final SRC1 ON SRC.sys_id=SRC1.task AND SRC.sourceinstance=SRC1.sourceinstance AND SRC1.cdctype='X'
LEFT JOIN png_mdsdb.contract_sla_final SRC2 ON SRC1.sla=SRC2.sys_id AND SRC1.sourceinstance=SRC2.sourceinstance AND SRC2.cdctype='X'
WHERE SRC.cdctype='X'
Group BY SRC.sys_id
) Y
LEFT JOIN png_mdwdb.d_calendar_date DA ON DATE_FORMAT(CONVERT_TZ(Y.opened_at,'GMT','America/New_York'),'%Y%m%d')=DA.row_key 
WHERE DA.lagging_count_of_month between 0 and 24
Group by 1;

State: 

Select SRC.state,LKP.dimension_name,LKP1.dimension_code,LKP1.dimension_wh_code,
count(distinct SRC.sys_id) as CNT 
FROM png_mdsdb.incident_final SRC  
LEFT JOIN png_mdwdb.d_lov LKP ON CONCAT('STATE~INCIDENT~',SRC.state)=LKP.row_id AND SRC.sourceinstance=LKP.source_id 
LEFT JOIN png_mdwdb.d_lov_map LKP1 ON LKP.row_key=LKP1.src_key
LEFT JOIN png_mdwdb.d_calendar_date DA  ON DATE_FORMAT(CONVERT_TZ(COALESCE(SRC.closed_at,SRC.sys_updated_on),'GMT','America/New_York'),'%Y%m%d')=DA.row_key 
WHERE DA.lagging_count_of_month between 0 and 24 GROUP BY 1,2 


-- Resolved_INCIDENTS 


SELECT
CASE 
WHEN Y.Total_SLA_Count = Y.Cancelled_SLA_Count AND Y.Total_SLA_Count > 0 THEN 'C'
WHEN Y.NON_Cancelled_Has_Breached_Count > 0 THEN 'N'
WHEN Y.NON_Cancelled_Count > 0 AND Y.NON_Cancelled_Has_Breached_Count = 0 THEN 'Y'
WHEN Y.task IS NULL THEN 'X'
ELSE 'X' END AS INCIDENT_MET_ALL_SLA,
Count(distinct Y.sys_id) as Resolved_Incident_Count  
FROM 
(
SELECT SRC.sys_id,SRC.number,SRC2.name,SRC1.stage,SRC2.target,SRC1.has_breached,SRC1.task,SRC.state,
SRC.opened_at,SRC.resolved_at,SRC.closed_at,SRC.sys_updated_on,
CASE WHEN (SRC2.target='resolution' OR SRC2.target IS NULL) THEN 'Resolution_SLA' ELSE 'Response_SLA' END 
IN ('Resolution_SLA','Response_SLA') AS Target_Source,
SUM(CASE WHEN CASE WHEN (SRC2.target='resolution' OR SRC2.target IS NULL) THEN 'Resolution_SLA' ELSE 'Response_SLA' END IN ('Resolution_SLA','Response_SLA')
THEN 1 ELSE 0 END ) Total_SLA_Count,
SUM(CASE WHEN 
CASE WHEN (SRC2.target='resolution' OR SRC2.target IS NULL) THEN 'Resolution_SLA' ELSE 'Response_SLA' END IN ('Resolution_SLA','Response_SLA')
AND SRC1.stage <>'cancelled' THEN 1 ELSE 0 END) AS NON_Cancelled_Count,
SUM(CASE WHEN
CASE WHEN (SRC2.target='resolution' OR SRC2.target IS NULL) THEN 'Resolution_SLA' ELSE 'Response_SLA' END IN ('Resolution_SLA','Response_SLA') 
AND SRC1.stage <>'cancelled' AND SRC1.has_breached=1 THEN 1 ELSE 0 END) AS NON_Cancelled_Has_Breached_Count,
SUM(CASE WHEN
CASE WHEN (SRC2.target='resolution' OR SRC2.target IS NULL) THEN 'Resolution_SLA' ELSE 'Response_SLA' END IN ('Resolution_SLA','Response_SLA') 
AND SRC1.stage ='cancelled' THEN 1 ELSE 0 END) AS Cancelled_SLA_Count
FROM png_mdsdb.incident_final SRC
LEFT JOIN png_mdsdb.task_sla_final SRC1 ON SRC.sys_id=SRC1.task AND SRC.sourceinstance=SRC1.sourceinstance AND SRC1.cdctype='X'
LEFT JOIN png_mdsdb.contract_sla_final SRC2 ON SRC1.sla=SRC2.sys_id AND SRC1.sourceinstance=SRC2.sourceinstance AND SRC2.cdctype='X'
WHERE SRC.cdctype='X'
Group BY SRC.sys_id
) Y
LEFT JOIN png_mdwdb.d_calendar_date DA ON 
DATE_FORMAT(CONVERT_TZ(COALESCE(Y.resolved_at,Y.closed_at,Y.sys_updated_on),'GMT','America/New_York'),'%Y%m%d')=DA.row_key 
WHERE Y.state IN (7,218)
AND DA.lagging_count_of_month between 0 and 11
Group by 1;


Resolved-Duration <=60 mins RITMs  Count 

SELECT
CASE 
WHEN Y.Total_SLA_Count = Y.Cancelled_SLA_Count AND Y.Total_SLA_Count > 0 THEN 'C'
WHEN Y.NON_Cancelled_Has_Breached_Count > 0 THEN 'N'
WHEN Y.NON_Cancelled_Count > 0 AND Y.NON_Cancelled_Has_Breached_Count = 0 THEN 'Y'
WHEN Y.task IS NULL THEN 'X'
ELSE 'X' END AS INCIDENT_MET_ALL_SLA,
Count(distinct Y.sys_id) as Resolved_Incident_Count  
FROM 
(
SELECT SRC.sys_id,SRC.number,SRC2.name,SRC1.stage,SRC2.target,SRC1.has_breached,SRC1.task,SRC.state,
SRC.opened_at,SRC.resolved_at,SRC.closed_at,SRC.sys_updated_on,
TIMESTAMPDIFF(MINUTE,SRC.opened_at,coalesce(SRC.resolved_at,SRC.closed_at,SRC.sys_updated_on)) AS Open_Resolved_Duration,
CASE WHEN (SRC2.target='resolution' OR SRC2.target IS NULL) THEN 'Resolution_SLA' ELSE 'Response_SLA' END 
IN ('Resolution_SLA','Response_SLA') AS Target_Source,
SUM(CASE WHEN CASE WHEN (SRC2.target='resolution' OR SRC2.target IS NULL) THEN 'Resolution_SLA' ELSE 'Response_SLA' END IN ('Resolution_SLA','Response_SLA')
THEN 1 ELSE 0 END ) Total_SLA_Count,
SUM(CASE WHEN 
CASE WHEN (SRC2.target='resolution' OR SRC2.target IS NULL) THEN 'Resolution_SLA' ELSE 'Response_SLA' END IN ('Resolution_SLA','Response_SLA')
AND SRC1.stage <>'cancelled' THEN 1 ELSE 0 END) AS NON_Cancelled_Count,
SUM(CASE WHEN
CASE WHEN (SRC2.target='resolution' OR SRC2.target IS NULL) THEN 'Resolution_SLA' ELSE 'Response_SLA' END IN ('Resolution_SLA','Response_SLA') 
AND SRC1.stage <>'cancelled' AND SRC1.has_breached=1 THEN 1 ELSE 0 END) AS NON_Cancelled_Has_Breached_Count,
SUM(CASE WHEN
CASE WHEN (SRC2.target='resolution' OR SRC2.target IS NULL) THEN 'Resolution_SLA' ELSE 'Response_SLA' END IN ('Resolution_SLA','Response_SLA') 
AND SRC1.stage ='cancelled' THEN 1 ELSE 0 END) AS Cancelled_SLA_Count
FROM png_mdsdb.incident_final SRC
LEFT JOIN png_mdsdb.task_sla_final SRC1 ON SRC.sys_id=SRC1.task AND SRC.sourceinstance=SRC1.sourceinstance AND SRC1.cdctype='X'
LEFT JOIN png_mdsdb.contract_sla_final SRC2 ON SRC1.sla=SRC2.sys_id AND SRC1.sourceinstance=SRC2.sourceinstance AND SRC2.cdctype='X'
WHERE SRC.cdctype='X'
Group BY SRC.sys_id
) Y
LEFT JOIN png_mdwdb.d_calendar_date DA ON 
DATE_FORMAT(CONVERT_TZ(COALESCE(Y.resolved_at,Y.closed_at,Y.sys_updated_on),'GMT','America/New_York'),'%Y%m%d')=DA.row_key 
WHERE Y.state IN (7,218)
AND Y.Open_Resolved_Duration <= 60.0
AND DA.lagging_count_of_month between 0 and 11
Group by 1;




Resolved_INCIDENTS where Duration is Less than 60 


incident_open_to_resolve_duration 

