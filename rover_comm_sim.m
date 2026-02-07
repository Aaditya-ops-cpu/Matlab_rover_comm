clc;
clear;

numPackets = 30;
packetLossProb = 0.2;
minDelay = 0.1;
maxDelay = 1.5;

sentCount = 0;
receivedCount = 0;
droppedCount = 0;

delayLog = zeros(numPackets, 1);
statusLog = strings(numPackets, 1);

xLog = zeros(numPackets, 1);
yLog = zeros(numPackets, 1);
confLog = zeros(numPackets, 1);
timeLog = strings(numPackets, 1);

fprintf("===== THREAT PACKET COMMUNICATION SIMULATION =====\n");

for i = 1:numPackets
    sentCount = sentCount + 1;

    % Threat packet generation
    x = randi([0 100]);
    y = randi([0 100]);
    conf = rand();  % 0 to 1 confidence
    timestamp = string(datetime("now"));

    xLog(i) = x;
    yLog(i) = y;
    confLog(i) = conf;
    timeLog(i) = timestamp;

    % Delay simulation
    delay = minDelay + (maxDelay - minDelay) * rand();
    delayLog(i) = delay;

    % Packet loss simulation
    if rand() < packetLossProb
        droppedCount = droppedCount + 1;
        statusLog(i) = "DROPPED";
        fprintf("[Packet %d] (x=%d,y=%d,conf=%.2f) Delay=%.2fs STATUS=DROPPED\n", ...
            i, x, y, conf, delay);
        continue;
    end

    pause(delay);
    receivedCount = receivedCount + 1;
    statusLog(i) = "DELIVERED";

    fprintf("[Packet %d] (x=%d,y=%d,conf=%.2f) Delay=%.2fs STATUS=DELIVERED\n", ...
        i, x, y, conf, delay);
end

lossRate = (droppedCount / sentCount) * 100;
avgDelay = mean(delayLog(statusLog == "DELIVERED"));

fprintf("\n===== METRICS =====\n");
fprintf("Sent: %d\nDelivered: %d\nDropped: %d\nLoss Rate: %.2f%%\nAvg Delay: %.2fs\n", ...
    sentCount, receivedCount, droppedCount, lossRate, avgDelay);

T = table((1:numPackets)', xLog, yLog, confLog, timeLog, delayLog, statusLog, ...
    'VariableNames', {'PacketID','X','Y','Confidence','Timestamp','DelaySeconds','Status'});

disp("===== PACKET TABLE =====");
disp(T);

writetable(T, "threat_packet_log.csv");

figure;
plot(delayLog, '-o');
xlabel("Packet Number");
ylabel("Delay (seconds)");
title("Threat Packet Communication Delay per Packet");
grid on;

saveas(gcf, "threat_delay_plot.png");