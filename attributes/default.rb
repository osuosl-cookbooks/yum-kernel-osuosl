default['yum']['kernel-osuosl']['repositoryid'] = 'kernel-osuosl'
default['yum']['kernel-osuosl']['description'] = 'OSUOSL Linux Kernel'
default['yum']['kernel-osuosl']['enabled'] = true
default['yum']['kernel-osuosl']['gpgcheck'] = true
default['yum']['kernel-osuosl']['gpgkey'] = 'https://ftp.osuosl.org/pub/osl/repos/yum/RPM-GPG-KEY-osuosl'
default['yum']['kernel-osuosl']['baseurl'] =
  case node['kernel']['machine']
  when 'ppc64le'
    # We have special POWER8 kernels
    if node.read('ibm_power', 'cpu', 'cpu_model') =~ /power8/
      'https://ftp.osuosl.org/pub/osl/repos/yum/$releasever/kernel-osuosl/$basearch-power8/'
    else
      'https://ftp.osuosl.org/pub/osl/repos/yum/$releasever/kernel-osuosl/$basearch/'
    end
  else
    'https://ftp.osuosl.org/pub/osl/repos/yum/$releasever/kernel-osuosl/$basearch/'
  end
