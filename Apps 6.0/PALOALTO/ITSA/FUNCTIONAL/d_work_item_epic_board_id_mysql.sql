SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'Data Mismatch' ELSE 'SUCCESS' END as Message
 FROM paloalto_mdsdb.epic_final a
 JOIN paloalto_mdsdb.issue_final issue 
ON a.id=issue.id and a.sourceinstance=issue.sourceinstance 
 join paloalto_mdwdb.d_work_item_epic b
 on issue.key=b.row_id and issue.sourceinstance=b.source_id
 where a.boardid<>b.board_id;