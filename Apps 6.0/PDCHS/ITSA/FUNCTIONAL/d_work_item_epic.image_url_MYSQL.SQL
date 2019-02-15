SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_work_item_epic.image_url' ELSE 'SUCCESS' END as Message 
FROM (SELECT count(1) as CNT 
FROM pdchs_mdsdb.epic_final SRC
JOIN pdchs_mdwdb.d_work_item_epic TRGT
ON (TRGT.row_id=SRC.sys_id and TRGT.source_id=SRC.sourceinstance)
WHERE 
CONCAT(<a href=\"',                 '@#SDA_SYSTEM_SOURCE_URL@#',                 '\/browse\/',                 epic.`key`,                 '\"> <img src=..\/images\/Numerify\/atlassian_jira_url_image.png></a>'<>TRGT.image_url)temp;
