#
# Top-level variables
#
# There must not be any whitespace between this comment and the variables or
# in between any two variables in order for them to be correctly parsed and
# passed around in test.sh
#

#
# Default: should at least behave like an openstack server
#
node default {
  class { 'openstack_project::server':
    sysadmins => hiera('sysadmins', []),
  }
}


# Node-OS: precise
node 'node1.test.localdomain' {
  class { 'openstack_project::jenkins':
    project_config_repo     => 'https://github.com/morucci/project-config.git',
    jenkins_jobs_password   => hiera('jenkins_jobs_password', 'XXX'),
    jenkins_ssh_private_key => hiera('jenkins_ssh_private_key_contents', 'XXX'),
    ssl_cert_file_contents  => hiera('jenkins_ssl_cert_file_contents', 'XXX'),
    ssl_key_file_contents   => hiera('jenkins_ssl_key_file_contents', 'XXX'),
    ssl_chain_file_contents => hiera('jenkins_ssl_chain_file_contents', 'XXX'),
    sysadmins               => hiera('sysadmins', []),
    zmq_event_receivers     => [],
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
