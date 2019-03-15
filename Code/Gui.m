function varargout = Gui(varargin)
% GUI MATLAB code for Gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Gui

% Last Modified by GUIDE v2.5 20-Dec-2018 20:02:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Gui_OpeningFcn, ...
                   'gui_OutputFcn',  @Gui_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before Gui is made visible.
function Gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Gui (see VARARGIN)

% Choose default command line output for Gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    % Final Time Signal 
    global final_y;
    % Used fs
    global fs;

    % Play Tha Auduio
    initialize_data(hObject, eventdata, handles);
    amplify_signal(hObject, eventdata, handles);
    add_filterd_signal(hObject, eventdata, handles);
    sound(final_y,fs);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)  


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    clear sound;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    set(handles.text22 , 'String' ,num2str(get( handles.slider1 , 'Value')* 20) );
    

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    set(handles.text23 , 'String' ,num2str(get( handles.slider3 , 'Value')* 20) );
    
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    set(handles.text24 , 'String' ,num2str(get( handles.slider4 , 'Value')* 20) );
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    
    set(handles.text25 , 'String' ,num2str(get( handles.slider5 , 'Value')* 20) );

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    set(handles.text26 , 'String' ,num2str(get( handles.slider6 , 'Value')* 20) );

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider7_Callback(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    set(handles.text27 , 'String' ,num2str(get( handles.slider7 , 'Value')* 20) );

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider8_Callback(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    set(handles.text28 , 'String' ,num2str(get( handles.slider8 , 'Value')* 20) );

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider9_Callback(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    set(handles.text29 , 'String' ,num2str(get( handles.slider9 , 'Value')* 20) );

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider10_Callback(hObject, eventdata, handles)
% hObject    handle to slider10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    set(handles.text30 , 'String' ,num2str(get( handles.slider10 , 'Value')* 20) );

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    
    % Used fs
    global fs;
    global original_fs;

    % Double fs is applied
    fs = original_fs*2;

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    % Used fs
    global fs;
    global original_fs;

    % default fs is applied
    fs = original_fs;

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    % Used fs
    global fs;
    global original_fs;

    % Half fs is applied
    fs = original_fs/2;

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    % Plot Signals
    initialize_data(hObject, eventdata, handles);
    amplify_signal(hObject, eventdata, handles);
    add_filterd_signal(hObject, eventdata, handles);
    
    global y;
    global final_y;
    global t;
    global final_t;
    
    global y_fft;
    global final_y_fft;
    global f;
    global final_f;
    
    global fs;
    global original_fs;
    global Nfft;
    
    % Calculate Time Space 
    t=linspace(0,length(y)/original_fs,length(y));
    final_t=linspace(0,length(final_y)/fs,length(final_y));
    
    % Calculate Freq Space
    f=linspace(-fs/2,fs/2,length(y));
    final_f = linspace(-fs/2,fs/2,length(final_y));
    
    % Original Time Signal
    figure;
    subplot(4,1,1);
    plot(t(1:length(y)/2),y(1:length(y)/2));
    title('Original Time Signal');
    
    % Original Freq Signal
    subplot(4,1,2);
    plot(f(1:length(y)),y_fft(1:length(y)));
    title('Original Freq Signal');
    
    % Filtered Time Signal
    subplot(4,1,3);
    plot(final_t(1:length(final_y)/2),final_y(1:length(final_y)/2));
    title('Filtered Time Signal');
    
    % Filtered Freq Signal
    subplot(4,1,4);
    plot(final_f(1:length(final_y)),final_y_fft(1:length(final_y)));
    title('Filtered Freq Signal');
    
    disp('Ploting is done');

% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    % Sampling Freq
    global fs;
    
    % Order
    global n;
    
    % Check fs
    if(fs < 32000)
        fs = 32000;
    end    
    
    % Get Filter Order
    n = get(handles.edit1, 'String');
    n = str2double(n);
    
    % Check Pop Up Item
    item = get(handles.popupmenu1,'value');
    
    % Check if FIR or IIR and Do Filteration
    if (get(handles.radiobutton2,'Value') == 1)
        
        disp('Filter Type is selected');
        
        if(item == 1)
            freqz(FIR_Constr_band_equiripple_Lowpass(fs , n , 0 , 170));
            freqz(FIR_Constr_band_equiripple_Bandpass(fs , n , 170 , 175 , 305 , 310));
            freqz(FIR_Constr_band_equiripple_Bandpass(fs , n , 310 , 315 , 595 , 600));
            freqz(FIR_Constr_band_equiripple_Bandpass(fs , n , 600 , 605 , 995 , 1000));
            freqz(FIR_Constr_band_equiripple_Bandpass(fs , n , 1000 , 1005 , 2995 , 3000));
            freqz(FIR_Constr_band_equiripple_Bandpass(fs , n , 3000 , 3005 , 5995 , 6000));
            freqz(FIR_Constr_band_equiripple_Bandpass(fs , n , 6000 , 6005 , 11995 , 12000));
            freqz(FIR_Constr_band_equiripple_Bandpass(fs , n , 12000 , 12005 , 13995 , 14000));
            freqz(FIR_Constr_band_equiripple_Highpass(fs , n , 14000 , 16000));
        elseif(item == 2)
            freqz(FIR_Constr_Least_squares_Lowpass(fs , n , 165 , 170));
            freqz(FIR_Constr_Least_squares_Bandpass(fs , n , 170 , 310));
            freqz(FIR_Constr_Least_squares_Bandpass(fs , n , 310 , 600));
            freqz(FIR_Constr_Least_squares_Bandpass(fs , n , 600 , 1000));
            freqz(FIR_Constr_Least_squares_Bandpass(fs , n , 1000 , 3000));
            freqz(FIR_Constr_Least_squares_Bandpass(fs , n , 3000 , 6000));
            freqz(FIR_Constr_Least_squares_Bandpass(fs , n , 6000 , 12000));
            freqz(FIR_Constr_Least_squares_Bandpass(fs , n , 12000 , 14000));
            freqz(FIR_Constr_Least_squares_Highpass(fs , n , 14000));
        elseif(item == 3)
            freqz(FIR_Equiripple_Lowpass(fs , n , 0 , 170));
            freqz(FIR_Equiripple_Bandpass(fs , n , 170 , 175 , 305 , 310));
            freqz(FIR_Equiripple_Bandpass(fs , n , 310 , 315 , 595 , 600));
            freqz(FIR_Equiripple_Bandpass(fs , n , 600 , 605 , 995 , 1000));
            freqz(FIR_Equiripple_Bandpass(fs , n , 1000 , 1005 , 2995 , 3000));
            freqz(FIR_Equiripple_Bandpass(fs , n , 3000 , 3005 , 5995 , 6000));
            freqz(FIR_Equiripple_Bandpass(fs , n , 6000 , 6005 , 11995 , 12000));
            freqz(FIR_Equiripple_Bandpass(fs , n , 12000 , 12005 , 13995 , 14000));
            freqz(FIR_Equiripple_Highpass(fs , n , 14000 , 16000));
        elseif(item == 4)
            freqz(FIR_Generalized_equiripple_Lowpass(fs , n , 0 , 170));
            freqz(FIR_Generalized_equiripple_Bandpass(fs , n , 170 , 175 , 305 , 310));
            freqz(FIR_Generalized_equiripple_Bandpass(fs , n , 310 , 315 , 595 , 600));
            freqz(FIR_Generalized_equiripple_Bandpass(fs , n , 600 , 610 , 990 , 1000));
            freqz(FIR_Generalized_equiripple_Bandpass(fs , n , 1000 , 1005 , 2995 , 3000));
            freqz(FIR_Generalized_equiripple_Bandpass(fs , n , 3000 , 3005 , 5995 , 6000));
            freqz(FIR_Generalized_equiripple_Bandpass(fs , n , 6000 , 6005 , 11995 , 12000));
            freqz(FIR_Generalized_equiripple_Bandpass(fs , n , 12000 , 12005 , 13995 , 14000));
            freqz(FIR_Generalized_equiripple_Highpass(fs , n , 14000 , 16000));
        elseif(item == 5)
            freqz(FIR_Least_squares_Lowpass(fs , n , 165 , 170));
            freqz(FIR_Least_squares_Bandpass(fs , n , 170 , 175 , 305 , 310));
            freqz(FIR_Least_squares_Bandpass(fs , n , 310 , 315 , 595 , 600));
            freqz(FIR_Least_squares_Bandpass(fs , n , 600 , 605 , 995 , 1000));
            freqz(FIR_Least_squares_Bandpass(fs , n , 1000 , 1005 , 2995 , 3000));
            freqz(FIR_Least_squares_Bandpass(fs , n , 3000 , 3005 , 5995 , 6000));
            freqz(FIR_Least_squares_Bandpass(fs , n , 6000 , 6005 , 11995 , 12000));
            freqz(FIR_Least_squares_Bandpass(fs , n , 12000 , 12005 , 13995 , 14000));
            freqz(FIR_Least_squares_Highpass(fs , n , 14000 , 16000));
        elseif(item == 6)
            freqz(FIR_Window_Chebyshev_Lowpass(fs , n , 170));
            freqz(FIR_Window_Chebyshev_Bandpass(fs , n , 170 , 310));
            freqz(FIR_Window_Chebyshev_Bandpass(fs , n , 310 , 600));
            freqz(FIR_Window_Chebyshev_Bandpass(fs , n , 600 , 1000));
            freqz(FIR_Window_Chebyshev_Bandpass(fs , n , 1000 , 3000));
            freqz(FIR_Window_Chebyshev_Bandpass(fs , n , 3000 , 6000));
            freqz(FIR_Window_Chebyshev_Bandpass(fs , n , 6000 , 12000));
            freqz(FIR_Window_Chebyshev_Bandpass(fs , n , 12000 , 14000));
            freqz(FIR_Window_Chebyshev_Highpass(fs , n , 14000));
        elseif(item == 7)
            freqz(FIR_Window_Rectangular_Lowpass(fs , n , 170));
            freqz(FIR_Window_Rectangular_Bandpass(fs , n , 170 , 310));
            freqz(FIR_Window_Rectangular_Bandpass(fs , n , 310 , 600));
            freqz(FIR_Window_Rectangular_Bandpass(fs , n , 600 , 1000));
            freqz(FIR_Window_Rectangular_Bandpass(fs , n , 1000 , 3000));
            freqz(FIR_Window_Rectangular_Bandpass(fs , n , 3000 , 6000));
            freqz(FIR_Window_Rectangular_Bandpass(fs , n , 6000 , 12000));
            freqz(FIR_Window_Rectangular_Bandpass(fs , n , 12000 , 14000));
            freqz(FIR_Window_Rectangular_Highpass(fs , n , 14000));
        end
    else  
        if(item == 1)
            freqz(IIR_Butterworth_Lowpass(fs , n , 170));
            freqz(IIR_Butterworth_Bandpass(fs , n , 170 , 310));
            freqz(IIR_Butterworth_Bandpass(fs , n , 310 , 600));
            freqz(IIR_Butterworth_Bandpass(fs , n , 600 , 1000));
            freqz(IIR_Butterworth_Bandpass(fs , n , 1000 , 3000));
            freqz(IIR_Butterworth_Bandpass(fs , n , 3000 , 6000));
            freqz(IIR_Butterworth_Bandpass(fs , n , 6000 , 12000));
            freqz(IIR_Butterworth_Bandpass(fs , n , 12000 , 14000));
            freqz(IIR_Butterworth_Highpass(fs , n , 14000));
        elseif(item == 2)
            freqz(IIR_Chebyshev_type_1_Lowpass(fs , n , 170));
            freqz(IIR_Chebyshev_type_1_Bandpass(fs , n , 170 , 310));
            freqz(IIR_Chebyshev_type_1_Bandpass(fs , n , 310 , 600));
            freqz(IIR_Chebyshev_type_1_Bandpass(fs , n , 600 , 1000));
            freqz(IIR_Chebyshev_type_1_Bandpass(fs , n , 1000 , 3000));
            freqz(IIR_Chebyshev_type_1_Bandpass(fs , n , 3000 , 6000));
            freqz(IIR_Chebyshev_type_1_Bandpass(fs , n , 6000 , 12000));
            freqz(IIR_Chebyshev_type_1_Bandpass(fs , n , 12000 , 14000));
            freqz(IIR_Chebyshev_type_1_Highpass(fs , n , 14000));
        elseif(item == 3)
            freqz(IIR_Chebyshev_type_2_Lowpass(fs , n , 170));
            freqz(IIR_Chebyshev_type_2_Bandpass(fs , n , 170 , 310));
            freqz(IIR_Chebyshev_type_2_Bandpass(fs , n , 310 , 600));
            freqz(IIR_Chebyshev_type_2_Bandpass(fs , n , 600 , 1000));
            freqz(IIR_Chebyshev_type_2_Bandpass(fs , n , 1000 , 3000));
            freqz(IIR_Chebyshev_type_2_Bandpass(fs , n , 3000 , 6000));
            freqz(IIR_Chebyshev_type_2_Bandpass(fs , n , 6000 , 12000));
            freqz(IIR_Chebyshev_type_2_Bandpass(fs , n , 12000 , 14000));
            freqz(IIR_Chebyshev_type_2_Highpass(fs , n , 14000));
        end
    end
    


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    % Filter Time Output
    global tout1;
    global tout2;
    global tout3;
    global tout4;
    global tout5;
    global tout6;
    global tout7;
    global tout8;
    global tout9;
    
    % Filter Freq Output
    global fout1;
    global fout2;
    global fout3;
    global fout4;
    global fout5;
    global fout6;
    global fout7;
    global fout8;
    global fout9;
    
    global t;
    global f;
    global y;
    global fs;
    
    initialize_data(hObject, eventdata, handles);
    
    % Calculate Time Space 
    t=linspace(0,length(y)/fs,length(y));
    
    % Calculate Freq Space
    f=linspace(-fs/2,fs/2,length(y));
    
    % Plot Time Filters
    figure();
    subplot(9,2,1);
    plot(t(1:length(y)/2),tout1(1:length(y)/2));
    title('Time Filter 1');
    subplot(9,2,3);
    plot(t(1:length(y)/2),tout2(1:length(y)/2));
    title('Time Filter 2');
    subplot(9,2,5);
    plot(t(1:length(y)/2),tout3(1:length(y)/2));
    title('Time Filter 3');
    subplot(9,2,7);
    plot(t(1:length(y)/2),tout4(1:length(y)/2));
    title('Time Filter 4');
    subplot(9,2,9);
    plot(t(1:length(y)/2),tout5(1:length(y)/2));
    title('Time Filter 5');
    subplot(9,2,11);
    plot(t(1:length(y)/2),tout6(1:length(y)/2));
    title('Time Filter 6');
    subplot(9,2,13);
    plot(t(1:length(y)/2),tout7(1:length(y)/2));
    title('Time Filter 7');
    subplot(9,2,15);
    plot(t(1:length(y)/2),tout8(1:length(y)/2));
    title('Time Filter 8');
    subplot(9,2,17);
    plot(t(1:length(y)/2),tout9(1:length(y)/2));
    title('Time Filter 9');
    
    % Plot Freq Filters
    subplot(9,2,2);
    plot(f(1:length(y)),fout1(1:length(y)));
    title('Freq Filter 1');
    subplot(9,2,4);
    plot(f(1:length(y)),fout2(1:length(y)));
    title('Freq Filter 2');
    subplot(9,2,6);
    plot(f(1:length(y)),fout3(1:length(y)));
    title('Freq Filter 3');
    subplot(9,2,8);
    plot(f(1:length(y)),fout4(1:length(y)));
    title('Freq Filter 4');
    subplot(9,2,10);
    plot(f(1:length(y)),fout5(1:length(y)));
    title('Freq Filter 5');
    subplot(9,2,12);
    plot(f(1:length(y)),fout6(1:length(y)));
    title('Freq Filter 6');
    subplot(9,2,14);
    plot(f(1:length(y)),fout7(1:length(y)));
    title('Freq Filter 7');
    subplot(9,2,16);
    plot(f(1:length(y)),fout8(1:length(y)));
    title('Freq Filter 8');
    subplot(9,2,18);
    plot(f(1:length(y)),fout9(1:length(y)));
    title('Freq Filter 9');


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    
    % Audio path
    global path;
    
    global final_y;
    global fs;
    
    fullfile(path,'test.wav');
    audiowrite(fullfile(path,'test.wav'),final_y,fs);



% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    
    % Used y
    global y;
    % Used fs
    global fs;
    % Original Time Signal 
    global original_y;
    % Sampling Frequency  
    global original_fs;
    
    % Audio path
    global path;

    % Get Audio File Path
    [file,path] = uigetfile('*.wav');
    if isequal(file,0)
        disp('User selected Cancel');
    else
        disp(['User selected ', fullfile(path,file)]);
        
    % Read Audio File
    [original_y,original_fs] = audioread(file);
    y = original_y;
    fs = original_fs;
    end

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

set(hObject,'String',{'Constr Band Equiripple', 'Constr Least Squares', 'Equiripple','Generalized Equiripple', 'Least Squares', 'Window Chebyshev', 'Window Rectangular'});


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

set(hObject,'String',{'Butterworth', 'Chebyshev I', 'Chebyshev II'});


function initialize_data(hObject, eventdata, handles)

    disp('Initialize is called');
    
    % Sampling Freq
    global fs;
    
    % Order
    global n;
    
    % Nfft
    global Nfft;
    
    % Time Signal 
    global y;
    % Time Signal 
    global t;
    
    % Freq Signal 
    global y_fft;
    % Freq Signal 
    global f;
    
    % Filtered Time Signal 
    global fill_y;
    
    % Filtered Freq Signal 
    global fill_y_fft;
    
    % Filter Time Output
    global tout1;
    global tout2;
    global tout3;
    global tout4;
    global tout5;
    global tout6;
    global tout7;
    global tout8;
    global tout9;
    
    % Filter Freq Output
    global fout1;
    global fout2;
    global fout3;
    global fout4;
    global fout5;
    global fout6;
    global fout7;
    global fout8;
    global fout9;
    
    % Calculate Nfft
    Nfft=length(y);
    
    % Freq Signal
    y_fft=fftshift(fft(y)./(Nfft));
    
    % Check fs
    if(fs < 32000)
        fs = 32000;
    end    
    
    % Get Filter Order
    n = get(handles.edit1, 'String');
    n = str2double(n);
    
    disp('Freq Signal is calculated');
    
    % Check Pop Up Item
    item = get(handles.popupmenu1,'value');

    % Check if FIR or IIR and Do Filteration
    if (get(handles.radiobutton2,'Value') == 1)
        
        disp('Filter Type is selected');
        
        if(item == 1)
            tout1 = filter(FIR_Constr_band_equiripple_Lowpass(fs , n , 0 , 170) , y);
            tout2 = filter(FIR_Constr_band_equiripple_Bandpass(fs , n , 170 , 175 , 305 , 310) ,y);
            tout3 = filter(FIR_Constr_band_equiripple_Bandpass(fs , n , 310 , 315 , 595 , 600) ,y);
            tout4 = filter(FIR_Constr_band_equiripple_Bandpass(fs , n , 600 , 605 , 995 , 1000) ,y);
            tout5 = filter(FIR_Constr_band_equiripple_Bandpass(fs , n , 1000 , 1005 , 2995 , 3000) ,y);
            tout6 = filter(FIR_Constr_band_equiripple_Bandpass(fs , n , 3000 , 3005 , 5995 , 6000) ,y);
            tout7 = filter(FIR_Constr_band_equiripple_Bandpass(fs , n , 6000 , 6005 , 11995 , 12000) ,y);
            tout8 = filter(FIR_Constr_band_equiripple_Bandpass(fs , n , 12000 , 12005 , 13995 , 14000) ,y);
            tout9 = filter(FIR_Constr_band_equiripple_Highpass(fs , n , 14000 , 16000),y);
        elseif(item == 2)
            tout1 = filter(FIR_Constr_Least_squares_Lowpass(fs , n , 165 , 170) , y);
            tout2 = filter(FIR_Constr_Least_squares_Bandpass(fs , n , 170 , 310) ,y);
            tout3 = filter(FIR_Constr_Least_squares_Bandpass(fs , n , 310 , 600) ,y);
            tout4 = filter(FIR_Constr_Least_squares_Bandpass(fs , n , 600 , 1000) ,y);
            tout5 = filter(FIR_Constr_Least_squares_Bandpass(fs , n , 1000 , 3000) ,y);
            tout6 = filter(FIR_Constr_Least_squares_Bandpass(fs , n , 3000 , 6000) ,y);
            tout7 = filter(FIR_Constr_Least_squares_Bandpass(fs , n , 6000 , 12000) ,y);
            tout8 = filter(FIR_Constr_Least_squares_Bandpass(fs , n , 12000 , 14000) ,y);
            tout9 = filter(FIR_Constr_Least_squares_Highpass(fs , n , 14000),y);
        elseif(item == 3)
            tout1 = filter(FIR_Equiripple_Lowpass(fs , n , 0 , 170) , y);
            tout2 = filter(FIR_Equiripple_Bandpass(fs , n , 170 , 175 , 305 , 310) ,y);
            tout3 = filter(FIR_Equiripple_Bandpass(fs , n , 310 , 315 , 595 , 600) ,y);
            tout4 = filter(FIR_Equiripple_Bandpass(fs , n , 600 , 605 , 995 , 1000) ,y);
            tout5 = filter(FIR_Equiripple_Bandpass(fs , n , 1000 , 1005 , 2995 , 3000) ,y);
            tout6 = filter(FIR_Equiripple_Bandpass(fs , n , 3000 , 3005 , 5995 , 6000) ,y);
            tout7 = filter(FIR_Equiripple_Bandpass(fs , n , 6000 , 6005 , 11995 , 12000) ,y);
            tout8 = filter(FIR_Equiripple_Bandpass(fs , n , 12000 , 12005 , 13995 , 14000) ,y);
            tout9 = filter(FIR_Equiripple_Highpass(fs , n , 14000 , 16000),y);
        elseif(item == 4)
            tout1 = filter(FIR_Generalized_equiripple_Lowpass(fs , n , 0 , 170) , y);
            tout2 = filter(FIR_Generalized_equiripple_Bandpass(fs , n , 170 , 175 , 305 , 310) ,y);
            tout3 = filter(FIR_Generalized_equiripple_Bandpass(fs , n , 310 , 315 , 595 , 600) ,y);
            tout4 = filter(FIR_Generalized_equiripple_Bandpass(fs , n , 600 , 610 , 990 , 1000) ,y);
            tout5 = filter(FIR_Generalized_equiripple_Bandpass(fs , n , 1000 , 1005 , 2995 , 3000) ,y);
            tout6 = filter(FIR_Generalized_equiripple_Bandpass(fs , n , 3000 , 3005 , 5995 , 6000) ,y);
            tout7 = filter(FIR_Generalized_equiripple_Bandpass(fs , n , 6000 , 6005 , 11995 , 12000) ,y);
            tout8 = filter(FIR_Generalized_equiripple_Bandpass(fs , n , 12000 , 12005 , 13995 , 14000) ,y);
            tout9 = filter(FIR_Generalized_equiripple_Highpass(fs , n , 14000 , 16000),y);
        elseif(item == 5)
            tout1 = filter(FIR_Least_squares_Lowpass(fs , n , 165 , 170) , y);
            tout2 = filter(FIR_Least_squares_Bandpass(fs , n , 170 , 175 , 305 , 310) ,y);
            tout3 = filter(FIR_Least_squares_Bandpass(fs , n , 310 , 315 , 595 , 600) ,y);
            tout4 = filter(FIR_Least_squares_Bandpass(fs , n , 600 , 605 , 995 , 1000) ,y);
            tout5 = filter(FIR_Least_squares_Bandpass(fs , n , 1000 , 1005 , 2995 , 3000) ,y);
            tout6 = filter(FIR_Least_squares_Bandpass(fs , n , 3000 , 3005 , 5995 , 6000) ,y);
            tout7 = filter(FIR_Least_squares_Bandpass(fs , n , 6000 , 6005 , 11995 , 12000) ,y);
            tout8 = filter(FIR_Least_squares_Bandpass(fs , n , 12000 , 12005 , 13995 , 14000) ,y);
            tout9 = filter(FIR_Least_squares_Highpass(fs , n , 14000 , 16000),y);
        elseif(item == 6)
            tout1 = filter(FIR_Window_Chebyshev_Lowpass(fs , n , 170) , y);
            tout2 = filter(FIR_Window_Chebyshev_Bandpass(fs , n , 170 , 310) ,y);
            tout3 = filter(FIR_Window_Chebyshev_Bandpass(fs , n , 310 , 600) ,y);
            tout4 = filter(FIR_Window_Chebyshev_Bandpass(fs , n , 600 , 1000) ,y);
            tout5 = filter(FIR_Window_Chebyshev_Bandpass(fs , n , 1000 , 3000) ,y);
            tout6 = filter(FIR_Window_Chebyshev_Bandpass(fs , n , 3000 , 6000) ,y);
            tout7 = filter(FIR_Window_Chebyshev_Bandpass(fs , n , 6000 , 12000) ,y);
            tout8 = filter(FIR_Window_Chebyshev_Bandpass(fs , n , 12000 , 14000) ,y);
            tout9 = filter(FIR_Window_Chebyshev_Highpass(fs , n , 14000),y);
        elseif(item == 7)
            tout1 = filter(FIR_Window_Rectangular_Lowpass(fs , n , 170) , y);
            tout2 = filter(FIR_Window_Rectangular_Bandpass(fs , n , 170 , 310) ,y);
            tout3 = filter(FIR_Window_Rectangular_Bandpass(fs , n , 310 , 600) ,y);
            tout4 = filter(FIR_Window_Rectangular_Bandpass(fs , n , 600 , 1000) ,y);
            tout5 = filter(FIR_Window_Rectangular_Bandpass(fs , n , 1000 , 3000) ,y);
            tout6 = filter(FIR_Window_Rectangular_Bandpass(fs , n , 3000 , 6000) ,y);
            tout7 = filter(FIR_Window_Rectangular_Bandpass(fs , n , 6000 , 12000) ,y);
            tout8 = filter(FIR_Window_Rectangular_Bandpass(fs , n , 12000 , 14000) ,y);
            tout9 = filter(FIR_Window_Rectangular_Highpass(fs , n , 14000),y);
        end
    else  
        if(item == 1)
            tout1 = filter(IIR_Butterworth_Lowpass(fs , n , 170) , y);
            tout2 = filter(IIR_Butterworth_Bandpass(fs , n , 170 , 310) ,y);
            tout3 = filter(IIR_Butterworth_Bandpass(fs , n , 310 , 600) ,y);
            tout4 = filter(IIR_Butterworth_Bandpass(fs , n , 600 , 1000) ,y);
            tout5 = filter(IIR_Butterworth_Bandpass(fs , n , 1000 , 3000) ,y);
            tout6 = filter(IIR_Butterworth_Bandpass(fs , n , 3000 , 6000) ,y);
            tout7 = filter(IIR_Butterworth_Bandpass(fs , n , 6000 , 12000) ,y);
            tout8 = filter(IIR_Butterworth_Bandpass(fs , n , 12000 , 14000) ,y);
            tout9 = filter(IIR_Butterworth_Highpass(fs , n , 14000),y);
        elseif(item == 2)
            tout1 = filter(IIR_Chebyshev_type_1_Lowpass(fs , n , 170) , y);
            tout2 = filter(IIR_Chebyshev_type_1_Bandpass(fs , n , 170 , 310) ,y);
            tout3 = filter(IIR_Chebyshev_type_1_Bandpass(fs , n , 310 , 600) ,y);
            tout4 = filter(IIR_Chebyshev_type_1_Bandpass(fs , n , 600 , 1000) ,y);
            tout5 = filter(IIR_Chebyshev_type_1_Bandpass(fs , n , 1000 , 3000) ,y);
            tout6 = filter(IIR_Chebyshev_type_1_Bandpass(fs , n , 3000 , 6000) ,y);
            tout7 = filter(IIR_Chebyshev_type_1_Bandpass(fs , n , 6000 , 12000) ,y);
            tout8 = filter(IIR_Chebyshev_type_1_Bandpass(fs , n , 12000 , 14000) ,y);
            tout9 = filter(IIR_Chebyshev_type_1_Highpass(fs , n , 14000),y);
        elseif(item == 3)
            tout1 = filter(IIR_Chebyshev_type_2_Lowpass(fs , n , 170) , y);
            tout2 = filter(IIR_Chebyshev_type_2_Bandpass(fs , n , 170 , 310) ,y);
            tout3 = filter(IIR_Chebyshev_type_2_Bandpass(fs , n , 310 , 600) ,y);
            tout4 = filter(IIR_Chebyshev_type_2_Bandpass(fs , n , 600 , 1000) ,y);
            tout5 = filter(IIR_Chebyshev_type_2_Bandpass(fs , n , 1000 , 3000) ,y);
            tout6 = filter(IIR_Chebyshev_type_2_Bandpass(fs , n , 3000 , 6000) ,y);
            tout7 = filter(IIR_Chebyshev_type_2_Bandpass(fs , n , 6000 , 12000) ,y);
            tout8 = filter(IIR_Chebyshev_type_2_Bandpass(fs , n , 12000 , 14000) ,y);
            tout9 = filter(IIR_Chebyshev_type_2_Highpass(fs , n , 14000),y);
        end
    end
    
    disp('Filitiration is done');
    
    % Calculate Freq Filters
    fout1=fftshift(fft(tout1)./(Nfft));
    fout2=fftshift(fft(tout2)./(Nfft));
    fout3=fftshift(fft(tout3)./(Nfft));
    fout4=fftshift(fft(tout4)./(Nfft));
    fout5=fftshift(fft(tout5)./(Nfft));
    fout6=fftshift(fft(tout6)./(Nfft));
    fout7=fftshift(fft(tout7)./(Nfft));
    fout8=fftshift(fft(tout8)./(Nfft));
    fout9=fftshift(fft(tout9)./(Nfft));
    
    disp('Freq filtiration is done');
   
function amplify_signal(hObject, eventdata, handles)

    disp('Amplify Signal is called');
    
    % Nfft
    global Nfft;

    % Filter Time Output
    global tout1;
    global tout2;
    global tout3;
    global tout4;
    global tout5;
    global tout6;
    global tout7;
    global tout8;
    global tout9;
    
    % Filter Freq Output
    global fout1;
    global fout2;
    global fout3;
    global fout4;
    global fout5;
    global fout6;
    global fout7;
    global fout8;
    global fout9;

    % Get Slider Values
    value1 = get( handles.slider1 , 'Value') * 20;
    value2 = get( handles.slider3 , 'Value') * 20;
    value3 = get( handles.slider4 , 'Value') * 20;
    value4 = get( handles.slider5 , 'Value') * 20;
    value5 = get( handles.slider6 , 'Value') * 20;
    value6 = get( handles.slider7 , 'Value') * 20;
    value7 = get( handles.slider8 , 'Value') * 20;
    value8 = get( handles.slider9 , 'Value') * 20;
    value9 = get( handles.slider10 , 'Value') * 20;
    
    disp('Gains are Fetched');
    
    % Amplifiy Time Filters
    if(value1 ~= 0)
      tout1 = tout1 .* value1;  
    end
    if(value2 ~= 0)
      tout2 = tout2 .* value2;  
    end
    if(value3 ~= 0)
      tout3 = tout3 .* value3;  
    end
    if(value4 ~= 0)
      tout4 = tout4 .* value4;  
    end
    if(value5 ~= 0)
      tout5 = tout5 .* value5;  
    end
    if(value6 ~= 0)
      tout6 = tout6 .* value6;  
    end
    if(value7 ~= 0)
      tout7 = tout7 .* value7;  
    end
    if(value8 ~= 0)
      tout8 = tout8 .* value8;  
    end
    if(value9 ~= 0)
      tout9 = tout9 .* value9;  
    end
    
    disp('Time Signal Filters are amplified');
    
    % Calculate Freq Filters
    fout1=fftshift(fft(tout1)./(Nfft));
    fout2=fftshift(fft(tout2)./(Nfft));
    fout3=fftshift(fft(tout3)./(Nfft));
    fout4=fftshift(fft(tout4)./(Nfft));
    fout5=fftshift(fft(tout5)./(Nfft));
    fout6=fftshift(fft(tout6)./(Nfft));
    fout7=fftshift(fft(tout7)./(Nfft));
    fout8=fftshift(fft(tout8)./(Nfft));
    fout9=fftshift(fft(tout9)./(Nfft));
    
    disp('Freq Signal Filters are amplified');

function add_filterd_signal(hObject, eventdata, handles) 

    disp('Add Signal is called');
    
    % Final Time Signal 
    global final_y;
    
    % Final Freq Signal
    global final_y_fft;
    
    % Nfft
    global Nfft;
    
    % Filter Time Output
    global tout1;
    global tout2;
    global tout3;
    global tout4;
    global tout5;
    global tout6;
    global tout7;
    global tout8;
    global tout9;

    % Add Time Signals
    final_y = tout1 + tout2 + tout3 + tout4 + tout5 + tout6 + tout7 +tout8 + tout9; 
    
    disp('Final Time Signal is calculated');
    
    final_y_fft = fftshift(fft(final_y)./(Nfft));
    
    disp('Final Freq Signal is calculated');