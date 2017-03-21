function [outlet] = strreplace(inlet, from, to)
% Replaces a chra in a string
limit = length(inlet);
outlet = '';

for n = 1:limit
	if inlet(n) == from
		outlet(n) = to;
	else
		outlet(n) = inlet(n);
	end
end
