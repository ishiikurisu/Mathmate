function varargout = mathmate(varargin)
% This is the module made to analyze Scalemate-generated data after
% the execution of many Procastination tests. The goal is to experimentally
% prove there is no correlation between grades and how much the person
% procastinate.

% Last Modified by GUIDE v2.5 08-Nov-2016 15:29:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mathmate_OpeningFcn, ...
                   'gui_OutputFcn',  @mathmate_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end


% --- Executes just before mathmate is made visible.
function mathmate_OpeningFcn(hObject, eventdata, handles, varargin)
% Executes just before mathmate is made visible.
handles.output = hObject;
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = mathmate_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;


% --- Executes on button press in pushbuttonSearch.
function pushbuttonSearch_Callback(hObject, eventdata, handles)
foldername = uigetdir;
set(handles.editSearch, 'String', strcat(foldername, '\'));


function editSearch_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function editSearch_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), ...
                   get(0,'defaultUicontrolBackgroundColor'))
    set(hObject, 'BackgroundColor', 'white');
end


% --- Executes on button press in pushbuttonRun.
function pushbuttonRun_Callback(hObject, eventdata, handles)
scores = [ ];
IRAs = [ ];

selectedFolder = get(handles.editSearch, 'String');
dirData = dir(selectedFolder);
dirIndex = [dirData.isdir];
fileList = {dirData(~dirIndex).name};
limit = length(fileList);
for n = 1:limit
    % TODO Extract raw data from file
    filename = sprintf('%s', strcat(selectedFolder, fileList{n}));
    fp = fopen(filename, 'r');
    fields = { };
    line = fgetl(fp);
    while ischar(line)
        fields{end+1} = strsplit(line, sprintf('\t'));
        line = fgetl(fp);
    end
    stuff = map(@str2num, { fields{1}{3}, fields{2}{5} });
    score = stuff{1};
    IRA = stuff{2};
    if isequal(length(IRA), 1)
        scores(length(scores)+1) = score;
        IRAs(length(IRAs)+1) = IRA;
    end
    fclose(fp);
    % TODO Feed analysis object with raw data
end

% TODO Calculate results
% TODO Display results
fprintf('scores\tIRAs\n');
for n = 1:length(scores)
    fprintf('%f\t%f\n', scores(n), IRAs(n));
end
