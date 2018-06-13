use v6;

unit module Sparrowdo::VSTS::YAML::Build:ver<0.0.1>;

use Sparrowdo;
use Sparrowdo::Core::DSL::Template;
use Sparrowdo::Core::DSL::File;
use Sparrowdo::Core::DSL::Directory;

our sub tasks (%args) {

  my $queue = %args<queue> || 'default';
  my $agent-name = %args<agent-name> || 'agent01';
  my $timeout = %args<timeout> || 10; # 10 minutes

  my $build-dir = %args<build-dir> || die "usage module_run '{ ::?MODULE.^name }' ,%(build-dir => dir)";

  directory-delete "$build-dir/files";
  directory-delete "$build-dir/.cache";

  directory "$build-dir/.cache";
  directory "$build-dir/files";

  template-create "$build-dir/build.yaml", %(
    source => ( slurp %?RESOURCES<build.yaml> ),
    variables => %( 
      queue => $queue,
      agent_name => $agent-name,
      timeout => $timeout
    )
  );

}


