When /^I create a new git repository$/ do
  in_current_dir do
    system "git init"
    system "touch init"
    system "git add ."
    system "git commit -m 'initial commit'"
    system "cp ../../../hooks/* .git/hooks/"
    system "chmod +x .git/hooks/*"
  end
end

When /^I am on the "(.*?)" branch$/ do |branch_name|
  in_current_dir do
    system "git checkout #{branch_name}"
    @branch_revision = `git rev-parse HEAD`
  end
end

When /^I try to commit the file "(.*?)"$/ do |file_name|
  step "I run `touch #{file_name}`"
  step "I run `git add .`"
  step "I run `git commit -m 'message'` interactively"
end

When /^I answer "(.*?)" to the question "(.*?)"$/ do |answer, question|
  step "I type \"#{answer}\n\""
end

Then /^the commit should not be created$/ do
  in_current_dir do
    current_revision = `git rev-parse HEAD`
    current_revision.should == @branch_revision
  end
end
