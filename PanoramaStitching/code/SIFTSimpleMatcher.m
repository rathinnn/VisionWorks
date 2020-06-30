function match = SIFTSimpleMatcher(descriptor1, descriptor2, thresh)

    if ~exist('thresh', 'var'),
        thresh = 0.7;
    end

    match = [];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                              %
%                                YOUR CODE HERE:                               %
%                                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[N1 col] = size(descriptor1);
[N2 col] = size(descriptor2);

for i = 1 : N1 
    descriptor1_tile = repmat(descriptor1(i,:), N2, 1);   
    d = sqrt(sum((descriptor1_tile - descriptor2).^2, 2));    % Euclidean distance
    
    [sort_d, idx] = sort(d);                 % sorting
    if sort_d(1) < (sort_d(2) * thresh)     % threshould checking
        match = [ match ; [i, idx(1)] ]; 
    end    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                              %
%                                 END YOUR CODE                                %
%                                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
