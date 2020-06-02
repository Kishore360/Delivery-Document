select int_cont.full_name as Resource,emp_type.employment_type,d_skill.skill_name as Resourece_skill,
prim_skill.skill_name as Resource_primary_skill,res_skill.interest_level as Interest_Level,
res_skill.proficiency_level as Proficiency_Level, res_skill.weight as Weight
from (select * from	#DWH_TABLE_SCHEMA.f_resource_skill)res_skill
left outer join(select * from #DWH_TABLE_SCHEMA.d_internal_contact)int_cont
	  on 	res_skill.resource_key = int_cont.row_key
left outer join(select * from #DWH_TABLE_SCHEMA.d_resource_skill)d_skill
	  on res_skill.resource_skill_key = d_skill.row_key
left outer join(select * from #DWH_TABLE_SCHEMA.d_resource_skill)prim_skill
on int_cont.primary_skill_key=prim_skill.row_key
left outer join 
(select src_lov.row_key, src_lov.dimension_name as employment_type
from #DWH_TABLE_SCHEMA.d_lov src_lov
join #DWH_TABLE_SCHEMA.d_lov_map wh_map
on src_lov.row_key = wh_map.src_key
join  #DWH_TABLE_SCHEMA.d_lov wh_lov
on wh_map.wh_key=wh_lov.row_key
where src_lov.dimension_class = 'Employee~Employment_Type') emp_type
on emp_type.row_key=int_cont.employment_type_src_key