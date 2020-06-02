SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_major_incident.current_dates' ELSE 'current_dates-SUCCESS' END as Message
-- select SRC.sys_id,trgt.row_id, 

-- case when (trgt.etl_run_number = (select max(etl_run_number)from  #DWH_TABLE_SCHEMA.f_major_incident)) then SRC.lastupdated else SRC.lastupdated_1 end,trgt.current_dates
 from 
(
select 
c_apl.sys_id,
d_o.lastupdated , d_o_1.lastupdated as lastupdated_1
from #MDS_TABLE_SCHEMA.cmdb_ci_appl_final  c_apl
left join (select source_id, max(lastupdated) as lastupdated from  #DWH_TABLE_SCHEMA.d_o_data_freshness group by 1)d_o
on c_apl.sourceinstance=d_o.source_id

left join (
SELECT source_id, MAX(lastupdated) AS lastupdated
  FROM  #DWH_TABLE_SCHEMA.d_o_data_freshness
 WHERE lastupdated = (SELECT MAX(lastupdated) 
                 FROM #DWH_TABLE_SCHEMA.d_o_data_freshness
                 WHERE lastupdated < (SELECT MAX(lastupdated)
                 FROM #DWH_TABLE_SCHEMA.d_o_data_freshness)
                )) d_o_1
on c_apl.sourceinstance=d_o_1.source_id                
-- where c_apl.cdctype<>'D'
)SRC

left join (select * from #DWH_TABLE_SCHEMA.f_major_incident where soft_deleted_flag='N') trgt
on SRC.sys_id=trgt.row_id
where case when (trgt.etl_run_number = (select max(etl_run_number)from  #DWH_TABLE_SCHEMA.f_major_incident)) then SRC.lastupdated else SRC.lastupdated_1 end<>trgt.current_dates;
