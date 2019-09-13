# frozen_string_literal: true

desc 'Test docker images'
task :test do
  puts '*** Testing images ***'.green
  $images.each do |image|
    puts "Running tests on #{image.base_tag}"
    sh "docker run --rm #{image.base_tag} /smoketest.py"
  end
end
