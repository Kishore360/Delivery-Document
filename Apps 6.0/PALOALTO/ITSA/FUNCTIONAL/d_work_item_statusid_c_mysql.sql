SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'Data Mismatch' ELSE 'SUCCESS' END as Message
 FROM paloalto_mdsdb.issue_final a
 join paloalto_mdwdb.d_work_item b
 on a.id=b.row_id and a.sourceinstance=b.source_id
 where a.epic_status<>b.statusid_c;