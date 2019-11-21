SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_prb_collection_2018_c_fact .re_classified_manual'
 ELSE 'SUCCESS' END as Message 
 FROM wpl_mdsdb.us_NODCS1718_2018PRBCollectionSheet_final SRC
 JOIN wpl_mdwdb.f_prb_collection_2018_c_fact TRGT 
 ON concat(coalesce(SRC.numbersnow,
                'unspecified'),
                '~',
                coalesce(SRC.dateandtimesnow,
                'unspecified'))  = TRGT.row_id  
 AND SRC.sourceinstance = TRGT.source_id  
 WHERE reclassifiedmanual<> (TRGT.re_classified_manual)
 and SRC.CDCTYPE='X';
 