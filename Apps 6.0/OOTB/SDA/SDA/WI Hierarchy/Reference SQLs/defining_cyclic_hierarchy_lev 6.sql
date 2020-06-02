drop table if exists sda_63_workdb.hier_data_temp;

create table if not exists sda_63_workdb.hier_data_temp (
  log_key int(15) DEFAULT NULL,
  sys_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_0_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_1_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_2_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_3_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_4_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_5_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_6_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  lev_7_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  is_cyclic_flag varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  sourceinstance bigint(20) NOT NULL DEFAULT 0,
  inserted_on datetime DEFAULT NULL
);

insert into sda_63_workdb.hier_data_temp
(log_key, sys_id, lev_0_id, lev_1_id, lev_2_id, lev_3_id, lev_4_id, lev_5_id, lev_6_id, lev_7_id, sourceinstance, inserted_on)

select tmp_lev1.log_key, CONCAT(tmp_lev1.child_id, '~WORK_ITEM') as sys_id, tmp_lev1.child_id lev_0_id, tmp_lev1.parent_id lev_1_id, tmp_lev2.parent_id lev_2_id, tmp_lev3.parent_id lev_3_id, 
tmp_lev4.parent_id lev_4_id, tmp_lev5.parent_id lev_5_id, tmp_lev6.parent_id lev_6_id, tmp_lev7.parent_id lev_7_id,
tmp_lev1.child_sourceinstance, current_timestamp as inserted_on
from sda_63_workdb.flat_hier_temp tmp_lev1
left join sda_63_workdb.flat_hier_temp tmp_lev2
on tmp_lev1.parent_id = tmp_lev2.child_id and tmp_lev1.invalid_flag = 'N' and tmp_lev2.invalid_flag = 'N'
left join sda_63_workdb.flat_hier_temp tmp_lev3
on tmp_lev2.parent_id = tmp_lev3.child_id and tmp_lev3.invalid_flag = 'N'
left join sda_63_workdb.flat_hier_temp tmp_lev4
on tmp_lev3.parent_id = tmp_lev4.child_id and tmp_lev4.invalid_flag = 'N'
left join sda_63_workdb.flat_hier_temp tmp_lev5
on tmp_lev4.parent_id = tmp_lev5.child_id and tmp_lev5.invalid_flag = 'N'
left join sda_63_workdb.flat_hier_temp tmp_lev6
on tmp_lev5.parent_id = tmp_lev6.child_id and tmp_lev6.invalid_flag = 'N'
left join sda_63_workdb.flat_hier_temp tmp_lev7
on tmp_lev6.parent_id = tmp_lev7.child_id and tmp_lev7.invalid_flag = 'N'
where tmp_lev1.invalid_flag = 'N'
order by tmp_lev1.log_key;

alter table sda_63_workdb.hier_data_temp
PRIMARY KEY (log_key, sourceinstance),
ADD INDEX first_idx (child_id,child_sourceinstance),
ADD INDEX second_idx (parent_id,parent_sourceinstance);


set @base_id := null, @parent_id := null, @cyclic_level := 0, @grandparent_id := null, @store_data := null;
update sda_63_workdb.hier_base hier_base
join (
select base.sys_id, base.sourceinstance, @base_id := base.lev_0_id, @parent_id := base.lev_1_id, @grandparent_id := base.lev_2_id,
@cyclic_level := 
case when @base_id = @parent_id and @base_id = @parent_id then 1
else case when @base_id = (@parent_id := base.lev_2_id) then 2
	 else case when @base_id = (@parent_id := base.lev_3_id) then 3
		  else case when @base_id = (@parent_id := base.lev_4_id) then 4
			   else case when @base_id = (@parent_id := base.lev_5_id) then 5
                    else case when @base_id = (@parent_id := base.lev_6_id) then 6
                         else case when @base_id = (@parent_id := base.lev_7_id) then 7
                               else 0 end
						 end
					end
			   end
		  end
	 end
end level_cycle

from sda_63_workdb.hier_data_temp base
) SQ
on SQ.sys_id = hier_base.sys_id and SQ.sourceinstance = hier_base.sourceinstance
set hier_base.is_cyclic_flag = 'Y', hier_base.cyclic_level = SQ.level_cycle;