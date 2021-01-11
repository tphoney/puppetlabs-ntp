# @summary Provisions machines
#
# Provisions machines for integration testing
#
# @example
#   ntp::provision_integration
plan ntp::provision_integration(
    Optional[Enum['abs', 'vmpooler']] $provision_type = 'abs',
) {
  #provision server machine, set role
  run_task("provision::abs", 'localhost',
    action => 'provision', platform => 'ubuntu-1804-x86_64', inventory => './', vars => 'role: ntpserver')
  run_task("provision::abs", 'localhost',
    action => 'provision', platform => 'ubuntu-1804-x86_64', inventory => './', vars => 'role: ntpclient')
}
