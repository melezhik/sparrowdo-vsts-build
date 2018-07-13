# Sparrowdo::VSTS::YAML::Build

Sparrowdo module to generate VSTS yaml build definition header.


    $ cat sparrowfile

    module_run "VSTS::YAML::Build", %(
      build-dir => "cicd/build",
      agent-name => "James Bond", # default value is not set
      queue => "build-lane"
    );


    $ sparrowdo --local_mode --no_sudo

# Author

Alexey Melezhik

