function [File_Name,File_Ext,Ext_Final_pos]=Detect_ext(Full_File_Name)
% Full_File_Name: An cell array for file name
% find where the ext start

Ext_pos=strfind(Full_File_Name,'.');
Ext_Final_pos=cellfun(@(lastpos) {lastpos(1,end)}, Ext_pos); % check the last position of '.'

try
    % extract file name and save as cell array
    File_Name=cellfun(@(extract_name,extract_pos) extractBefore(extract_name,extract_pos)...
        , Full_File_Name, Ext_Final_pos,'UniformOutput', false);
    % extract file extension and save as cell array
    File_Ext=cellfun(@(extract_name,extract_pos) extractAfter(extract_name,extract_pos-1)...
        , Full_File_Name, Ext_Final_pos,'UniformOutput', false);

catch  
    % using older version of function to extract file name & extension
    [~,File_Name,File_Ext]=cellfun(@(extract_name) fileparts(extract_name)...
        , Full_File_Name, 'UniformOutput', false);  
end



% disp(File_Ext)