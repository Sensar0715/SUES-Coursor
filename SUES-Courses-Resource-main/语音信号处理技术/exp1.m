clc
clear

[x,fs]=audioread('...../�����Ƶ�ļ�.wav');
x = x(:, 1);
framelength=512;   % Խ��Խƽ��
framenumber=fix(length(x)/framelength);

% �����ʱ����
for i=1:framenumber;
   E(i)=0;
   for j=(framelength*(i-1)+1):1:framelength*(i);
       E(i)=E(i)+x(j) ^2;  
   end;  
end;

totaltime=length(x)/fs;
for i=1:length(x);
    pointtime(i)=totaltime*i/length(x);
end
for i=1:framenumber;
    frametime(i)=totaltime*i/framenumber;
end

subplot(3,1,1)
plot(pointtime,x);
title("ԭʼ��������")

subplot(3,1,2)
plot(frametime,E);
MeanE = mean(E(1:10));
VarE  = std(E(1:10));
ET = MeanE + VarE;
% 10*ETΪ��ֵ������
line([0 totaltime], [10*ET 10*ET],'color','g','LineWidth',1);
title("������ʱ����")

% ���ֽ���
flag = 0;   % ���ϴ�����ֵ�����´�����ֵ ��־
lineset = -1;
for i=1:framenumber;
    if (E(i) > 10*ET && flag == 0)  % ���ϴ�����ֵ��Ϊ���
        line([frametime(i) frametime(i)], [0 max(E)],'color','r','LineWidth',2);
        lineset = [lineset frametime(i)];        % �ֽ���x����, ���´λ���
        flag = 1;
    end
    if (E(i) < 10*ET && flag == 1)  % ���´�����ֵ��Ϊ�յ�
        line([frametime(i) frametime(i)], [0 max(E)],'color','r','LineWidth',2);
        lineset = [lineset frametime(i)];
        flag = 0; 
    end
end
lineset = lineset(2:end);

subplot(3,1,3)
plot(pointtime,x);

% ���ֽ���
for i=1:length(lineset);
    line([lineset(i) lineset(i)], [-max(x)-0.5 max(x)+0.5],'color','r','LineWidth',2);
end
title("ʶ�����������")


