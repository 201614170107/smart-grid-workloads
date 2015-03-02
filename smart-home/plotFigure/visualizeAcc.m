
totalHomes = 311;

sample = textread(strcat('../processedData/microgrid/',num2str(1),'.txt'));

y = zeros(totalHomes, size(sample,1));

for i = 1: totalHomes
    strcat('../processedData/microgrid/',num2str(i),'.txt')
    y(i, :) = textread(strcat('../processedData/microgrid/',num2str(i),'.txt'));
end

acc = sum(y, 1);

figure

bar(acc);

