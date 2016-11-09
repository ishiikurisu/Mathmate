function outlet = map(operation, inlet)
outlet = { };
limit = length(inlet);
for n = 1:limit
  outlet{end+1} = operation(inlet{n});
end
