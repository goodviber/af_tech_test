require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.pattern = 'test/**/test_*.rb'
  t.verbose = true
end


task default: :test

# example of rake task to run parser, would need print_results NOT to be a class method.
desc 'Run Parser'
  task :parser, [:datafile] do |t, args|

    project_root = File.dirname(File.absolute_path(__FILE__))
    Dir.glob(project_root + '/lib/*') { |file| require file }

    p = ParserOo.new(args[:datafile])
    p.print_results(p.list_pages_in_order, "visits")
    p.print_results(p.list_pages_by_unique_views, "unique views")
  end
