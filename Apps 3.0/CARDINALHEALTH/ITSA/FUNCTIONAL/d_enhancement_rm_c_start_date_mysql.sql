SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS TO MDW DATA VALIDATION FAILED' ELSE 'Data Matched' END as Message
FROM cardinalhealth_mdsdb.rm_enhancement_final i
JOIN cardinalhealth_mdwdb.d_enhancement_rm_c d ON d.row_id=i.sys_id
                AND d.source_id=i.sourceinstance
                where
                CONVERT_TZ(i.start_date,'GMT','America/New_York') <>d.start_date
               