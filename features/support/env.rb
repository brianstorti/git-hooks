Before do
  p `ls`
  `mkdir test_repo && cd test_repo` 
  `git init > /dev/null` 
  `touch foo` 
  `git add .` 
  `git commit -m "first commit" --quiet` 
end

After do
  `rm -rf test_repo`
end
