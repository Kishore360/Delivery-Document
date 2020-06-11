select 'ALL' as module,T.name tablename,C.name columnname,coalesce(T2.scdtype,'FACT') table_scd_capable
,case when T.name like 'f%' then 'FACT' else case when T3.name is not null then 'SCD2' else 'SCD1' end  end as table_scd_enable
,C.scdbehaviour columnscd,'Y' as enabled
from target_physicalcolumn C
join target_physicaltable T
on(C.physicaltable_id=T.target_physicaltable_parent_id)
left join (select GT.name, 
	case when group_concat(coalesce(scdbehaviour,'')) like '%TRIGGERSCD%' then 'SCD2' else 'SCD1' end as scdtype
	from target_physicalcolumn GC
    join target_physicaltable GT
    on(GC.physicaltable_id=GT.target_physicaltable_parent_id)
    where GT.name like 'd^_%' escape '^' 
    group by GT.name) T2
on(T2.name=T.name)
left join (select GT.name
	from target_physicalcolumn GC
    join target_physicaltable GT
    on(GC.physicaltable_id=GT.target_physicaltable_parent_id)
    where GT.name like 'd^_%' escape '^' and GC.name ='effective_from' ) T3
on(T3.name=T.name)
where (T.name like 'd%' or T.name like 'f%');