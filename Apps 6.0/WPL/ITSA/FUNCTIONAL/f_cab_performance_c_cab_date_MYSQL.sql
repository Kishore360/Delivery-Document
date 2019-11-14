SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_cab_performance_c .cab_date'
 ELSE 'SUCCESS' END as Message 
 FROM wpl_mdsdb.us_CPDFN_sheet1_final SRC
 JOIN wpl_mdwdb.f_cab_performance_c TRGT 
 ON concat(coalesce(SRC.changenumber,
                'unspecified'),
                '~',
                coalesce(SRC.rflag,
                'unspecified'),
                '~',
                coalesce(SRC.director,
                'unspecified'),
                '~',
                coalesce(SRC.cabdate,
                'unspecified'))  = TRGT.row_id  
 AND SRC.sourceinstance = TRGT.source_id  
 WHERE STR_TO_DATE(SRC.cabdate,
                '%m/%d/%Y')<> (TRGT.cab_date)
 and SRC.CDCTYPE='X';
 