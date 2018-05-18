project('test', 'd')

dub = import('dub')
xmlrpccd_dep = dub.dependency('xmlrpcc-d')

test_source_exe = executable('test1', 'source/test.d', dependencies: xmlrpccd_dep)