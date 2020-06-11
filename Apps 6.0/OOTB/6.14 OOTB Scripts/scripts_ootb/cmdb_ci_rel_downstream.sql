drop table if exists #STG_TABLE_SCHEMA.ci_rel_downstream_temp;

create table if not exists #STG_TABLE_SCHEMA.ci_rel_downstream_temp 

select SRC_REL.*
from #MDS_TABLE_SCHEMA.cmdb_rel_ci_final SRC_REL
left join #MDS_TABLE_SCHEMA.cmdb_rel_type_final SRC_TYP
on SRC_REL.`type` = SRC_TYP.sys_id and SRC_REL.sourceinstance = SRC_TYP.sourceinstance
where SRC_REL.cdctype <> 'D' and
SRC_TYP.name in ('Depends on::Used by','Members::Member of','Contains::Contained by','Exchanges data with::Exchanges data with','In Rack::Rack contains');

drop table if exists #STG_TABLE_SCHEMA.ci_rel_downstream_base;

create table if not exists #STG_TABLE_SCHEMA.ci_rel_downstream_base (
  base_id INT AUTO_INCREMENT, 
  base_type varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  sys_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_0_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_1_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_2_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_3_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_4_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_5_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_6_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_0_rel_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_1_rel_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_2_rel_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_3_rel_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_4_rel_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_5_rel_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_6_rel_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  start_node_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  end_node_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` bigint(20) NOT NULL DEFAULT 0,
  path varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  behavior varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  is_cyclic_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  is_invalid_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  cyclic_level int(15) DEFAULT 0,
  from_cyclic_level int(15) DEFAULT 99,
  sourceinstance bigint(20) NOT NULL DEFAULT 0,
  created_on datetime DEFAULT NULL,
  inserted_on datetime DEFAULT NULL,
  PRIMARY KEY (base_id,sourceinstance),
  INDEX base_idx (sys_id,sourceinstance)
);

insert into #STG_TABLE_SCHEMA.ci_rel_downstream_base
(sys_id, lev_0_id, lev_1_id, lev_2_id, lev_3_id, lev_4_id, lev_5_id, lev_6_id, start_node_id,
lev_0_rel_id, lev_1_rel_id, lev_2_rel_id, lev_3_rel_id, lev_4_rel_id, lev_5_rel_id, path, sourceinstance, behavior, is_cyclic_flag, is_invalid_flag, created_on, inserted_on)

select SRC_REL_0.sys_id as sys_id, SRC_REL_0.child lev_0_id, SRC_REL_0.parent lev_1_id, SRC_REL_1.parent lev_2_id, SRC_REL_2.parent lev_3_id, SRC_REL_3.parent lev_4_id, SRC_REL_4.parent lev_5_id, SRC_REL_5.child lev_6_id, SRC_REL_0.child start_node_id, 
SRC_REL_0.`type` lev_0_rel_id, SRC_REL_1.`type` lev_1_rel_id, SRC_REL_2.`type` lev_2_rel_id, SRC_REL_3.`type` lev_3_rel_id, SRC_REL_4.`type` lev_4_rel_id, SRC_REL_5.`type` lev_5_rel_id,
concat(SRC_REL_0.child,'~',SRC_REL_0.`type`,'~',SRC_REL_0.parent,coalesce(concat('::',SRC_REL_1.child,'~',SRC_REL_1.`type`,'~',SRC_REL_1.parent,coalesce(concat('::',SRC_REL_2.child,'~',SRC_REL_2.`type`,'~',SRC_REL_2.parent,
coalesce(concat('::',SRC_REL_3.child,'~',SRC_REL_3.`type`,'~',SRC_REL_3.parent,coalesce(concat('::',SRC_REL_4.child,'~',SRC_REL_4.`type`,'~',SRC_REL_4.parent,
coalesce(concat('::',SRC_REL_5.child,'~',SRC_REL_5.`type`,'~',SRC_REL_5.parent),'')),'')),'')),'')),'')) as tot_path,
SRC_REL_0.sourceinstance,
'DOWNSTREAM' as behaviour,
'N' as is_cyclic_flag,
'N' as is_invalid_flag,
SRC_REL_0.sys_created_on, 
current_timestamp as inserted_on
from #STG_TABLE_SCHEMA.ci_rel_downstream_temp SRC_REL_0
left join #STG_TABLE_SCHEMA.ci_rel_downstream_temp SRC_REL_1
on SRC_REL_0.parent = SRC_REL_1.child
left join #STG_TABLE_SCHEMA.ci_rel_downstream_temp SRC_REL_2
on SRC_REL_1.parent = SRC_REL_2.child
left join #STG_TABLE_SCHEMA.ci_rel_downstream_temp SRC_REL_3
on SRC_REL_2.parent = SRC_REL_3.child
left join #STG_TABLE_SCHEMA.ci_rel_downstream_temp SRC_REL_4
on SRC_REL_3.parent = SRC_REL_4.child
left join #STG_TABLE_SCHEMA.ci_rel_downstream_temp SRC_REL_5
on SRC_REL_4.parent = SRC_REL_5.child
left join #MDS_TABLE_SCHEMA.cmdb_rel_type_final SRC_TYP_0
on SRC_REL_0.`type` = SRC_TYP_0.sys_id and SRC_REL_0.sourceinstance = SRC_TYP_0.sourceinstance
left join #MDS_TABLE_SCHEMA.cmdb_rel_type_final SRC_TYP_1
on SRC_REL_1.`type` = SRC_TYP_1.sys_id and SRC_REL_1.sourceinstance = SRC_TYP_1.sourceinstance
left join #MDS_TABLE_SCHEMA.cmdb_rel_type_final SRC_TYP_2
on SRC_REL_2.`type` = SRC_TYP_2.sys_id and SRC_REL_2.sourceinstance = SRC_TYP_2.sourceinstance
left join #MDS_TABLE_SCHEMA.cmdb_rel_type_final SRC_TYP_3
on SRC_REL_3.`type` = SRC_TYP_3.sys_id and SRC_REL_3.sourceinstance = SRC_TYP_3.sourceinstance
left join #MDS_TABLE_SCHEMA.cmdb_rel_type_final SRC_TYP_4
on SRC_REL_4.`type` = SRC_TYP_4.sys_id and SRC_REL_4.sourceinstance = SRC_TYP_4.sourceinstance
left join #MDS_TABLE_SCHEMA.cmdb_rel_type_final SRC_TYP_5
on SRC_REL_5.`type` = SRC_TYP_5.sys_id and SRC_REL_5.sourceinstance = SRC_TYP_5.sourceinstance
where SRC_TYP_0.name in ('Depends on::Used by','Members::Member of','Contains::Contained by','Exchanges data with::Exchanges data with','In Rack::Rack contains');

update #STG_TABLE_SCHEMA.ci_rel_downstream_base SRC
left join #DWH_TABLE_SCHEMA.d_application CI_APP
on CI_APP.row_id = concat('APPLICATION~', SRC.lev_0_id) and CI_APP.source_id = SRC.sourceinstance
left join #DWH_TABLE_SCHEMA.d_service CI_SRVC
on CI_SRVC.row_id = concat('BUSINESS_SERVICE~', SRC.lev_0_id) and CI_SRVC.source_id = SRC.sourceinstance
set SRC.base_type = case when CI_APP.row_key is not null then 'APPLICATION' when CI_SRVC.row_key is not null then 'BUSINESS_SERVICE' else 'OTHERS' end;

update #STG_TABLE_SCHEMA.ci_rel_downstream_base SRC
set is_invalid_flag = 'Y'
where base_type not in ('APPLICATION', 'BUSINESS_SERVICE');

use #STG_TABLE_SCHEMA;

delete SRC
from #STG_TABLE_SCHEMA.ci_rel_downstream_base SRC
where SRC.is_invalid_flag = 'Y';

-- base lev 0 --

update #STG_TABLE_SCHEMA.ci_rel_downstream_base base
join (
select ci_rel_base.base_id, ci_rel_base.sys_id, ci_rel_base.sourceinstance,
case 
when ci_rel_base.start_node_id = ci_rel_base.lev_2_id then 2
when ci_rel_base.start_node_id = ci_rel_base.lev_3_id then 3
when ci_rel_base.start_node_id = ci_rel_base.lev_4_id then 4
when ci_rel_base.start_node_id = ci_rel_base.lev_5_id then 5 end as cycle_level
from #STG_TABLE_SCHEMA.ci_rel_downstream_base ci_rel_base
) SQ
on base.base_id = SQ.base_id and base.sourceinstance = SQ.sourceinstance
set base.is_cyclic_flag = case when SQ.cycle_level > 0 then 'Y' else 'N' end, base.cyclic_level = SQ.cycle_level, base.from_cyclic_level = 0;

-- base lev 1 --

update #STG_TABLE_SCHEMA.ci_rel_downstream_base base
join (
select ci_rel_base.base_id, ci_rel_base.sys_id, ci_rel_base.sourceinstance,
case 
when ci_rel_base.lev_1_id = ci_rel_base.lev_3_id then 3
when ci_rel_base.lev_1_id = ci_rel_base.lev_4_id then 4
when ci_rel_base.lev_1_id = ci_rel_base.lev_5_id then 5 end as cycle_level
from #STG_TABLE_SCHEMA.ci_rel_downstream_base ci_rel_base
) SQ
on base.base_id = SQ.base_id and base.sourceinstance = SQ.sourceinstance
set base.is_cyclic_flag = case when base.is_cyclic_flag = 'Y' then 'Y' when SQ.cycle_level > 0 then 'Y' else 'N' end, 
base.cyclic_level = case when base.cyclic_level is null then SQ.cycle_level when SQ.cycle_level < base.cyclic_level then SQ.cycle_level else base.cyclic_level end, base.from_cyclic_level = 1;

-- base lev 2 --

update #STG_TABLE_SCHEMA.ci_rel_downstream_base base
join (
select ci_rel_base.base_id, ci_rel_base.sys_id, ci_rel_base.sourceinstance,
case 
when ci_rel_base.lev_2_id = ci_rel_base.lev_4_id then 4
when ci_rel_base.lev_2_id = ci_rel_base.lev_5_id then 5 end as cycle_level
from #STG_TABLE_SCHEMA.ci_rel_downstream_base ci_rel_base
) SQ
on base.base_id = SQ.base_id and base.sourceinstance = SQ.sourceinstance
set base.is_cyclic_flag = case when base.is_cyclic_flag = 'Y' then 'Y' when SQ.cycle_level > 0 then 'Y' else 'N' end, 
base.cyclic_level = case when base.cyclic_level is null then SQ.cycle_level when SQ.cycle_level < base.cyclic_level then SQ.cycle_level else base.cyclic_level end, base.from_cyclic_level = 2;

-- base lev 3 --

update #STG_TABLE_SCHEMA.ci_rel_downstream_base base
join (
select ci_rel_base.base_id, ci_rel_base.sys_id, ci_rel_base.sourceinstance,
case 
when ci_rel_base.lev_3_id = ci_rel_base.lev_5_id then 5 end as cycle_level
from #STG_TABLE_SCHEMA.ci_rel_downstream_base ci_rel_base
) SQ
on base.base_id = SQ.base_id and base.sourceinstance = SQ.sourceinstance
set base.is_cyclic_flag = case when base.is_cyclic_flag = 'Y' then 'Y' when SQ.cycle_level > 0 then 'Y' else 'N' end, 
base.cyclic_level = case when base.cyclic_level is null then SQ.cycle_level when SQ.cycle_level < base.cyclic_level then SQ.cycle_level else base.cyclic_level end, base.from_cyclic_level = 3;

-- Cyclic --
-- Lev 2 -- 
use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.ci_rel_downstream_base bs
set bs.lev_6_id = null, bs.lev_5_rel_id = null, bs.lev_5_id = null, bs.lev_4_rel_id = null, bs.lev_4_id = null, bs.lev_3_rel_id = null, bs.lev_3_id = null, bs.lev_2_rel_id = null, bs.lev_2_id = null, bs.lev_1_rel_id = null, bs.lev_1_id = null, bs.lev_0_rel_id = null, bs.inserted_on = current_timestamp
where bs.is_cyclic_flag = 'Y' and bs.cyclic_level = 1;

-- Lev 3 -- 
use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.ci_rel_downstream_base bs
set bs.lev_6_id = null, bs.lev_5_rel_id = null, bs.lev_5_id = null, bs.lev_4_rel_id = null, bs.lev_4_id = null, bs.lev_3_rel_id = null, bs.lev_3_id = null, bs.lev_2_rel_id = null, bs.lev_2_id = null, bs.lev_1_rel_id = null, bs.inserted_on = current_timestamp
where bs.is_cyclic_flag = 'Y' and bs.cyclic_level = 2;

-- Lev 4 -- 
use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.ci_rel_downstream_base bs
set bs.lev_6_id = null, bs.lev_5_rel_id = null, bs.lev_5_id = null, bs.lev_4_rel_id = null, bs.lev_4_id = null, bs.lev_3_rel_id = null, bs.lev_3_id = null, bs.lev_2_rel_id = null, bs.inserted_on = current_timestamp
where bs.is_cyclic_flag = 'Y' and bs.cyclic_level = 3;

-- Lev 5 -- 
use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.ci_rel_downstream_base bs
set bs.lev_6_id = null, bs.lev_5_rel_id = null, bs.lev_5_id = null, bs.lev_4_rel_id = null, bs.lev_4_id = null, bs.lev_3_rel_id = null, bs.inserted_on = current_timestamp
where bs.is_cyclic_flag = 'Y' and bs.cyclic_level = 4;

-- Lev 6 -- 
use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.ci_rel_downstream_base bs
set bs.lev_6_id = null, bs.lev_5_rel_id = null, bs.lev_5_id = null, bs.lev_4_rel_id = null, bs.inserted_on = current_timestamp
where bs.is_cyclic_flag = 'Y' and bs.cyclic_level = 5;

update #STG_TABLE_SCHEMA.ci_rel_downstream_base bs
set bs.end_node_id = case 
when bs.lev_2_id is null then bs.lev_1_id 
when bs.lev_3_id is null then bs.lev_2_id 
when bs.lev_4_id is null then bs.lev_3_id 
when bs.lev_5_id is null then bs.lev_4_id 
else bs.lev_5_id end;