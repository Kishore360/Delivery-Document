SELECT CASE WHEN COUNT(*) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
, CASE WHEN COUNT(*) > 0 THEN 'effective_from and effective_to have overlap or gap for'|| COUNT(*) || ' records in #TABLE_NAME' 
ELSE 'No gap or overlap found in #TABLE_NAME' END AS Message
FROM (SELECT row_key,row_id,source_id,effective_from,effective_to,sum(1) over (partition by row_id,source_id order by effective_from rows unbounded preceding) AS rownum FROM #TABLE_NAME) A,
(SELECT row_key,row_id,source_id,effective_from,effective_to,sum(1) over (partition by row_id,source_id order by effective_from rows unbounded preceding) AS rownum FROM #TABLE_NAME) B
WHERE A.row_id = B.row_id AND A.source_id = B.source_id AND A.rownum +1 = B.rownum
AND (B.effective_from > A.effective_to + interval '1 second' 
OR B.effective_from <  A.effective_to )