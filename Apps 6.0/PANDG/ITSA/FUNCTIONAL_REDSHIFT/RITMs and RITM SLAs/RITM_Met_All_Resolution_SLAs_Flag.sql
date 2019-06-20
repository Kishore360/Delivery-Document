SELECT X.number,Y.name,
 Y.STAGE,Y.Has_breached,
CASE 
WHEN (Y.STAGE  like '%completed%' OR Y.STAGE like '%in_progress%' OR Y.STAGE like '%paused%')  AND Y.Has_breached  like '%1%' THEN 'N'
WHEN (Y.STAGE  like '%completed%' OR Y.STAGE like '%in_progress%' OR Y.STAGE like '%paused%')  AND Y.Has_breached like '%0%' THEN 'Y'
WHEN Y.task IS NULL THEN 'X'
WHEN Y.STAGE ='cancelled' THEN 'C'
ELSE 'UNSPECIFIED' END AS RITM_Met_All_Resolution_SLAs_Flag,
Count(1) as CNT 
FROM png_mdsdb.sc_req_item_final X 
LEFT JOIN 
(
SELECT a.number,name,
a.task AS task,a.SourceIns, 
GROUP_CONCAT(distinct a.stage) AS STAGE,GROUP_CONCAT(distinct a.has_breached) as Has_breached,GROUP_CONCAT(a.target) AS Target
FROM 
(
SELECT SRC.number,SRC2.name,SRC1.stage,SRC1.has_breached,SRC2.target,SRC1.sourceinstance AS SourceIns,SRC1.cdctype,SRC1.task
FROM png_mdsdb.sc_req_item_final SRC 
LEFT JOIN png_mdsdb.task_sla_final SRC1 ON SRC.sys_id=SRC1.task AND SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN png_mdsdb.contract_sla_final SRC2 ON SRC1.sla=SRC2.sys_id AND SRC1.sourceinstance=SRC2.sourceinstance
WHERE (SRC2.target IS NULL OR SRC2.target='resolution')
) a GROUP BY 1,2
) Y ON X.sys_id=Y.task AND X.sourceinstance=Y.SourceIns
-- WHERE  X.number='RITM0011040'
Group by 1,2;
