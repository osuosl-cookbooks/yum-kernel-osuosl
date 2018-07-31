default['yum']['kernel-osuosl']['repositoryid'] = 'kernel-osuosl'
default['yum']['kernel-osuosl']['description'] = 'OSUOSL Linux Kernel'
default['yum']['kernel-osuosl']['enabled'] = true
default['yum']['kernel-osuosl']['gpgcheck'] = true
default['yum']['kernel-osuosl']['gpgkey'] = 'https://ftp.osuosl.org/pub/osl/repos/yum/RPM-GPG-KEY-osuosl'
default['yum']['kernel-osuosl']['baseurl'] = case node['kernel']['machine']
                                             when 'ppc64le'
                                               'https://ftp.osuosl.org/pub/osl/repos/yum/openpower/centos-$releasever/ppc64le/kernel-osuosl/'
                                             else
                                               'https://ftp.osuosl.org/pub/osl/repos/yum/$releasever/kernel-osuosl/$basearch/'
                                             end
