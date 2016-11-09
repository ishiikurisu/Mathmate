function tokens = strsplit(string, delimeter)
tokens = {};
while not(isempty(string))
    [tokens{end+1}, string] = strtok(string,delimeter);
end
