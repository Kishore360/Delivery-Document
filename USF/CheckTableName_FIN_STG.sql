
SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
, CASE WHEN COUNT(1) > 0 THEN 'Some #COL_NAME are invalid in #TABLE_NAME' 
ELSE 'All #COL_NAME are valid in #TABLE_NAME' END AS Message 
FROM (
SELECT *
FROM #TABLE_SCHEMA.#TABLE_NAME LSM
WHERE #COL_NAME NOT IN ('dwh_d_ap_debit_memo_detail'
,'dwh_d_ap_debit_memo_summary'
,'dwh_d_ar_debit_memo_detail'
,'dwh_d_ar_debit_memo_summary'
,'dwh_d_gl_segment'
,'dwh_f_ap_debit_memo_detail'
,'dwh_f_ap_debit_memo_summary'
,'dwh_f_ar_debit_memo_detail'
,'dwh_f_ar_debit_memo_summary'
,'stg_ds_ap_debit_memo_summary'
,'stg_ds_ar_debit_memo_summary'
,'stg_ds_gl_segment'
,'stg_fs_ap_debit_memo_detail'
,'stg_fs_ap_debit_memo_summary'
,'stg_fs_ar_debit_memo_detail'
,'stg_fs_ar_debit_memo_summary','')

AND enable_flag <> 'N'AND CONCAT(CASE WHEN LSM.#COL_NAME LIKE 'd^_%' ESCAPE '^' THEN 'dwh'
WHEN LSM.#COL_NAME LIKE 'dh^_%' ESCAPE '^' THEN 'dwh'
WHEN LSM.#COL_NAME LIKE 'f^_%' ESCAPE '^' THEN 'dwh'
WHEN LSM.#COL_NAME LIKE 't^_%' ESCAPE '^' THEN 'dwh'
WHEN LSM.#COL_NAME LIKE 's^_%' ESCAPE '^' THEN 'dwh'
ELSE 'stg' END ,'_',LSM.#COL_NAME) COLLATE utf8_unicode_ci
not in
(select ISch.table_name COLLATE utf8_unicode_ci
from information_schema.tables ISch
where ISch.table_schema = '#TABLE_SCHEMA')) R
