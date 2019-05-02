require "erb"

# @ripienaar https://www.devco.net/archives/2010/11/18/a_few_rake_tips.php
def render_template(template, output, scope)
    tmpl = File.read(template)
    erb = ERB.new(tmpl, 0, "<>")
    File.open(output, "w") do |f|
        f.puts erb.result(scope)
    end
end

desc "Update Dockerfile templates"
task :default do

  maintainer = 'jesse_weisner@bcit.ca'
  org_name = 'bcit'
  image_name = 'openshift-python3'
  version = '3.6.8-r2'
  version_segments = version.split('.')
  patch_segments = version_segments[2].split('-')
  tags = [
    "#{version_segments[0]}.#{version_segments[1]}.#{patch_segments[0]}",
    "#{version_segments[0]}.#{version_segments[1]}",
    'latest'
  ]

  render_template("Dockerfile.erb", "Dockerfile", binding)
  sh "docker build -t #{org_name}/#{image_name}:#{version} ."
  sh "docker push #{org_name}/#{image_name}:#{version}"

  tags.each do |tag|
      sh "docker tag #{org_name}/#{image_name}:#{version} #{org_name}/#{image_name}:#{tag}"
      sh "docker push #{org_name}/#{image_name}:#{tag}"
  end
end
