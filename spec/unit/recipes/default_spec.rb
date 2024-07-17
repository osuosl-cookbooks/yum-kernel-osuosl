require_relative '../../spec_helper'

describe 'yum-kernel-osuosl::default' do
  ALL_PLATFORMS.each do |p|
    context "#{p[:platform]} #{p[:version]}" do
      cached(:chef_run) do
        ChefSpec::SoloRunner.new(p).converge(described_recipe)
      end
      it 'converges successfully' do
        expect { chef_run }.to_not raise_error
      end
      case p
      when ALMA_8
        it do
          expect(chef_run).to create_yum_repository('kernel-osuosl')
            .with(
              repositoryid: 'kernel-osuosl',
              description: 'OSUOSL Linux Kernel',
              enabled: true,
              gpgcheck: true,
              gpgkey: 'https://ftp.osuosl.org/pub/osl/repos/yum/RPM-GPG-KEY-osuosl',
              baseurl: 'https://ftp.osuosl.org/pub/osl/repos/yum/$releasever/kernel-osuosl/$basearch/'
            )
        end
        context 'ppc64le' do
          cached(:chef_run) do
            ChefSpec::SoloRunner.new(p) do |node|
              node.automatic['kernel']['machine'] = 'ppc64le'
            end.converge(described_recipe)
          end
          it do
            expect(chef_run).to create_yum_repository('kernel-osuosl')
              .with(
                repositoryid: 'kernel-osuosl',
                description: 'OSUOSL Linux Kernel',
                enabled: true,
                gpgcheck: true,
                gpgkey: 'https://ftp.osuosl.org/pub/osl/repos/yum/RPM-GPG-KEY-osuosl',
                baseurl: 'https://ftp.osuosl.org/pub/osl/repos/yum/$releasever/kernel-osuosl/$basearch/'
              )
          end
        end
        context 'ppc64le w/ POWER8' do
          cached(:chef_run) do
            ChefSpec::SoloRunner.new(p) do |node|
              node.automatic['kernel']['machine'] = 'ppc64le'
              node.automatic['ibm_power']['cpu']['cpu_model'] = 'power8e'
            end.converge(described_recipe)
          end
          it do
            expect(chef_run).to create_yum_repository('kernel-osuosl')
              .with(
                repositoryid: 'kernel-osuosl',
                description: 'OSUOSL Linux Kernel',
                enabled: true,
                gpgcheck: true,
                gpgkey: 'https://ftp.osuosl.org/pub/osl/repos/yum/RPM-GPG-KEY-osuosl',
                baseurl: 'https://ftp.osuosl.org/pub/osl/repos/yum/$releasever/kernel-osuosl/$basearch-power8/'
              )
          end
        end
      else
        it do
          expect(chef_run).to_not create_yum_repository('kernel-osuosl')
        end
      end
    end
  end
end
