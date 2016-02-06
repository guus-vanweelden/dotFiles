function gaecd
  cd (go list -f '{{.Dir}}' .../$argv/appengine/)/.. 
end
