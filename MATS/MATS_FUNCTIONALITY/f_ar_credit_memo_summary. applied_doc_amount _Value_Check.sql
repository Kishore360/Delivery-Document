
SELECT
  CASE WHEN X.CNT = 0 THEN 'SUCCESS' ELSE 'FAIL' END AS RESULT
, CASE WHEN X.CNT = 0 THEN 'Tranformation check succeed for dwh_f_ar_credit_memo_summary.applied_doc_amount'
ELSE 'Tranformation check failed for dwh_f_ar_credit_memo_summary.applied_doc_amount' END AS MESSAGE
FROM
(
SELECT COUNT(1) CNT
FROM
(	
SELECT credit_memo_summary_key, applied_doc_amount FROM
<<tenant>>_mdwdb.dwh_f_ar_credit_memo_summary
) B
LEFT JOIN
(
SELECT credit_memo_summary_key,
SUM(COALESCE(invoice_payment_doc_amount,0)) invoice_payment_doc_amount
FROM <<tenant>>_mdwdb.dwh_f_ar_credit_memo_application
GROUP BY credit_memo_summary_key
) A

ON A.credit_memo_summary_key = B.credit_memo_summary_key
AND A.invoice_payment_doc_amount = B.applied_doc_amount
WHERE A.credit_memo_summary_key IS NULL
) X
