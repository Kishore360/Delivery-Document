select case when count(1) >0  then 'Failure' else 'Success' end as Result , 
case when count(1) > 0 Then ' is_warranty_active flag is N,  for warranty_expiration_date populated' ELSE 'SUCCESS' END as Message
from <<tenant>>_mdwdb.f_asset SRC 
JOIN <<tenant>>_mdwdb.d_o_data_freshness TRGT
 on SRC.etl_run_number = TRGT.etl_run_number
 and SRC.source_id = TRGT.source_id 
 where  is_warranty_active = 'N'
and warranty_expiration_date is not null
and warranty_expiration_date >= lastupdated ;
