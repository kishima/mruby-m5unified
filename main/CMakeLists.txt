idf_component_register(
  SRCS mruby_main.c
  INCLUDE_DIRS .
  REQUIRES mruby_component esp_littlefs
  PRIV_REQUIRES nvs_flash
)

# littlefs_create_partition_image(storage ./storage FLASH_IN_PROJECT)