SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.iteration_key' ELSE 'SUCCESS' END as Message
/*select TRGT.row_id, TRGT.row_key,

COALESCE(CASE 
WHEN actv_sprnt.sprintid IS NULL THEN 
CASE WHEN clsd_sprnt.sprintid IS NULL THEN 'UNSPECIFIED' ELSE clsd_sprnt.sprintid END
ELSE  actv_sprnt.sprintid END, 'UNKNOWN') AS iteration_id,
IT.row_key, TRGT.iteration_key*/

FROM #MDS_TABLE_SCHEMA.issue_final SRC
left join
(
SELECT MAX(sprint.id) AS sprintid, issues_sprint.id AS row_id, issues_sprint.id AS issueid    
FROM #MDS_TABLE_SCHEMA.issues_sprint_final issues_sprint      
LEFT JOIN #MDS_TABLE_SCHEMA.sprint_final sprint 
ON issues_sprint.sprintid=sprint.id 
WHERE issues_sprint.sprintid != 0    
GROUP BY 2,3
) actv_sprnt
ON concat(SRC.id, '') = actv_sprnt.issueid  
LEFT JOIN
(
SELECT clsd_sprnt_lst.issueid AS row_id, clsd_sprnt_lst.issueid AS issueid,
MAX(clsd_sprnt_lst.sprint_count) AS sprint_count,
MAX(sprint.id) AS sprintid    
FROM (
SELECT Count(Distinct(issue_closedsprints.id)) AS sprint_count, issue_closedsprints.issueid AS issueid, 
issue_closedsprints.issueid AS row_id,
MAX(sprint.startdate) AS max_startdate    
FROM #MDS_TABLE_SCHEMA.issue_closedsprints_final issue_closedsprints      
LEFT OUTER JOIN #MDS_TABLE_SCHEMA.sprint_final sprint 
ON issue_closedsprints.id=sprint.id       
GROUP BY 2, 3
) clsd_sprnt_lst      
INNER JOIN #MDS_TABLE_SCHEMA.issue_closedsprints_final issue_closedsprints 
ON clsd_sprnt_lst.issueid=issue_closedsprints.issueid 
AND clsd_sprnt_lst.max_startdate=issue_closedsprints.startdate 
LEFT OUTER JOIN #MDS_TABLE_SCHEMA.sprint_final sprint 
ON issue_closedsprints.id=sprint.id       
GROUP BY 1, 2
) clsd_sprnt
ON concat(SRC.id, '')=clsd_sprnt.issueid  

left join #DWH_TABLE_SCHEMA.d_iteration IT
on COALESCE(CASE 
WHEN actv_sprnt.sprintid IS NULL 
THEN CASE WHEN clsd_sprnt.sprintid IS NULL THEN 'UNSPECIFIED' ELSE clsd_sprnt.sprintid END
ELSE  actv_sprnt.sprintid END, 'UNKNOWN')=IT.row_id

left join #DWH_TABLE_SCHEMA.d_work_item TRGT
 on concat(SRC.id, '')=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
 
where coalesce(IT.row_key,0) <> coalesce(TRGT.iteration_key,'');