close all
Data = dfbf_sigOnly;
importantFrames = identifySequenceFragments(Data, skipFrames);
% fig1 = figure(1);
% set(fig1,'Position', [300, 300, 2000, 600]);
% 
% %All cells
% subplot(2,2,1)
% A = squeeze(sum(importantFrames, 3)); %sum along frames
% imagesc(A)
% title('Sum of Significant Frames - Whole Trial')
% xlabel('Trials')
% ylabel('All Cells')
% %Time-locked cells
% subplot(2,2,3)
% B = A(find(timeLockedCells),:);
% imagesc(B)
% title('Sum of Significant Frames - Whole Trial')
% colormap('hot')
% xlabel('Trials')
% ylabel('Time-Locked Cells')
% 
% %All cells
% subplot(2,2,2)
% C = squeeze(sum(importantFrames(:,:,101:120), 3)); %sum of trials, for the stimulus window
% imagesc(C)
% title('Sum of Significant Frames - Stimulus Window (CS: 116)')
% xlabel('Trials')
% ylabel('All Cells')
% %Time-locked cells
% subplot(2,2,4)
% D = C(find(timeLockedCells),:);
% imagesc(D)
% colormap('hot')
% xlabel('Trials')
% ylabel('Time-Locked Cells')

fig2 = figure(2);
set(fig2,'Position', [300, 300, 2000, 600]);
%All cells
subplot(5,1,1:2)
C = squeeze(sum(importantFrames(:,:,111:120), 3)); %sum of trials, for the stimulus window
imagesc(C)
title('Sum of Significant Frames - Stimulus Window (111:120)')
%xlabel('Trials')
ylabel('All Cells')
%Not Time-locked cells
subplot(5,1,3:4)
D = C(find(~timeLockedCells),:);
imagesc(D)
%colormap('hot')
%xlabel('Trials')
ylabel('Not Time-Locked Cells')
%Time-locked cells
subplot(5,1,5)
E = C(find(timeLockedCells),:);
imagesc(E)
colormap('hot')
xlabel('Trials')
ylabel('Time-Locked Cells')

fig3 = figure(3);
set(fig3,'Position', [300, 300, 2000, 600]);
%All cells
subplot(3,1,1)
C = squeeze(sum(importantFrames(:,:,111:124), 3)); %sum of trials, for the stimulus window (no puff frame)
plot(sum(C,1), 'blue', 'LineWidth', 2)
hold on
m = mean(sum(C,1));
x = 1:60;
plot(x,m, 'r*')
title('Sum of Significant Frames - All Cells')
%xlabel('Trials')
ylabel('A.U.')
legend({'Sum'; 'Mean'})
%Not Time-locked cells
subplot(3,1,2)
D = C(find(~timeLockedCells),:);
plot(sum(D,1), 'blue', 'LineWidth', 2)
hold on
m = mean(sum(D,1));
x = 1:60;
plot(x,m, 'r*')
title('Sum of Significant Frames - Not Time-Locked Cells')
%colormap('hot')
%xlabel('Trials')
ylabel('A.U.')
legend({'Sum'; 'Mean'})

%Time-locked cells
subplot(3,1,3)
E = C(find(timeLockedCells),:);
plot(sum(E,1), 'blue', 'LineWidth', 2)
hold on
m = mean(sum(E,1));
x = 1:60;
plot(x,m, 'r*')
title('Sum of Significant Frames - Time-Locked Cells')
%colormap('hot')
ylabel('A.U.')
legend({'Sum'; 'Mean'})
