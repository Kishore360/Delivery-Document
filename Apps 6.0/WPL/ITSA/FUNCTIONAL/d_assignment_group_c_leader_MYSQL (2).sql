SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_assignment_group_c .leader'
 ELSE 'SUCCESS' END as Message 
 FROM wpl_mdsdb.us_MATFN_AssignmentGroupLeader_final SRC
 JOIN wpl_mdwdb.d_assignment_group_c TRGT 
 ON concat(SRC.assignmentgroup,
                '~',
                SRC.leader)  = TRGT.row_id  
 AND SRC.sourceinstance = TRGT.source_id  
 WHERE SRC.leader<> (TRGT.leader)
 and SRC.CDCTYPE='X';
 