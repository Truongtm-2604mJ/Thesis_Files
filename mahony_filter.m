% fid = fopen('C:\Users\VTX\Desktop\Angle_XY.txt', 'r');
fid = fopen('C:\Users\VTX\Desktop\lan14_dynamic_2.txt', 'r');
data = textscan(fid, '%s %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f');
% data = textscan(fid, '%s %f %f %f %f %f %f %f %f %f %f %f %f');
% Bước 2: Lấy kích thước mẫu (n) của dữ liệu
  % Tổng số phần tử trong dữ liệu
fclose(fid);
n_total = length(data{2});
% mahony - kalman - raw - acc
data_in = zeros(n_total,15);
data_in(:,1) = data{2};
data_in(:,2) = data{5};
data_in(:,3) = data{8};

data_in(:,4) = data{3};
data_in(:,5) = data{6};
data_in(:,6) = data{9};

data_in(:,7) = data{4};
data_in(:,8) = data{7};
data_in(:,9) = data{10};

data_in(:,10) = data{11};
data_in(:,11) = data{14};

data_in(:,12) = data{12};
data_in(:,13) = data{15};

data_in(:,14) = data{13};
data_in(:,15) = data{16};


data1 = smoothdata(data_in);
data_in = data1;

N=n_total;
n = 1:N;
n=n*50/1000;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
display(n,data_in(1:N,1),data_in(1:N,2),data_in(1:N,3));
ylabel('Roll(°)', 'FontSize', 12);  % Nhãn trục y
sgtitle('Đồ thị góc Roll khi bàn đứng yên', 'FontSize', 16, 'FontWeight', 'bold');

display(n,data_in(1:N,4),data_in(1:N,5),data_in(1:N,6));
ylabel('Pitch(°)', 'FontSize', 12);  % Nhãn trục y
sgtitle('Đồ thị góc Pitch khi bàn đứng yên', 'FontSize', 16, 'FontWeight', 'bold');

display(n,data_in(1:N,7),data_in(1:N,8),data_in(1:N,9));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
display1(n,data_in(1:N,10),data_in(1:N,11));
ylabel('Vận tốc góc trục X(°/s)', 'FontSize', 12);  % Nhãn trục y
sgtitle('Vận tốc góc X khi bàn đứng yên', 'FontSize', 16, 'FontWeight', 'bold');

display1(n,data_in(1:N,12),data_in(1:N,13));
ylabel('Vận tốc góc trục Y(°/s)', 'FontSize', 12);  % Nhãn trục y
sgtitle('Vận tốc góc Y khi bàn đứng yên', 'FontSize', 16, 'FontWeight', 'bold');

display1(n,data_in(1:N,14),data_in(1:N,15));
ylabel('Vận tốc góc trục Z(°/s)', 'FontSize', 12);  % Nhãn trục y
sgtitle('Vận tốc góc Z khi bàn đứng yên', 'FontSize', 16, 'FontWeight', 'bold');


function display(x,y,t,k)
    figure;
    plot(x,k,'-k', 'LineWidth', 1.25);  
    hold on;
    %plot(x, z,'b', 'LineWidth', 1.25);  
    plot(x,t,'-b', 'LineWidth', 1.25);
    plot(x, y,'--r', 'LineWidth', 1.25);
    xlabel('T(s)', 'FontSize', 12);  % Nhãn trục x
    legend('Góc từ Accelerometer','Góc tính từ Gyro','Góc sau filter', 'Location', 'best');  % Thêm chú thích
    grid on;  % Hiển thị lưới
end
function display1(x,y,k)
    figure;
    plot(x,k,'-b', 'LineWidth', 1.25);  
    hold on;
    %plot(x, z,'b', 'LineWidth', 1.25);  
    plot(x, y,'r', 'LineWidth', 1.25);
    xlabel('T(s)', 'FontSize', 12);  % Nhãn trục x
    legend('Vận tốc góc thô','Vận tốc góc sau Kalman', 'Location', 'best');  % Thêm chú thích
    grid on;  % Hiển thị lưới
end