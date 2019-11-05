
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_sms_it_auditissues.date_c' ELSE 'SUCCESS' END as Message  
FROM 
(
SELECT count(1) as cnt 
FROM  whirlpool_mdsdb.us_sms_it_auditissues_trends_final  src
left join whirlpool_mdwdb.f_sms_it_auditissues trgt on src.row_id=trgt.row_id and src.sourceinstance=trgt.source_id
where cast( concat(SUBSTRING_INDEX(src.date,
            '/',
            -1),
            SUBSTRING_INDEX(src.date,
            '/',
            1),
            SUBSTRING_INDEX(SUBSTRING_INDEX(src.date,
            '/',
            2),
            '/',
            -1)) AS  SIGNED INTEGER  )<>trgt.date_c
) temp; 



	