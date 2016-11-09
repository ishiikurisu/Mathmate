function anon()
x = toCell(-pi, pi, 0.1);
y = map(@(it) sin(it), x)
x = cell2mat(x);
y = cell2mat(y);
plot(x, y);

function outlet = toCell(from, to, by)
outlet = { };
it = from;
while it <= to
  outlet{end+1} = it;
  it = it + by;
end
