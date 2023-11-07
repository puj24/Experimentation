Labxls = readmatrix('Control Lab 4.xlsx');
% f_ticks = [85,100,153,194,...
% 250,300,550,650,700,950,1000,1500,2132,3235,3313,5000]
f_ticks = logspace(1, 4,10)
g_ticks = logspace(-1,2,10)
f = Labxls(:,1);
phase = Labxls(:,4);
logf = 20*log(Labxls(:,1));  %20log|f|
gain = Labxls(:,3)/Labxls(:,2);
loggain = 20*log(abs(logf)) ;

% for i = 1:61
%     if( Labxls(i, 2) > 100)
%         Labxls(i, 2) = Labxls(i,2)*1e-3
%     end
%     if( Labxls(i, 3) > 100)
%         Labxls(i, 3) = Labxls(i,3)*1e-3
%     end
% end

% Labxls(i,5) = gain
% Labxls(:,6) = logf    %20log|f|
% Labxls(:,7) = loggain %20log|gain|

tiledlayout(2,1)
ax1 = nexttile;
% plot(ax1, logf, loggain)  %magnitude plot
loglog(f, gain)
yline(1)
title(ax1, 'Magnitude plot')
ylabel(ax1, '20log|Gain|')
xlabel(ax1, '20log|f|')
Ax = gca
set(gca, 'ytick', g_ticks)
set(gca, 'xtick', f_ticks, 'xticklabelrotation', 30)
xtickformat('%.0f')

ax2 = nexttile;
% plot(ax2, logf, phase)  %phase plot
semilogx(f, phase)
yline(-180)
title('Phase plot')
ylabel(ax2,'phase')
xlabel(ax2, '20log|f|')
Ax = gca
set(gca, 'xtick', f_ticks, 'xticklabelrotation', 30)
xtickformat('%.0f')
% writematrix(Labxls, 'Control Lab 4.xlsx', 'Sheet', 1, 'Range', 'A2')