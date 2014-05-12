% handle input from arguments, set variable defaults
if mod(nargin,2)~=0
    warning('Number of arguments must be even.')
end

for ind=1:2:nargin
    varstr=varargin{ind};
    varval=varargin{ind+1};
    
    if ~ischar(varstr)
        warning('First input in pair must be a string.')
    end
    
    switch varstr
        case 'outfile'
            filename=varval;
    end
end

%if not all variables are supplied use some defaults

if ~exist('filename','var')
    filename='test';
end

%add current directory to path
addpath(pwd) %make sure to grab local copies of scripts
