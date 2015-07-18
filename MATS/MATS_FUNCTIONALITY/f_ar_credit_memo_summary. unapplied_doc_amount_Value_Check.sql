
SELECT
  CASE WHEN X.CNT = 0 THEN 'SUCCESS' ELSE 'FAIL' END AS RESULT
, CASE WHEN X.CNT = 0 THEN 'Tranformation check succeed for dwh_f_ar_credit_memo_summary.unapplied_doc_amount'
ELSE 'Tranformation check failed for dwh_f_ar_credit_memo_summary.unapplied_doc_amount' END AS MESSAGE
FROM
(
SELECT COUNT(1) CNT
FROM
(
SELECT credit_memo_summary_key,
(COALESCE(credit_memo_doc_amount,0) - COALESCE(applied_doc_amount,0)) unapplied_doc_amount
FROM <<tenant>>_mdwdb.dwh_f_ar_credit_memo_summary
GROUP BY credit_memo_summary_key
) A
LEFT JOIN
(	
SELECT credit_memo_summary_key, unapplied_doc_amount FROM
<<tenant>>_mdwdb.dwh_f_ar_credit_memo_summary
) B
ON A.credit_memo_summary_key = B.credit_memo_summary_key
AND A.unapplied_doc_amount = B.unapplied_doc_amount
WHERE B.credit_memo_summary_key IS NULL
) X
