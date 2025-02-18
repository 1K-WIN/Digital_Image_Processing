function [codes] = assign_codes(codes,probabilities)

    if(length(probabilities)==1)
        return;
    end

    % Even Partition into two groups
    number = length(probabilities);
    total = sum(probabilities);
    temp = 0;
    for ii = 1:number
        temp = temp + probabilities(ii);
        diff(ii) = temp-(total-temp);
    end
    [~,split_i] = min(abs(diff));

    % Assignment of single bit 0 or 1
    for jj = 1:split_i
        codes{jj} = [codes{jj} '0'];
    end
    for jj = (split_i+1):number
        codes{jj} = [codes{jj} '1'];
    end
    
    % Further Assignment (Recursive function call)
    codes(1:split_i) = assign_codes(codes(1:split_i), ...
        probabilities(1:split_i));
    codes((split_i+1):number) = assign_codes(codes((split_i+1):number), ...
        probabilities((split_i+1):number));
end