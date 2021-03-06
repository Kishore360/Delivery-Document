SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM (SELECT count(1) as CNT
from cardinalhealth_mdwdb.f_enhancement_rm f  JOIN cardinalhealth_mdwdb.d_lov_map br  
ON f.status_rm_src_c_key= br.src_key AND br.dimension_wh_code IN ('OPEN') 
JOIN cardinalhealth_mdwdb.d_enhancement_rm_c a  ON a.row_id = f.row_id AND a.source_id = f.source_id 
JOIN cardinalhealth_mdwdb.d_o_data_freshness df ON f.source_id = df.source_id  WHERE 
f.business_days <> (SELECT 5 * ((DATEDIFF(df.lastupdated,a.opened_date) ) DIV 7) + 
MID('0123455501234445012333450122234501101234000123450', 7 * WEEKDAY(a.opened_date) + 
WEEKDAY(df.lastupdated) + 1, 1))+1)temp;
