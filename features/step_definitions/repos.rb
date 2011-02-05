Given /^a checked out repo "([^"]*)"$/ do |path|
  dirs << path
  run "git init -q"
  dirs.pop
end

Given /^a bare repo "([^"]*)"$/ do |path|
  dirs << path
  run "git init --bare -q"
  dirs.pop
end

Then /^the repo "([^"]*)" should be packed$/ do |path|
  path << "/.git" unless path =~ /\.git$/
  Then %|a file named "#{path}/objects/info/packs" should exist|
end

Then /^the repo "([^"]*)" should not be packed$/ do |path|
  path << "/.git" unless path =~ /\.git$/
  Then %|a file named "#{path}/objects/info/packs" should not exist|
end
