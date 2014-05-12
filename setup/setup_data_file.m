%setup_data_file.m
% set up files, directories

start_path=pwd;

if ~exist('filename','var')
    disp('Subject name not provided, using test as name');
    filename = sprintf('test');
end

%note: fileparts and fullfile would be better, os-independent way to do
%this!

if ispc
    if ~isdir('c:\data\mindreader')
        mkdir('c:\data\mindreader')
    end
    cd C:\data\mindreader
    dat_dir=sprintf('%s\\%s',pwd,filename);
elseif ismac
    if ~isdir('/data/mindreader')
        mkdir('/data/mindreader')
    end
    cd /data/mindreader
    dat_dir=sprintf('%s/%s',pwd,filename);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%

try
    if ~exist(dat_dir,'dir')
        mkdir(dat_dir)
    end
catch q
    Screen('closeall')
end

cd(filename)

% get file names
data_dir=dir(pwd);
dirnames={data_dir.name};

expr=sprintf('(\?<=%s.)\\d+',filename); %regexp to get number of run
runnames_cell=regexp(dirnames,expr,'match');
runnames_cell=runnames_cell(~cellfun(@isempty,runnames_cell)); %get rid of empties
runnames=cellfun(@str2double,runnames_cell);
if ~isempty(runnames)
    lastrun=max(runnames);
else
    lastrun=0;
end

fname_short=sprintf('%s.%d',filename,lastrun+1);
fname=sprintf('%s.mindreader.mat',fname_short);