
SELECT
  CASE WHEN X.CNT = 0 THEN 'SUCCESS' ELSE 'FAIL' END AS RESULT
, CASE WHEN X.CNT = 0 THEN 'Tranformation check success for dwh_f_ar_invoice_detail.invoice_doc_amount'
ELSE 'Tranformation check success for dwh_f_ar_invoice_detail.invoice_doc_amount' END AS MESSAGE

FROM
(
SELECT COUNT(1) CNT
FROM
(SELECT invoice_summary_key,
SUM(line_doc_amount + COALESCE(line_tax_doc_amount,0)) invoice_doc_amount
FROM workdb_release03032014.dwh_f_ar_invoice_detail
WHERE invoice_summary_key = 583
GROUP BY invoice_summary_key
) A
LEFT JOIN
(	
SELECT invoice_summary_key, invoice_doc_amount FROM
workdb_release03032014.dwh_f_ar_invoice
WHERE invoice_summary_key = 583
) B
ON A.invoice_summary_key = B.invoice_summary_key
AND A.invoice_doc_amount = B.invoice_doc_amount
WHERE B.invoice_summary_key IS NULL
) X
