
SELECT
  CASE WHEN X.CNT = 0 THEN 'SUCCESS' ELSE 'FAIL' END AS RESULT
, CASE WHEN X.CNT = 0 THEN 'Tranformation check succeed for dwh_f_ar_credit_memo_summary.credit_memo_doc_amount'
ELSE 'Tranformation check succeed for dwh_f_ar_credit_memo_summary.credit_memo_doc_amount' END AS MESSAGE

FROM
(
SELECT COUNT(1) CNT
FROM
(
SELECT credit_memo_summary_key,
SUM(line_doc_amount + COALESCE(line_tax_doc_amount,0)) credit_memo_doc_amount
FROM <<tenant>>_mdwdb.dwh_f_ar_credit_memo_detail
GROUP BY credit_memo_summary_key
) A
LEFT JOIN
(	
SELECT credit_memo_summary_key, credit_memo_doc_amount FROM
<<tenant>>_mdwdb.dwh_f_ar_credit_memo_summary
) B
ON A.credit_memo_summary_key = B.credit_memo_summary_key
AND A.credit_memo_doc_amount = B.credit_memo_doc_amount
WHERE B.credit_memo_summary_key IS NULL
) X
