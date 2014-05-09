function out = block_randomize(counts, trials)
% divide trials into blocks with counts of each trial type and randomize
% trials within blocks

nblocks = ceil(trials / sum(counts));
types = 1:length(counts);

% make a prototypical block with the right number of trials of each type
block = [];
for ind = 1:length(counts)
    block = [block types(ind) * ones(1, counts(ind))];
end
blocklen = length(block);

out = nan(1, trials);
offset = 0;
for ind = 1:nblocks
    out(offset + 1:offset + blocklen) = Shuffle(block);
    offset = offset + blocklen;
end

out = out(1:trials);