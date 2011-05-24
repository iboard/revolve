class Test < Thor

  include Thor::Actions
  #Thor::Sandbox::Application.source_root(File.dirname(__FILE__)+"/../..")
  
  #no_tasks do
  #end

  desc "test_all", "Run tests and cucumber"
  def test_all
    puts "RUNNING TEST UNITS"
    system "rake test:units | grep tests.*assertions.*failures"
    puts "\nRUNNING TEST FUNCTIONALS"
    system "rake test:functionals | grep tests.*assertions.*failures"
    puts "\nRUNNING CUCUMBER"
    system "bundle exec cucumber | grep '[scenarios|steps]'"
  end
  
  desc "run_autotests", "Run spork server and autotest"
  def run_autotests
    puts "RUNNING AUTOTESTS WITH SPORK"
    script = <<-EOS
      #!/bin/bash
      export AUTOFEATURE=true
      bundle exec spork > log/spork.log 2>&1 &
      echo -n 'Spork server started - waiting to allow start up '
      for i in 9 8 7 6 5 4 3 2 1
      do
        echo -n $i; sleep 1; echo -n ' '
      done
      echo 'Start continuos testing'
      bundle exec autotest
      echo 'Autotest ended. Now stopping spork-server'
      kill %1
    EOS
    .gsub( /^      /,'' )
    sfile = File::new("tmp/autotest.sh",'w')
    sfile << script
    sfile.close
    system( "bash #{sfile.path}")
    File::unlink(sfile.path)
  end
  
end