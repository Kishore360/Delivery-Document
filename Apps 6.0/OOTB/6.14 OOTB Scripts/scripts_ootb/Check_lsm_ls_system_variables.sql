SELECT COALESCE(`name`,''),
    COALESCE(`column_value`,''),
    COALESCE(`class_value`,''),
    COALESCE(`enable_flag`,''),
    COALESCE(`is_customization`,''),
    COALESCE(`type`,''),
    COALESCE(`table_value`,''),
    COALESCE(`property`,'')
from #STAGE_TABLE_SCHEMA.lsm_ls_system_variables order by `name`,
    `column_value`,
    `class_value`,
    `enable_flag`,
    `is_customization`,
    `type`,
    `table_value`,
    `property`;
