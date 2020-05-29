SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_assignment_group_c .leader'
 ELSE 'SUCCESS' END as Message from(select count(1) as cnt  
 FROM wpl_mdsdb.us_MATFN_AssignmentGroupLeader_final SRC
 JOIN wpl_mdwdb.d_assignment_group_c TRGT 
 ON concat(SRC.assignmentgroup,'~',SRC.leader)  = TRGT.row_id  
 AND SRC.sourceinstance = TRGT.source_id  
 WHERE SRC.leader<>(TRGT.leader) and SRC.cdctype='X'
 )ma;
 