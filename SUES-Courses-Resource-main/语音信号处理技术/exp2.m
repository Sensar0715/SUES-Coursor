[signal,fs]=audioread('..../�����Ƶ�ļ�.wav');
signal = signal(:, 1);
framelength=512;
framenumber=fix(length(signal)/framelength);
M=15;
Y(1:2*framelength)=signal((M-1)*framelength+1: (M+1)*framelength);

% ��֡����
for i = 1:framenumber;
    framesignal(i, 1:framelength) = signal((i-1)*framelength+1:i*framelength);
end

for i = 1:framenumber;
    E(i) = 0;
    E(i) = sum(framesignal(i,:).^2);
end

% ��ȡ����֡
number = 0;
averE = sum(E) / length(E);     % ����ƽ������
T = averE;                      % ������ֵ
for i = 1:framenumber;
    if(E(i)>=T)                 % ������ֵΪ����֡
        number = number + 1;
        voiceE(number) = i;
    end
end

diffE = diff(voiceE);           

flag = 1;
voiceframe = voiceE(1);
N = 0;

while(flag);
    for i = 1:length(diffE) - 1;
        if(diffE(i) == 1)
            N = N + 1;
            if (N == 3)      % ����3֡�������� -> Ϊ������
                flag = 0;
            end
        elseif (diffE(i)~=1)
                voiceframe = voiceE(i+1);
            end
        end
end

startpoint = (voiceframe - 1) * framelength + 1;
endpoint = (voiceframe + 1) * framelength;

Selectsignal = signal(startpoint:endpoint);

subplot(4,1,1)
plot(Selectsignal(1:length(Selectsignal)/2))
title("��ȡ�������źŲ���")

T = 0.5 * max(Selectsignal);    % ����ֵ��50%��Ϊ������ƽ
% ��������
for i = 1:length(Selectsignal)
    if(Selectsignal(i) > T)
        Selectsignal(i) = Selectsignal(i) - T;
    elseif(Selectsignal(i) < -T)
        Selectsignal(i) = Selectsignal(i) + T;
    else
        Selectsignal(i) = 0;
    end
end
subplot(4,1,2)
plot(Selectsignal(1:length(Selectsignal)/2))
title("������������")

% ����ƽ����
for i = 1:length(Selectsignal)
    if(Selectsignal(i)>0)
        Selectsignal(i) = 1;
    elseif (Selectsignal(i)<0)
        Selectsignal(i) = -1;
    else
        Selectsignal(i) = 0;
    end
end

subplot(4, 1, 3)
plot(Selectsignal(1:length(Selectsignal)/2))
title("����ƽ��������")

% ����ؼ���
framelength = length(Selectsignal) / 2;
for i = 1:framelength;
    R(i) = 0;
    for j = 1:framelength;
        R(i) = R(i) + Selectsignal(j) * Selectsignal(i+j);
    end
end

subplot(4, 1, 4)
plot(R);
title("���������������غ���");


[yvalue,xvalue]=max(R(20:length(R)));
pitchperiod = xvalue + 19;      % ��������
Pitchvalue=fs/pitchperiod;      % ����Ƶ��
if (Pitchvalue>0 && Pitchvalue<200)
    result = '��'
else
    result = 'Ů'
end

        


