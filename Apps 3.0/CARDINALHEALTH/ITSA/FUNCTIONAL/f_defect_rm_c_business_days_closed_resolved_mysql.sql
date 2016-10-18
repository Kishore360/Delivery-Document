SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM cardinalhealth_mdwdb.f_defect_rm_c f JOIN cardinalhealth_mdwdb.d_lov_map br ON f.status_rm_src_c_key= br.src_key AND br.dimension_wh_code IN ('CLOSED','RESOLVED') JOIN cardinalhealth_mdwdb.d_defect_rm_c a  ON a.row_id = f.row_id AND a.source_id = f.source_id WHERE f.business_days <> (SELECT 5 * ((DATEDIFF(a.closed_date,a.opened_date) ) DIV 7) + MID('0123455501234445012333450122234501101234000123450', 7 * WEEKDAY(a.opened_date) + WEEKDAY(a.closed_date) + 1, 1))+1
	
