% Created on 13/02/25
% Created by Sahastrajit B., BT22ECE093
% Fourth Practical ~ Implementation of Shannon-Fano Coding.


clc
clear all
close all

% Creating Symbols, their Probabilities and Input String
symbols = ['P', 'Q', 'R', 'S', 'T'];
probabilities = [0.08, 0.36, 0.22, 0.22, 0.12];
str_example = 'PTRQS';

% Arranging in descending order
[sorted_prob, index] = sort(probabilities, 'descend');
sorted_symbols = symbols(index);

% Creating empty Codewords for all Symbols
codewords = cell(size(sorted_prob));
codewords(:) = {''};

% Assigning codewords
codewords = assign_codes(codewords,sorted_prob);

% Rearranging Codewords according to given list of Symbols
[~, reverse_idx] = sort(index);
codes = codewords(reverse_idx);

% Encoding and Decoding of given Input String
encoded_string = sf_encode(str_example,symbols,codes);
decoded_string = sf_decode(encoded_string,symbols,codes);

% Printing Output~
fprintf('\n Symbol | Probability | Shannon-Fano Code |\n');

for i = 1:length(symbols)
    fprintf('   %c    |    %.2f     |      %s          |\n', ...
        symbols(i), probabilities(i), codes{i});
end

fprintf('\n\nOriginal String: %s\n', str_example);
fprintf('=> Encoded String: %s\n', encoded_string);
fprintf('=> Decoded String: %s\n', decoded_string);
