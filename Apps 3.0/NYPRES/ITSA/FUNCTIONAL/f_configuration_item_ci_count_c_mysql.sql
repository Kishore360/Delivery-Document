SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message 
from ((select count(distinct cmdb_ci)as cnt from nypres_mdsdb.cmdb_ci_final) src
 (select ci_count_c ci_count_c from nypres_mdwdb.f_configuration_item_c )trgt 
where src.cnt <>trgt.ci_count_c)a




