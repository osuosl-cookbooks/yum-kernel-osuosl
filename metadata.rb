name             'yum-kernel-osuosl'
maintainer       'Oregon State University'
maintainer_email 'chef@osuosl.org'
license          'Apache-2.0'
chef_version     '>= 12.18' if respond_to?(:chef_version)
issues_url       'https://github.com/osuosl-cookbooks/yum-kernel-osuosl/issues'
source_url       'https://github.com/osuosl-cookbooks/yum-kernel-osuosl'
description      'Installs/Configures yum-kernel-osuosl'
long_description 'Installs/Configures yum-kernel-osuosl'
version          '1.1.0'

depends          'yum'

supports         'centos', '~> 7.0'
