select demand_business_alignment,
sum(no_of_new_demands) as no_of_new_demands

from  #DWH_TABLE_SCHEMA.temp_demand_icube
group by demand_business_alignment
order by UPPER(demand_business_alignment)