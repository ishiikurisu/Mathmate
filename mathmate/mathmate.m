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
% TODO Create object to store and analyze data

selectedFolder = get(handles.editSearch, 'String');
dirData = dir(selectedFolder);
dirIndex = [dirData.isdir];
fileList = {dirData(~dirIndex).name};
limit = length(fileList);
for n = 1:limit
    fprintf('%s\n', strcat(selectedFolder, fileList{n}));
    % TODO Extract raw data from file
    % TODO Feed analysis object with raw data
end

% TODO Calculate results
% TODO Display results
