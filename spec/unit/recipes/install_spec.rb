require_relative '../../spec_helper'

describe 'yum-kernel-osuosl::install' do
  ALL_PLATFORMS.each do |p|
    context "#{p[:platform]} #{p[:version]}" do
      cached(:chef_run) do
        ChefSpec::SoloRunner.new(p).converge(described_recipe)
      end
      it 'converges successfully' do
        expect { chef_run }.to_not raise_error
      end
      it do
        expect(chef_run).to include_recipe('yum-kernel-osuosl')
      end
      it do
        expect(chef_run).to create_cookbook_file('/etc/sysconfig/kernel')
      end
      it do
        expect(chef_run).to install_package('kernel-osuosl')
      end
    end
  end
end
