function gocd
  cd (go list -f '{{.Dir}}' .../$argv)
end
