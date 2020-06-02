select  F.Application_Module,
F.TC_createdby_full,
case when sum(F.created_tc) = 0 then '' else cast(sum(F.created_tc) as varchar(50)) end  as created_tc,
case when sum(F.automated_tc) = 0 then '' else cast(sum(F.automated_tc) as varchar(50)) end  as automated_tc
from #DWH_TABLE_SCHEMA.test_case_icube_base F
group by  F.Application_Module,F.TC_createdby_full
order by  lower(F.Application_Module),F.TC_createdby_full