SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.failure_flag' 
ELSE 'SUCCESS' END as Message 
from wpl_mdwdb.d_change_request d_cr 
join wpl_mdwdb.f_change_request f_cr 
on d_cr.row_key=f_cr.change_request_key
join wpl_mdwdb.d_lov br on 
f_cr.implementation_result_src_c_key = br.row_key
and f_cr.source_id =br.source_id 
where (case when br.dimension_class ='U_IMPLEMENTATION_RESULT~CHANGE_REQUEST'
and br.dimension_name in('Implemented - With error / issue','Implemented - With error / issue',
'Implemented Partially','Not Implemented')  then 'Y' else 'N' end)<>d_cr.failure_flag;