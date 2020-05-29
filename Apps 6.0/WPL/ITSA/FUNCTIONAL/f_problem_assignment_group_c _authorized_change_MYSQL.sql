SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_problem_assignment_group_c .authorized_change'
 ELSE 'SUCCESS' END as Message 
 FROM wpl_mdsdb.us_NODCS1718_2018PRBCollectionSheet_final SRC
 JOIN wpl_mdwdb.f_problem_assignment_group_c TRGT 
 ON concat(coalesce(SRC.numbersnow,
                'unspecified'),
                '~',
                coalesce(SRC.dateandtimesnow,
                'unspecified'))  = TRGT.row_id  
 AND SRC.sourceinstance = TRGT.source_id  
 WHERE coalesce(SRC.piechartchangemgmtnocmnonchange,'UNSPECIFIED') <> (TRGT.authorized_change)
 and SRC.CDCTYPE='X';