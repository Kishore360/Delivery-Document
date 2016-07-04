select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_#TYPE.application_key' ELSE 'SUCCESS' END as Message
from <<tenant>>_mdsdb.#TYPE_final SRC
left join <<tenant>>_mdwdb.f_#TYPE TGT
on SRC.sys_id = TGT.row_id
left join <<tenant>>_mdwdb.d_application LKP
on CONCAT('APPLICATION~',SRC.cmdb_ci) = LKP.row_id
where TGT.application_key <> LKP.row_key
and TGT.row_key not in (0,-1)
