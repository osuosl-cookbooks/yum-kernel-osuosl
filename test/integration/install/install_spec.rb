docker = inspec.command('test -e /.dockerenv')

describe file('/etc/sysconfig/kernel') do
  its('content') { should match(/^DEFAULTKERNEL=kernel-osuosl$/) }
end

describe package('kernel-osuosl') do
  it { should be_installed }
end

describe command('grubby --default-kernel') do
  its('stdout') { should match(/5.4.*-osuosl/) }
end unless docker
