# Original file from: https://github.com/mruby-esp32/mruby-esp32/blob/master/components/mruby_component/esp32_build_config.rb
# Copyright (c) 2016 Carson McDonald
# Licensed under the MIT License

MRuby::Build.new do |conf|
  toolchain :gcc

  [conf.cc, conf.objc, conf.asm].each do |cc|
    cc.command = 'gcc'
    cc.flags = [%w(-g -std=gnu99 -O3 -Wall -Werror-implicit-function-declaration -Wdeclaration-after-statement -Wwrite-strings)]
  end

  [conf.cxx].each do |cxx|
    cxx.command = 'g++'
    cxx.flags = [%w(-g -O3 -Wall -Werror-implicit-function-declaration)]
  end

  conf.linker do |linker|
    linker.command = 'gcc'
    linker.flags = [%w()]
    linker.libraries = %w(m)
    linker.library_paths = []
  end

  conf.archiver do |archiver|
    archiver.command = "ar"
  end

  # Use minimal gembox instead of default to avoid compatibility issues
  # conf.gembox 'default'
  conf.gem :core => "mruby-sprintf"
  conf.gem :core => "mruby-compiler"
end

MRuby::CrossBuild.new('esp32') do |conf|
  toolchain :gcc

  conf.cc do |cc|
    cc.include_paths << ENV["COMPONENT_INCLUDES"].split(';')
    cc.flags << '-Wno-maybe-uninitialized'
    cc.flags << '-Wno-declaration-after-statement'
    cc.flags << '-Wno-unused-variable'
    cc.flags << '-mlongcalls'
    cc.flags << '-std=gnu17'
    cc.flags = cc.flags.flatten.collect { |x| x.gsub('-MP', '') }

    cc.defines << %w(MRB_HEAP_PAGE_SIZE=64)
    cc.defines << %w(MRB_USE_IV_SEGLIST)
    cc.defines << %w(KHASH_DEFAULT_SIZE=8)
    cc.defines << %w(MRB_STR_BUF_MIN_SIZE=20)
    cc.defines << %w(MRB_GC_STRESS)
    cc.defines << %w(MRB_USE_METHOD_T_STRUCT)
    cc.defines << %w(MRB_NO_BOXING)

    cc.defines << %w(ESP_PLATFORM)
  end

  conf.cxx do |cxx|
    cxx.include_paths = conf.cc.include_paths.dup

    cxx.flags = cxx.flags.flatten.collect { |x| x.gsub('-MP', '') }

    cxx.defines = conf.cc.defines.dup
  end

  conf.bins = []
  conf.build_mrbtest_lib_only
  conf.disable_cxx_exception

  #Core mgem
  conf.gem :core => "mruby-compiler"
  conf.gem :core => "mruby-sprintf"
  conf.gem :core => "mruby-numeric-ext"
  conf.gem :core => "mruby-class-ext"
  conf.gem :core => "mruby-object-ext"
  conf.gem :core => "mruby-proc-ext"
  conf.gem :core => "mruby-kernel-ext"
  conf.gem :core => "mruby-method"
  conf.gem :core => "mruby-metaprog"

  conf.gem :github => "kishima/mruby-esp32-print", branch: 'main'

  conf.gem :github => "mruby-esp32/mruby-io"
  conf.gem :github => "mruby-esp32/mruby-esp32-system"

  #conf.gem :github => "mruby-esp32/mruby-fileio"
  #conf.gem :github => "mruby-esp32/mruby-socket"
  #conf.gem :github => "mruby-esp32/mruby-esp32-wifi"
  #conf.gem :github => "mruby-esp32/mruby-esp32-mqtt"
  #conf.gem :github => "mruby-esp32/mruby-esp32-gpio"
  #conf.gem :github => "mruby-esp32/mruby-esp32-adc"
  #conf.gem :github => "mruby-esp32/mruby-esp32-ledc"
  #conf.gem :github => "mruby-esp32/mruby-esp32-spi"
end