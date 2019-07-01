SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'Data Mismatch' ELSE 'SUCCESS' END as Message
from paloalto_mdsdb.epic_final a
 JOIN paloalto_mdsdb.issue_final issue 
ON a.id=issue.id and a.sourceinstance=issue.sourceinstance 
 join paloalto_mdwdb.d_work_item_epic b
 on issue.key=b.row_id and issue.sourceinstance=b.source_id
 where CONCAT('<a href=\"',
                '@#SDA_SYSTEM_SOURCE_URL@#',
                '\/browse\/',
                issue.key,
                '\"> <img src=..\/images\/Numerify\/atlassian_jira_url_image.png></a>')<>b.image_url
and a.cdctype='X';