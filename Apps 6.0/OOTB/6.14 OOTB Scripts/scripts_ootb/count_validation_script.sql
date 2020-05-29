SELECT 
CASE WHEN  (EXP1.CNT=ACT.CNT) THEN 'SUCCESS' ELSE 'FAILURE' END AS Result
,CASE WHEN (EXP1.CNT=ACT.CNT) THEN 'Data Matched'
ELSE CONCAT( 'Base and TRGT RowCount did not Match for ', '#TABLE_NAME', '. BASE_TENANT:',EXP1.CNT,'TRGT_TENANT : ' ,ACT.CNT)
end as Message
from 
(select 'BASE_TENANT' as tenant,count(1) as CNT from #DWH_TABLE_SRC.#TABLE_NAME) EXP1
,
(select 'TRGT_TENANT' as tenant,count(1) as CNT from #DWH_TABLE_TRGT.#TABLE_NAME) ACT
