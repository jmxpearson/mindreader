%set random number seed
if exist('seed','var')
    RandStream.setDefaultStream(RandStream('mt19937ar','seed',seed));
else
    seed=sum(100*clock);
    RandStream.setDefaultStream(RandStream('mt19937ar','seed',seed));
end