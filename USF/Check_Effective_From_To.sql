

SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
, CASE WHEN COUNT(1) > 0 THEN 'effective_from and effective_to have overlap or gap for'|| count(1) || 
' records in #TABLE_NAME' 
ELSE 'No gap or overlap found in #TABLE_NAME' END AS Message 
FROM (SELECT @row_num := @row_num + 1 as row_number,row_key,row_id,source_id,effective_from,effective_to
FROM #TABLE_NAME 
ORDER BY row_id,source_id,effective_from,effective_to) A, 
(SELECT @row_num2 := @row_num2 + 1 as row_number,row_key,row_id,source_id,effective_from,effective_to
FROM #TABLE_NAME 
ORDER BY row_id,source_id,effective_from,effective_to) B
 WHERE A.row_id = B.row_id AND A.source_id = B.source_id 
AND A.row_number +1 = B.row_number 
AND (B.effective_from > DATE_ADD(A.effective_to , INTERVAL 1 SECOND) 
OR B.effective_from <=  A.effective_to ) ;
