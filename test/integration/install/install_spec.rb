describe file('/etc/sysconfig/kernel') do
  its('content') { should match(/^DEFAULTKERNEL=kernel-osuosl$/) }
end

describe package('kernel-osuosl') do
  it { should be_installed }
end

describe command('grubby --default-kernel') do
  its('stdout') { should match(/4.14.*-gentoo-osuosl/) }
end
