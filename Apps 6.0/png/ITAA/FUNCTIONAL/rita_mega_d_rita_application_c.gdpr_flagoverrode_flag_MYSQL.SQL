SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.gdpr_flagoverrode_flag' ELSE 'SUCCESS' END as Message
FROM 
(
select count(1) from pgcmdb_mdwdb.d_rita_application_c trgt
LEFT JOIN 
(SELECT a11.rita_application_c_key,substring_index(group_concat(a12.keyword_name order by a11.created_on desc separator '@') ,'@',1) as keyword_name,
right(substring_index(group_concat(a12.keyword_name order by a11.created_on desc separator '@') ,'@',1),1) AS keyword_code
from pgcmdb_mdwdb.f_rita_application_keyword_c a11
INNER JOIN pgcmdb_mdwdb.d_rita_keyword_c  a12  ON a11.rita_keyword_c_key = a12.row_key
WHERE a12.keyword_name IS NOT NULL AND a12.keyword_name IN('ITAM: GDPR - Relevance: No','ITAM: GDPR - Relevance: Yes' )
and a11.soft_deleted_flag = 'N'
GROUP BY 1) src
ON trgt.row_key = src.rita_application_c_key
where
trgt.gdpr_flagoverrode_flag <> CASE WHEN src.rita_application_c_key IS NOT NULL THEN 'Y' ELSE 'N' END
) temp;


