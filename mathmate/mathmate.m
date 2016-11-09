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
% Executes on button press in pushbuttonRun. Will draw a plot relating the
% expected result analysis.

% Data structures to hold our data
scores = [ ];
IRAs = [ ];

% Locating files on expected directory
selectedFolder = get(handles.editSearch, 'String');
dirData = dir(selectedFolder);
dirIndex = [dirData.isdir];
fileList = {dirData(~dirIndex).name};
limit = length(fileList);
for n = 1:limit
    % Loading data
    filename = sprintf('%s', strcat(selectedFolder, fileList{n}));
    fp = fopen(filename, 'r');
    fields = { };
    line = fgetl(fp);
    while ischar(line)
        fields{end+1} = strsplit(line, sprintf('\t'));
        line = fgetl(fp);
    end
    fclose(fp);

    % Translating data from file to something useful
    stuff = map(@str2num, { fields{1}{3}, fields{2}{5} });
    score = stuff{1};
    IRA = stuff{2};

    % Validating data sets for analysis
    if isequal(length(IRA), 1)
      if IRA >= 0 && IRA <= 5
          scores(length(scores)+1) = score;
          IRAs(length(IRAs)+1) = IRA;
      end
    end
end

% Calculating results
cc = corrcoef(IRAs, scores);

% Displaying results
figure;
scatter(IRAs, scores);
text(10, 10, sprintf('Correlation = %f', cc(1, 2)));
xlabel('Academic performance');
ylabel('Procastination score');
