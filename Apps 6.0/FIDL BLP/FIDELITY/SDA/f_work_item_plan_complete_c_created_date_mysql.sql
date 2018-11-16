SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_outage.audience_outage_c_key' ELSE 'SUCCESS' END as Message 
FROM (SELECT distinct 
cif.cdctype,
cif.sourceinstance as source_id,
concat(ics.issueid,'~',ics2.id,'~',date(cf.created),'~1') as row_id ,
date(cf.created) as created_date,
1
FROM
fidelity_mdsdb.issue_changelog_items_final cif
JOIN
fidelity_mdsdb.issue_changelog_final cf ON cf.id = cif.issuechangelogid
JOIN
(select issueid,TRIM(SUBSTRING_INDEX(tostring, ',', -1)) as `name`,TRIM(SUBSTRING_INDEX(`to`, ',', -1)) as id 
from fidelity_mdsdb.issue_changelog_items_final s 
where field in ('sprint') and `to` > 0) ics ON cif.issueid = ics.issueid
JOIN
fidelity_mdsdb.issue_closedsprints_final ics2 ON ics2.id = ics.id
JOIN
fidelity_mdsdb.issue_final isf ON ics.issueid = isf.id
WHERE 
DATE(cf.created) = DATE(ics2.startdate)
AND cif.field = 'sprint'
AND INSTR(tostring, ics.name) > 0
union
select  distinct 
cdctype,source_id,row_id,resolvedate,sum(is_reopened) from (
SELECT 
ics.cdctype,
ics.sourceinstance as source_id,
concat(ics.issueid,'~',ics.id,'~',date(cf.created),'~0') as row_id,
date(cf.created) as resolvedate,
CASE WHEN tostring='Reopened' then -1 else 1 end is_reopened
FROM
fidelity_mdsdb.issue_changelog_items_final cif
JOIN
fidelity_mdsdb.issue_changelog_final cf ON cf.id = cif.issuechangelogid
JOIN
fidelity_mdsdb.issue_closedsprints_final ics ON cif.issueid = ics.issueid
JOIN
fidelity_mdsdb.issue_final isf ON ics.issueid = isf.id
JOIN
fidelity_mdsdb.issuetype_final itf ON itf.id = isf.issuetypeid
AND itf.name != 'Sub-Task'
WHERE cf.created BETWEEN ics.startdate AND ics.completedate
AND field = 'Status'
AND tostring IN ('Resolved','Closed','Reopened')
ORDER BY ics.completedate) T group by 1,2,3,4 having sum(is_reopened)>0  
) SRC
JOIN fidelity_mdwdb.f_work_item_plan_complete_c TRGT 
ON SRC.row_id = TRGT.row_id AND SRC.source_id = TRGT.source_id  and SRC.cdctype <>'D'  
WHERE SRC.created_date<>(TRGT.created_date) 
