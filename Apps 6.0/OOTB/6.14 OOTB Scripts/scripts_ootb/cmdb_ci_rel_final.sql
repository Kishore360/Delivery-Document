drop table if exists #STG_TABLE_SCHEMA.ci_rel_last;

create table if not exists #STG_TABLE_SCHEMA.ci_rel_last (
  base_key varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  base_type varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL, 
  row_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_0_key int(15) COLLATE utf8_unicode_ci DEFAULT -1,
  lev_1_key int(15) COLLATE utf8_unicode_ci DEFAULT -1,
  lev_2_key int(15) COLLATE utf8_unicode_ci DEFAULT -1,
  lev_3_key int(15) COLLATE utf8_unicode_ci DEFAULT -1,
  lev_4_key int(15) COLLATE utf8_unicode_ci DEFAULT -1,
  lev_5_key int(15) COLLATE utf8_unicode_ci DEFAULT -1,
  lev_6_key int(15) COLLATE utf8_unicode_ci DEFAULT -1,
  lev_0_rel_key int(15) COLLATE utf8_unicode_ci DEFAULT -1,
  lev_1_rel_key int(15) COLLATE utf8_unicode_ci DEFAULT -1,
  lev_2_rel_key int(15) COLLATE utf8_unicode_ci DEFAULT -1,
  lev_3_rel_key int(15) COLLATE utf8_unicode_ci DEFAULT -1,
  lev_4_rel_key int(15) COLLATE utf8_unicode_ci DEFAULT -1,
  lev_5_rel_key int(15) COLLATE utf8_unicode_ci DEFAULT -1,
  lev_6_rel_key int(15) COLLATE utf8_unicode_ci DEFAULT -1,
  start_node_key int(15) COLLATE utf8_unicode_ci DEFAULT -1,
  end_node_key int(15) COLLATE utf8_unicode_ci DEFAULT -1,
  `level` bigint(20) NOT NULL DEFAULT 0,
  path varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  behavior varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  source_id bigint(20) NOT NULL DEFAULT 0,
  created_on datetime DEFAULT NULL,
  inserted_on datetime DEFAULT NULL
);

insert into #STG_TABLE_SCHEMA.ci_rel_last
(base_key, base_type, row_id, lev_0_key, lev_1_key, lev_2_key, lev_3_key, lev_4_key, lev_5_key, lev_0_rel_key, lev_1_rel_key, lev_2_rel_key, lev_3_rel_key, lev_4_rel_key, lev_5_rel_key, start_node_key, end_node_key, behavior, source_id, created_on, inserted_on)

select 
BASE.base_id, BASE.base_type, BASE.sys_id, coalesce(CI_LEV_0.row_key, -1) as lev_0_key, coalesce(CI_LEV_1.row_key, -1) as lev_1_key, coalesce(CI_LEV_2.row_key, -1) as lev_2_key, coalesce(CI_LEV_3.row_key, -1) as lev_3_key, coalesce(CI_LEV_4.row_key, -1) as lev_4_key, coalesce(CI_LEV_5.row_key, -1) as lev_5_key, coalesce(CI_REL_LEV_0.row_key, -1) as lev_0_rel_key, coalesce(CI_REL_LEV_1.row_key, -1) as lev_1_rel_key, coalesce(CI_REL_LEV_2.row_key, -1) as lev_2_rel_key, coalesce(CI_REL_LEV_3.row_key, -1) as lev_3_rel_key, coalesce(CI_REL_LEV_4.row_key, -1) as lev_4_rel_key, coalesce(CI_REL_LEV_5.row_key, -1) as lev_5_rel_key, coalesce(CI_STRTD_ON.row_key, -1) as start_node_key, coalesce(CI_END_ON.row_key, -1) as end_node_key, BASE.behavior, BASE.sourceinstance, BASE.created_on, current_timestamp as inserted_on
from #STG_TABLE_SCHEMA.ci_rel_upstream_base BASE
left join #DWH_TABLE_SCHEMA.d_configuration_item CI_LEV_0
on CI_LEV_0.row_id = BASE.lev_0_id and CI_LEV_0.source_id = BASE.sourceinstance
left join #DWH_TABLE_SCHEMA.d_configuration_item CI_LEV_1
on CI_LEV_1.row_id = BASE.lev_1_id and CI_LEV_1.source_id = BASE.sourceinstance
left join #DWH_TABLE_SCHEMA.d_configuration_item CI_LEV_2
on CI_LEV_2.row_id = BASE.lev_2_id and CI_LEV_2.source_id = BASE.sourceinstance
left join #DWH_TABLE_SCHEMA.d_configuration_item CI_LEV_3
on CI_LEV_3.row_id = BASE.lev_3_id and CI_LEV_3.source_id = BASE.sourceinstance
left join #DWH_TABLE_SCHEMA.d_configuration_item CI_LEV_4
on CI_LEV_4.row_id = BASE.lev_4_id and CI_LEV_4.source_id = BASE.sourceinstance
left join #DWH_TABLE_SCHEMA.d_configuration_item CI_LEV_5
on CI_LEV_5.row_id = BASE.lev_5_id and CI_LEV_5.source_id = BASE.sourceinstance
left join #DWH_TABLE_SCHEMA.d_configuration_item CI_STRTD_ON
on CI_STRTD_ON.row_id = BASE.start_node_id and CI_STRTD_ON.source_id = BASE.sourceinstance
left join #DWH_TABLE_SCHEMA.d_configuration_item CI_END_ON
on CI_END_ON.row_id = BASE.end_node_id and CI_END_ON.source_id = BASE.sourceinstance
left join #DWH_TABLE_SCHEMA.d_relationship_type CI_REL_LEV_0
on CI_REL_LEV_0.row_id = BASE.lev_0_rel_id and CI_REL_LEV_0.source_id = BASE.sourceinstance
left join #DWH_TABLE_SCHEMA.d_relationship_type CI_REL_LEV_1
on CI_REL_LEV_1.row_id = BASE.lev_1_rel_id and CI_REL_LEV_1.source_id = BASE.sourceinstance
left join #DWH_TABLE_SCHEMA.d_relationship_type CI_REL_LEV_2
on CI_REL_LEV_2.row_id = BASE.lev_2_rel_id and CI_REL_LEV_2.source_id = BASE.sourceinstance
left join #DWH_TABLE_SCHEMA.d_relationship_type CI_REL_LEV_3
on CI_REL_LEV_3.row_id = BASE.lev_3_rel_id and CI_REL_LEV_3.source_id = BASE.sourceinstance
left join #DWH_TABLE_SCHEMA.d_relationship_type CI_REL_LEV_4
on CI_REL_LEV_4.row_id = BASE.lev_4_rel_id and CI_REL_LEV_4.source_id = BASE.sourceinstance
left join #DWH_TABLE_SCHEMA.d_relationship_type CI_REL_LEV_5
on CI_REL_LEV_5.row_id = BASE.lev_5_rel_id and CI_REL_LEV_5.source_id = BASE.sourceinstance
where BASE.is_invalid_flag = 'N';

insert into #STG_TABLE_SCHEMA.ci_rel_last
(base_key, base_type, row_id, lev_0_key, lev_1_key, lev_2_key, lev_3_key, lev_4_key, lev_5_key, lev_0_rel_key, lev_1_rel_key, lev_2_rel_key, lev_3_rel_key, lev_4_rel_key, lev_5_rel_key, start_node_key, end_node_key, behavior, source_id, created_on, inserted_on)

select 
BASE.base_id, BASE.base_type, BASE.sys_id, coalesce(CI_LEV_0.row_key, -1) as lev_0_key, coalesce(CI_LEV_1.row_key, -1) as lev_1_key, coalesce(CI_LEV_2.row_key, -1) as lev_2_key, coalesce(CI_LEV_3.row_key, -1) as lev_3_key, coalesce(CI_LEV_4.row_key, -1) as lev_4_key, coalesce(CI_LEV_5.row_key, -1) as lev_5_key, coalesce(CI_REL_LEV_0.row_key, -1) as lev_0_rel_key, coalesce(CI_REL_LEV_1.row_key, -1) as lev_1_rel_key, coalesce(CI_REL_LEV_2.row_key, -1) as lev_2_rel_key, coalesce(CI_REL_LEV_3.row_key, -1) as lev_3_rel_key, coalesce(CI_REL_LEV_4.row_key, -1) as lev_4_rel_key, coalesce(CI_REL_LEV_5.row_key, -1) as lev_5_rel_key, coalesce(CI_STRTD_ON.row_key, -1) as start_node_key, coalesce(CI_END_ON.row_key, -1) as end_node_key, BASE.behavior, BASE.sourceinstance, BASE.created_on, current_timestamp as inserted_on
from #STG_TABLE_SCHEMA.ci_rel_downstream_base BASE
left join #DWH_TABLE_SCHEMA.d_configuration_item CI_LEV_0
on CI_LEV_0.row_id = BASE.lev_0_id and CI_LEV_0.source_id = BASE.sourceinstance
left join #DWH_TABLE_SCHEMA.d_configuration_item CI_LEV_1
on CI_LEV_1.row_id = BASE.lev_1_id and CI_LEV_1.source_id = BASE.sourceinstance
left join #DWH_TABLE_SCHEMA.d_configuration_item CI_LEV_2
on CI_LEV_2.row_id = BASE.lev_2_id and CI_LEV_2.source_id = BASE.sourceinstance
left join #DWH_TABLE_SCHEMA.d_configuration_item CI_LEV_3
on CI_LEV_3.row_id = BASE.lev_3_id and CI_LEV_3.source_id = BASE.sourceinstance
left join #DWH_TABLE_SCHEMA.d_configuration_item CI_LEV_4
on CI_LEV_4.row_id = BASE.lev_4_id and CI_LEV_4.source_id = BASE.sourceinstance
left join #DWH_TABLE_SCHEMA.d_configuration_item CI_LEV_5
on CI_LEV_5.row_id = BASE.lev_5_id and CI_LEV_5.source_id = BASE.sourceinstance
left join #DWH_TABLE_SCHEMA.d_configuration_item CI_STRTD_ON
on CI_STRTD_ON.row_id = BASE.start_node_id and CI_STRTD_ON.source_id = BASE.sourceinstance
left join #DWH_TABLE_SCHEMA.d_configuration_item CI_END_ON
on CI_END_ON.row_id = BASE.end_node_id and CI_END_ON.source_id = BASE.sourceinstance
left join #DWH_TABLE_SCHEMA.d_relationship_type CI_REL_LEV_0
on CI_REL_LEV_0.row_id = BASE.lev_0_rel_id and CI_REL_LEV_0.source_id = BASE.sourceinstance
left join #DWH_TABLE_SCHEMA.d_relationship_type CI_REL_LEV_1
on CI_REL_LEV_1.row_id = BASE.lev_1_rel_id and CI_REL_LEV_1.source_id = BASE.sourceinstance
left join #DWH_TABLE_SCHEMA.d_relationship_type CI_REL_LEV_2
on CI_REL_LEV_2.row_id = BASE.lev_2_rel_id and CI_REL_LEV_2.source_id = BASE.sourceinstance
left join #DWH_TABLE_SCHEMA.d_relationship_type CI_REL_LEV_3
on CI_REL_LEV_3.row_id = BASE.lev_3_rel_id and CI_REL_LEV_3.source_id = BASE.sourceinstance
left join #DWH_TABLE_SCHEMA.d_relationship_type CI_REL_LEV_4
on CI_REL_LEV_4.row_id = BASE.lev_4_rel_id and CI_REL_LEV_4.source_id = BASE.sourceinstance
left join #DWH_TABLE_SCHEMA.d_relationship_type CI_REL_LEV_5
on CI_REL_LEV_5.row_id = BASE.lev_5_rel_id and CI_REL_LEV_5.source_id = BASE.sourceinstance
where BASE.is_invalid_flag = 'N';

update #STG_TABLE_SCHEMA.ci_rel_last base
set base.end_node_key = case when base.lev_5_key <> -1 then base.lev_5_key
when base.lev_4_key <> -1 and base.lev_5_key = -1 then base.lev_4_key
when base.lev_3_key <> -1 and base.lev_4_key = -1 and base.lev_5_key = -1 then base.lev_3_key
when base.lev_2_key <> -1 and base.lev_3_key = -1 and base.lev_4_key = -1 and base.lev_5_key = -1 then base.lev_2_key
when base.lev_1_key <> -1 and base.lev_2_key = -1 and base.lev_3_key = -1 and base.lev_4_key = -1 and base.lev_5_key = -1 then base.lev_1_key end
where base.end_node_key = -1;

insert into #STG_TABLE_SCHEMA.ci_rel_last
(start_node_key, behavior, lev_0_key, lev_1_key, lev_2_key, lev_3_key, lev_4_key, lev_5_key, 
lev_0_rel_key, lev_1_rel_key, lev_2_rel_key, lev_3_rel_key, lev_4_rel_key, lev_5_rel_key, end_node_key, source_id, created_on, inserted_on, row_id)

select start_node_key, behavior, lev_0_key, lev_1_key, lev_2_key, lev_3_key, lev_4_key, -1 as lev_5_key,
lev_0_rel_key, lev_1_rel_key, lev_2_rel_key, lev_3_rel_key, -1 as lev_4_rel_key, -1 as lev_5_rel_key, lev_4_key as end_node_key,
source_id, created_on, current_timestamp as inserted_on, row_id
from (
select distinct start_node_key, behavior, lev_0_key, lev_1_key, lev_2_key, lev_3_key, lev_4_key, lev_5_key, lev_6_key,
lev_0_rel_key, lev_1_rel_key, lev_2_rel_key, lev_3_rel_key, lev_4_rel_key, lev_5_rel_key, lev_6_rel_key, end_node_key,
source_id, created_on, row_id
from #STG_TABLE_SCHEMA.ci_rel_last
where lev_5_key <> -1 and lev_6_key = -1 
) SQ;

insert into #STG_TABLE_SCHEMA.ci_rel_last
(start_node_key, behavior, lev_0_key, lev_1_key, lev_2_key, lev_3_key, lev_4_key, lev_5_key, 
lev_0_rel_key, lev_1_rel_key, lev_2_rel_key, lev_3_rel_key, lev_4_rel_key, lev_5_rel_key, end_node_key, source_id, created_on, inserted_on, row_id)

select start_node_key, behavior, lev_0_key, lev_1_key, lev_2_key, lev_3_key, -1 as lev_4_key, -1 as lev_5_key,
lev_0_rel_key, lev_1_rel_key, lev_2_rel_key, -1 as lev_3_rel_key, -1 as lev_4_rel_key, -1 as lev_5_rel_key, lev_3_key as end_node_key,
source_id, created_on, current_timestamp as inserted_on, row_id
from (
select distinct start_node_key, behavior, lev_0_key, lev_1_key, lev_2_key, lev_3_key, lev_4_key, lev_5_key, lev_6_key,
lev_0_rel_key, lev_1_rel_key, lev_2_rel_key, lev_3_rel_key, lev_4_rel_key, lev_5_rel_key, lev_6_rel_key, end_node_key,
source_id, created_on, row_id
from #STG_TABLE_SCHEMA.ci_rel_last
where lev_4_key <> -1 and lev_5_key = -1
) SQ;

insert into #STG_TABLE_SCHEMA.ci_rel_last
(start_node_key, behavior, lev_0_key, lev_1_key, lev_2_key, lev_3_key, lev_4_key, lev_5_key, 
lev_0_rel_key, lev_1_rel_key, lev_2_rel_key, lev_3_rel_key, lev_4_rel_key, lev_5_rel_key, end_node_key, source_id, created_on, inserted_on, row_id)

select start_node_key, behavior, lev_0_key, lev_1_key, lev_2_key, -1 as lev_3_key, -1 as lev_4_key, -1 as lev_5_key,
lev_0_rel_key, lev_1_rel_key, -1 as lev_2_rel_key, -1 as lev_3_rel_key, -1 as lev_4_rel_key, -1 as lev_5_rel_key, lev_2_key as end_node_key,
source_id, created_on, current_timestamp as inserted_on, row_id
from (
select distinct start_node_key, behavior, lev_0_key, lev_1_key, lev_2_key, lev_3_key, lev_4_key, lev_5_key, lev_6_key,
lev_0_rel_key, lev_1_rel_key, lev_2_rel_key, lev_3_rel_key, lev_4_rel_key, lev_5_rel_key, lev_6_rel_key, end_node_key,
source_id, created_on, row_id
from #STG_TABLE_SCHEMA.ci_rel_last
where lev_3_key <> -1 and lev_4_key = -1 and lev_5_key = -1
) SQ;

insert into #STG_TABLE_SCHEMA.ci_rel_last
(start_node_key, behavior, lev_0_key, lev_1_key, lev_2_key, lev_3_key, lev_4_key, lev_5_key, 
lev_0_rel_key, lev_1_rel_key, lev_2_rel_key, lev_3_rel_key, lev_4_rel_key, lev_5_rel_key, end_node_key, source_id, created_on, inserted_on, row_id)

select start_node_key, behavior, lev_0_key, lev_1_key, -1 as lev_2_key, -1 as lev_3_key, -1 as lev_4_key, -1 as lev_5_key,
lev_0_rel_key, -1 as lev_1_rel_key, -1 as lev_2_rel_key, -1 as lev_3_rel_key, -1 as lev_4_rel_key, -1 as lev_5_rel_key, lev_1_key as end_node_key,
source_id, created_on, current_timestamp as inserted_on, row_id
from (
select distinct start_node_key, behavior, lev_0_key, lev_1_key, lev_2_key, lev_3_key, lev_4_key, lev_5_key, lev_6_key,
lev_0_rel_key, lev_1_rel_key, lev_2_rel_key, lev_3_rel_key, lev_4_rel_key, lev_5_rel_key, lev_6_rel_key, end_node_key,
source_id, created_on, row_id
from #STG_TABLE_SCHEMA.ci_rel_last
where lev_2_key <> -1 and lev_3_key = -1 and lev_4_key = -1 and lev_5_key = -1
) SQ;

update cmdbci_rel_workdb.ci_rel_last BASE
set BASE.lev_1_rel_key = -1
where BASE.lev_2_key = -1 and BASE.lev_1_rel_key <> -1;

update cmdbci_rel_workdb.ci_rel_last BASE
set BASE.lev_2_rel_key = -1
where BASE.lev_3_key = -1 and BASE.lev_2_rel_key <> -1;

update cmdbci_rel_workdb.ci_rel_last BASE
set BASE.lev_3_rel_key = -1
where BASE.lev_4_key = -1 and BASE.lev_3_rel_key <> -1;

update cmdbci_rel_workdb.ci_rel_last BASE
set BASE.lev_4_rel_key = -1
where BASE.lev_5_key = -1 and BASE.lev_4_rel_key <> -1;

update #STG_TABLE_SCHEMA.ci_rel_last BASE
left join #DWH_TABLE_SCHEMA.d_configuration_item CI_LEV_0
on CI_LEV_0.row_key = BASE.lev_0_key and CI_LEV_0.source_id = BASE.source_id
left join #DWH_TABLE_SCHEMA.d_configuration_item CI_LEV_1
on CI_LEV_1.row_key = BASE.lev_1_key and CI_LEV_1.source_id = BASE.source_id
left join #DWH_TABLE_SCHEMA.d_configuration_item CI_LEV_2
on CI_LEV_2.row_key = BASE.lev_2_key and CI_LEV_2.source_id = BASE.source_id
left join #DWH_TABLE_SCHEMA.d_configuration_item CI_LEV_3
on CI_LEV_3.row_key = BASE.lev_3_key and CI_LEV_3.source_id = BASE.source_id
left join #DWH_TABLE_SCHEMA.d_configuration_item CI_LEV_4
on CI_LEV_4.row_key = BASE.lev_4_key and CI_LEV_4.source_id = BASE.source_id
left join #DWH_TABLE_SCHEMA.d_configuration_item CI_LEV_5
on CI_LEV_5.row_key = BASE.lev_5_key and CI_LEV_5.source_id = BASE.source_id
left join #DWH_TABLE_SCHEMA.d_configuration_item CI_STRTD_ON
on CI_STRTD_ON.row_key = BASE.start_node_key and CI_STRTD_ON.source_id = BASE.source_id
left join #DWH_TABLE_SCHEMA.d_configuration_item CI_END_ON
on CI_END_ON.row_key = BASE.end_node_key and CI_END_ON.source_id = BASE.source_id
left join #DWH_TABLE_SCHEMA.d_relationship_type CI_REL_LEV_0
on CI_REL_LEV_0.row_key = BASE.lev_0_rel_key and CI_REL_LEV_0.source_id = BASE.source_id
left join #DWH_TABLE_SCHEMA.d_relationship_type CI_REL_LEV_1
on CI_REL_LEV_1.row_key = BASE.lev_1_rel_key and CI_REL_LEV_1.source_id = BASE.source_id
left join #DWH_TABLE_SCHEMA.d_relationship_type CI_REL_LEV_2
on CI_REL_LEV_2.row_key = BASE.lev_2_rel_key and CI_REL_LEV_2.source_id = BASE.source_id
left join #DWH_TABLE_SCHEMA.d_relationship_type CI_REL_LEV_3
on CI_REL_LEV_3.row_key = BASE.lev_3_rel_key and CI_REL_LEV_3.source_id = BASE.source_id
left join #DWH_TABLE_SCHEMA.d_relationship_type CI_REL_LEV_4
on CI_REL_LEV_4.row_key = BASE.lev_4_rel_key and CI_REL_LEV_4.source_id = BASE.source_id
left join #DWH_TABLE_SCHEMA.d_relationship_type CI_REL_LEV_5
on CI_REL_LEV_5.row_key = BASE.lev_5_rel_key and CI_REL_LEV_5.source_id = BASE.source_id

set path = concat(CI_STRTD_ON.name, ':', CI_REL_LEV_0.parent_descriptor, '::', CI_LEV_1.name, coalesce(concat(':', CI_REL_LEV_1.parent_descriptor, '::', CI_LEV_2.name, coalesce(concat(':', CI_REL_LEV_2.parent_descriptor, '::', CI_LEV_3.name, coalesce(concat(':', CI_REL_LEV_3.parent_descriptor, '::', CI_LEV_4.name, coalesce(concat(':', CI_REL_LEV_4.parent_descriptor, '::', CI_LEV_5.name), '')), '')), '')), ''))
where BASE.behavior = 'UPSTREAM';

update #STG_TABLE_SCHEMA.ci_rel_last BASE
left join #DWH_TABLE_SCHEMA.d_configuration_item CI_LEV_0
on CI_LEV_0.row_key = BASE.lev_0_key and CI_LEV_0.source_id = BASE.source_id
left join #DWH_TABLE_SCHEMA.d_configuration_item CI_LEV_1
on CI_LEV_1.row_key = BASE.lev_1_key and CI_LEV_1.source_id = BASE.source_id
left join #DWH_TABLE_SCHEMA.d_configuration_item CI_LEV_2
on CI_LEV_2.row_key = BASE.lev_2_key and CI_LEV_2.source_id = BASE.source_id
left join #DWH_TABLE_SCHEMA.d_configuration_item CI_LEV_3
on CI_LEV_3.row_key = BASE.lev_3_key and CI_LEV_3.source_id = BASE.source_id
left join #DWH_TABLE_SCHEMA.d_configuration_item CI_LEV_4
on CI_LEV_4.row_key = BASE.lev_4_key and CI_LEV_4.source_id = BASE.source_id
left join #DWH_TABLE_SCHEMA.d_configuration_item CI_LEV_5
on CI_LEV_5.row_key = BASE.lev_5_key and CI_LEV_5.source_id = BASE.source_id
left join #DWH_TABLE_SCHEMA.d_configuration_item CI_STRTD_ON
on CI_STRTD_ON.row_key = BASE.start_node_key and CI_STRTD_ON.source_id = BASE.source_id
left join #DWH_TABLE_SCHEMA.d_configuration_item CI_END_ON
on CI_END_ON.row_key = BASE.end_node_key and CI_END_ON.source_id = BASE.source_id
left join #DWH_TABLE_SCHEMA.d_relationship_type CI_REL_LEV_0
on CI_REL_LEV_0.row_key = BASE.lev_0_rel_key and CI_REL_LEV_0.source_id = BASE.source_id
left join #DWH_TABLE_SCHEMA.d_relationship_type CI_REL_LEV_1
on CI_REL_LEV_1.row_key = BASE.lev_1_rel_key and CI_REL_LEV_1.source_id = BASE.source_id
left join #DWH_TABLE_SCHEMA.d_relationship_type CI_REL_LEV_2
on CI_REL_LEV_2.row_key = BASE.lev_2_rel_key and CI_REL_LEV_2.source_id = BASE.source_id
left join #DWH_TABLE_SCHEMA.d_relationship_type CI_REL_LEV_3
on CI_REL_LEV_3.row_key = BASE.lev_3_rel_key and CI_REL_LEV_3.source_id = BASE.source_id
left join #DWH_TABLE_SCHEMA.d_relationship_type CI_REL_LEV_4
on CI_REL_LEV_4.row_key = BASE.lev_4_rel_key and CI_REL_LEV_4.source_id = BASE.source_id
left join #DWH_TABLE_SCHEMA.d_relationship_type CI_REL_LEV_5
on CI_REL_LEV_5.row_key = BASE.lev_5_rel_key and CI_REL_LEV_5.source_id = BASE.source_id

set path = concat(CI_STRTD_ON.name, ':', CI_REL_LEV_0.child_descriptor, '::', CI_LEV_1.name, coalesce(concat(':', CI_REL_LEV_1.child_descriptor, '::', CI_LEV_2.name, coalesce(concat(':', CI_REL_LEV_2.child_descriptor, '::', CI_LEV_3.name, coalesce(concat(':', CI_REL_LEV_3.child_descriptor, '::', CI_LEV_4.name, coalesce(concat(':', CI_REL_LEV_4.child_descriptor, '::', CI_LEV_5.name), '')), '')), '')), ''))
where BASE.behavior = 'DOWNSTREAM';

use #STG_TABLE_SCHEMA;

delete SRC
from #STG_TABLE_SCHEMA.ci_rel_last SRC
where SRC.lev_1_key = -1;

drop table if exists #STG_TABLE_SCHEMA.ci_rel_final_base;

create table if not exists #STG_TABLE_SCHEMA.ci_rel_final_base
select distinct start_node_key, behavior, lev_1_key, lev_2_key, lev_3_key, lev_4_key, lev_5_key, 
lev_0_rel_key, lev_1_rel_key, lev_2_rel_key, lev_3_rel_key, lev_4_rel_key, end_node_key, source_id, row_id, path
from #STG_TABLE_SCHEMA.ci_rel_last;