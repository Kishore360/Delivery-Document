SELECT a.Product_Team_SDLC_Conf_phase,
Count(1) as CNT 
FROM jhi_mdsdb.issue_final a 
LEFT JOIN jhi_mdsdb.issue_ext_final b ON a.id=b.record_id AND a.sourceinstance=b.sourceinstance and b.cdctype='X'
LEFT JOIN jhi_mdsdb.issuetype_final c ON a.issuetype_id=c.id AND a.sourceinstance=c.sourceinstance and c.cdctype='X'
WHERE c.name='Product Team'
AND a.cdctype='X'
group by 1;


Select a.key,b.name AS Issue_Type,a.Story_Issue_Type AS Story_Issue_Type,c.name AS PROJECT,
Count(1)
FRoM jhi_mdsdb.issue_final a
LEFT JOIN jhi_mdsdb.issuetype_final b ON a.issuetype_id=b.id
LEFT JOIN jhi_mdsdb.project_final c ON a.project_id=c.id
WHERE a.key IN ('SDLC-10','SDLC-100','SDLC-101','SDLC-104','SDLC-109','SDLC-112','SDLC-113''SDLC-447','SDLC-527','SDLC-147','SDLC-148','SDLC-152','SDLC-153')
group by 1,2,3,4;

Select a.key,b.name AS Issue_Type,a.Story_Issue_Type AS Story_Issue_Type,
Count(1)
FRoM jhi_mdsdb.issue_final a
LEFT JOIN jhi_mdsdb.issuetype_final b ON a.issuetype_id=b.id
WHERE a.key like 'SDLC%'
group by 1,2,3;

Select a.Story_Issue_Type AS Story_Issue_Type,
Count(distinct a.key)
FRoM jhi_mdsdb.issue_final a
LEFT JOIN jhi_mdsdb.issuetype_final b ON a.issuetype_id=b.id
LEFT JOIN jhi_mdsdb.project_final c ON a.project_id=c.id
WHERE c.name='SDLC CoE'
group by 1;

Select *
FROM jhi_mdsdb.project_final a ;


SELECT d.source_dimension_name AS Story_Work_item,Count(1) as CNT 
FROM jhi_mdwdb.f_work_item a 
JOIN jhi_mdwdb.d_work_item b ON a.work_item_key=b.row_key
JOIN jhi_mdwdb.d_work_item_ext_c c ON b.row_key=c.work_item_c_key
JOIN jhi_mdwdb.d_lov d ON c.work_item_story_issue_type_c_key=d.row_key
group by 1;


desc jhi_mdwdb.d_work_item;