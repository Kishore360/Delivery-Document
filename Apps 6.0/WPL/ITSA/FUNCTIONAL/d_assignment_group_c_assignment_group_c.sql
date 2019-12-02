SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_assignment_group_c.assignment_group' ELSE 'SUCCESS' END as Message  
FROM 
(
SELECT count(1) as cnt 
FROM  wpl_mdsdb.us_MATFN_AssignmentGroupLeader_final  src
left join wpl_mdwdb.d_assignment_group_c trgt on concat(src.assignmentgroup,'~',src.leader) =trgt.row_id and src.sourceinstance=trgt.source_id
where src.cdctype<>'D' and   src.assignmentgroup <> trgt.assignment_group
) temp; 
