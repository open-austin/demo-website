require "rake/clean"

task :default => ["build"]

@pages_dest = []
@pages_src = FileList["src/pages/*.rhtml"]
@pages_src.each do |fs|
  fd = fs.pathmap("html/%n.html")
  @pages_dest << fd
  CLEAN.include(fd)
  task fd => [fs, "src/layout.rhtml"] do
    sh "ruby src/mkpage.rb #{fs} > #{fd}"
  end
end

task :build => @pages_dest

