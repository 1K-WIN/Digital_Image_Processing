function [en_str] = sf_encode(in_str,symbols,codes)
    en_str = '';
    for ii = 1:length(in_str)
        for jj = 1:length(symbols)
            % Updating Encoded String according to Matched Symbols
            if(in_str(ii)==symbols(jj))
                en_str = [en_str,codes{jj}];
            end
        end
    end
end