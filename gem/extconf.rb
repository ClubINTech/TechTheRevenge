require 'mkmf'

extension_name = 'revenge'

have_library("pthread")
dir_config(extension_name)
create_makefile(extension_name)