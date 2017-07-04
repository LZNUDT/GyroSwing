clc;    %��������д���
clear;  %��չ�����

gyro_x = dlmread('X��.dat');                      %���ı��ж�ȡ���������ݣ���λ��deg/s�����ʣ�200Hz
gyro_y = dlmread('Y��.dat');
gyro_z = dlmread('Z��.dat');

gyro_x_zero = mean(gyro_x(1:12000, 3));           %����������ƫ
gyro_y_zero = mean(gyro_y(1:12000, 4));
gyro_z_zero = mean(gyro_z(1:12000, 5));

gyro_x_minus_zero = gyro_x(:, 3) - gyro_x_zero;   %���������ݼ�ȥ��ƫ
gyro_y_minus_zero = gyro_y(:, 4) - gyro_y_zero;
gyro_z_minus_zero = gyro_z(:, 5) - gyro_z_zero;

gyro_x_angle = cumsum(gyro_x_minus_zero) / 200;   %���������ݻ�����Ƕ�
gyro_y_angle = cumsum(gyro_y_minus_zero) / 200;
gyro_z_angle = cumsum(gyro_z_minus_zero) / 200;

gyro_x_time = (1:length(gyro_x_angle)) / 200;     %�����������ݵ�ʱ��
gyro_y_time = (1:length(gyro_y_angle)) / 200;
gyro_z_time = (1:length(gyro_z_angle)) / 200;

figure('name', '������X�����ݻ��ֽǶ�'); %������ͼ����
plot(gyro_x_time, gyro_x_angle);        %��ͼ
xlabel('Time:sec');                     %���X���ǩ
ylabel('Angle:deg');                    %���Y���ǩ
grid on;                                %���������

figure('name', '������Y�����ݻ��ֽǶ�'); %������ͼ����
plot(gyro_y_time, gyro_y_angle);        %��ͼ
xlabel('Time:sec');                     %���X���ǩ
ylabel('Angle:deg');                    %���Y���ǩ
grid on;                                %���������

figure('name', '������Z�����ݻ��ֽǶ�'); %������ͼ����
plot(gyro_z_time, gyro_z_angle);        %��ͼ
xlabel('Time:sec');                     %���X���ǩ
ylabel('Angle:deg');                    %���Y���ǩ
grid on;                                %���������
