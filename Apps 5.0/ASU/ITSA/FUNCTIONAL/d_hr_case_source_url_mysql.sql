SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message 
FROM (SELECT count(1) as CNT 
FROM asu_mdsdb.hr_case_final SRC
JOIN asu_mdwdb.d_hr_case TRGT
ON (TRGT.row_id=SRC.sys_id and TRGT.source_id=SRC.sourceinstance)
WHERE 
CONCAT('<a href=\"','https://asu.service-now.com/nav_to.do?uri=','hr_case.do?sys_id=',SRC.sys_id,'\" target=\"_blank\">',SRC.number,'</a>')<>TRGT.source_url)temp;



