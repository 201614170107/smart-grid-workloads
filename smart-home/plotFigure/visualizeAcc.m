
totalHomes = 311;

sample = textread(strcat('../processedData/microgrid/',num2str(1),'.txt'));

y = zeros(totalHomes, size(sample,1));

for i = 1: totalHomes
    strcat('../processedData/microgrid/',num2str(i),'.txt')
    y(i, :) = textread(strcat('../processedData/microgrid/',num2str(i),'.txt'));
end

acc = sum(y, 1);

figure1 = figure;
set(figure1,'units','normalized','outerposition',[0 0 1 1]);

axes1 = axes('Parent',figure1);
box(axes1,'on');
hold(axes1,'all');
set(axes1,'FontSize',30,'FontWeight','bold');

bar(acc);

%set x, y Label
set(get(axes1,'XLabel'),'String','Time (5 minutes)','FontSize',30,'FontWeight','bold');
set(get(axes1,'YLabel'),'String','Consumption power (kW)','FontSize',30,'FontWeight','bold');



%save to file
set(gcf, 'PaperPosition', [0 0 13 7]); %Position plot at left hand corner with width 5 and height 5.
set(gcf, 'PaperSize', [13 7]); %Set the paper to have width 5 and height 5.
%saveas(gcf, 'SolarTrace_High', 'pdf') %Save figure
saveas(gcf, strcat('.\figures\AccHomeUsageTrace_', num2str(totalHomes)), 'pdf') %Save figure  
saveas(gca, strcat('.\figures\AccHomeUsageTrace_', num2str(totalHomes), '.eps'),'psc2') %Save figure 