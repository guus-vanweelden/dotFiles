function gocd
  cd (go list -f '{{.Dir}}' .../$argv | grep -v 'vendor')
end
