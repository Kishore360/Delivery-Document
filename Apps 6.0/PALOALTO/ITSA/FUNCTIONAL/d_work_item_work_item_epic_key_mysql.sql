SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'Data Mismatch' ELSE 'SUCCESS' END as Message
 -- select a.customfield_10016,c.row_id,COALESCE(c.row_key,case when a.customfield_10016 is null then 0 else -1 end) ekey,b.work_item_epic_key
 FROM paloalto_mdsdb.issue_final a
 join paloalto_mdwdb.d_work_item b
 on a.id=b.row_id and a.sourceinstance=b.source_id
 left join paloalto_mdwdb.d_work_item_epic c
 on coalesce(a.customfield_10016,'UNSPECIFIED')=c.row_id and a.sourceinstance=c.source_id
 where COALESCE(c.row_key,case when a.customfield_10016 is null then 0 else -1 end)<>b.work_item_epic_key
 and a.CDCTYPE='X';
 



