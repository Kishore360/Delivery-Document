SELECT CASE WHEN count(1) > 1 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >1 THEN '#COL_NAME of #TABLE_NAME has differences between 5.1 & 6.0'
 ELSE 'SUCCESS' END as Message
from (
select distinct coalesce(TRGT.#COL_NAME,0)-coalesce(SRC.#COL_NAME,0) as diff from 
#DWH_TABLE_SRC.#TABLE_NAME SRC
join #DWH_TABLE_TRGT.#TABLE_NAME TRGT
on SRC.row_id=TRGT.row_id
where (coalesce(TRGT.#COL_NAME,0)-coalesce(SRC.#COL_NAME,0) )<>0
)A