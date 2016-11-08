classdef dropbox

properties
    IRAs = { };
    Scores = { };
end

methods
    function obj = addIra(obj, IRA)
        obj.IRAs{end+1} = IRA;
    end

    function obj = addScore(obj, score)
        obj.Scores{end+1} = score;
    end

    function r = calculateCorrelation(obj)
        r = corrcoef(cell2mat(obj.IRAs), cell2mat(obj.Scores));
    end
end

end
