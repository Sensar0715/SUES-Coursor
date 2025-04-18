clc
clear

imagesignal = imread('./���ˮӡͼƬ.bmp');
imagesignal = double(imagesignal);
imagesignal = im2bw(imagesignal, 0.7);
imagesignal = imresize(imagesignal, [128 128]);
watermarking = imagesignal;

subplot(2,2,1)
imshow(imagesignal)
title("ԭʼˮӡ")

% ͼƬ��ά
piexnum = 1;
for j=1:128
    for i=1:128
        waterimage_y(piexnum, 1) = watermarking(i, j);
        piexnum = piexnum + 1;
    end
end
waterimage_l = size(waterimage_y, 1);

[orignalwav,fs]=audioread('./�����Ƶ�ļ�����ˮӡǶ����Ƶ�.wav');
orignalwav = orignalwav(:, 1);
[c0, d0] = dwt(orignalwav, 'haar');
subplot(2,2,3)
plot(orignalwav)
title("ԭʼ��Ƶ�ź�")

for i=1:waterimage_l
    c0(i) = c0(i) * (1 + 0.1 * waterimage_y(i));
end
emmedsignal = idwt(c0, d0, 'haar');
subplot(2,2,4)
plot(emmedsignal)
title("Ƕ��ˮӡ�����Ƶ�ź�")

[embedc0, embedd0] = dwt(emmedsignal, 'haar');
[c0, d0] = dwt(orignalwav, 'haar');
for i=1:waterimage_l
    newwater(i) = (embedc0(i)/c0(i)-1.0)/0.1;
end 

ww = 1;
for j=1:128
    for i=1:128
        newwaterimage(i, j)=newwater(ww);
        ww = ww+1;
    end
end

subplot(2,2,2)
imshow(logical(newwaterimage))
title("��ȡ����ˮӡ")

