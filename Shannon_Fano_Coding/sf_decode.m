function [de_str] = sf_decode(en_str,symbols,codes)
    de_str = '';
    temp = '';
    for ii = 1:length(en_str)
        temp = [temp en_str(ii)];
        for jj = 1:length(codes)
            % If codeword matches, Decoding symbols for string
            if(strcmp(temp,codes{jj}))
                de_str = [de_str,symbols(jj)];
                temp = '';
            end
        end
    end
end