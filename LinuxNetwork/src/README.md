[image-id-a]: images/VM-save-virtual-machine-state-1.png
[image-id-b]: images/VM-save-virtual-machine-state-2.png
[image-id-с]: images/VM-save-virtual-machine-state-3.png
[image-id-1]: images/1-1-1-ipcalc.png
[image-id-2]: images/1-1-2-ipcalc.png
[image-id-3]: images/1-1-2-ipcalc-15.png
[image-id-4]: images/1-1-2-ipcalc-28.png
[image-id-5]: images/1-1-3-ipcalc-8.png
[image-id-6]: images/1-1-3-ipcalc-16.png
[image-id-7]: images/1-1-3-ipcalc-23.png
[image-id-8]: images/1-1-3-ipcalc-4.png
[image-id-9]: images/2-ip-a.png
[image-id-10]: images/2-netplan.png
[image-id-11]: images/2-ip-r-add.png
[image-id-12]: images/2-2-netplan.png
[image-id-13]: images/3-iperf3.png
[image-id-14]: images/4-iptables.png
[image-id-15]: images/4-firewall-sh.png
[image-id-16]: images/4-ping-nmap.png
[image-id-17]: images/5-network.png
[image-id-18]: images/5-netplan-r1-r2.png
[image-id-19]: images/5-netplan-ws11-ws22-ws21.png
[image-id-20]: images/5-netplan-r1-r2-ip-4-a.png
[image-id-21]: images/5-netplan-ws11-ws22-ws21-ip-4-a.png
[image-id-22]: images/5-ping-r1-ws11-ws22-ws21.png
[image-id-23]: images/5-r1-r2-sysctl.png
[image-id-24]: images/5-r1-r2-sysctl-conf.png
[image-id-25]: images/5-netplan-ws11-ws22-ws21-default.png
[image-id-26]: images/5-netplan-ws11-ws22-ws21-default-ip-r.png
[image-id-27]: images/5-ws11-ping-r2.png
[image-id-28]: images/5-r1-r2-static.png
[image-id-29]: images/5-r1-r2-static-ip-r.png
[image-id-30]: images/5-ws11-netmask.png
[image-id-31]: images/5-r1-tcpdump-ws11-traceroute.png
[image-id-32]: images/5-r1-tcpdump-icmp-ws11-ping.png
[image-id-33]: images/6-r2-dhcp-dhcpd-dhcpd-conf.png
[image-id-34]: images/6-r2-resolv-conf.png
[image-id-35]: images/6-r2-restart-dhcp-ws21-reboot-ip-a.png
[image-id-36]: images/6-ping-ws22-ws21.png
[image-id-37]: images/6-ws11-macaddress.png
[image-id-38]: images/6-r1-dhcp-dhcpd-dhcpd-conf.png
[image-id-39]: images/6-r1-resolv-conf.png
[image-id-40]: images/6-r1-restart-dhcp-ws11-reboot-ip-a.png
[image-id-41]: images/6-ws21-ping-a-before.png
[image-id-42]: images/6-ws21-ping-a-after.png
[image-id-43]: images/7-apache2-ws22-r1.png
[image-id-44]: images/7-apache2-ws22-r1-start.png
[image-id-45]: images/7-r2-rules.png
[image-id-46]: images/7-r2-rules-start.png
[image-id-47]: images/7-ws22-no-ping.png
[image-id-48]: images/7-r2-new-rules.png
[image-id-49]: images/7-r2-new-rules-start.png
[image-id-50]: images/7-ws22-yes-ping.png
[image-id-51]: images/7-r2-new-2-rules.png
[image-id-52]: images/7-r2-new-2-rules-start.png
[image-id-53]: images/7-ws22-snat.png
[image-id-54]: images/7-r1-dnat.png
[image-id-55]: images/8-firewall-start.png
[image-id-56]: images/8-apache2-conf.png
[image-id-57]: images/8-ws11-22-21-ssh-sshd-conf.png
[image-id-58]: images/8-ws11-22-21-ssh-sshd-conf-2.png
[image-id-59]: images/8-ws11-22-21-sshd-status-3.png
[image-id-60]: images/8-ws21-local-tcp.png
[image-id-61]: images/8-ws11-remote-tcp.png
[image-id-62]: images/8-ws11-ws22-telnet.png


## Сети в Linux.

## Contents
- [Сети в Linux.](#сети-в-linux)
- [Contents](#contents)
- [Part 1. Инструмент ipcalc.](#part-1-инструмент-ipcalc)
- [Part 2. Статическая маршрутизация между двумя машинами.](#part-2-статическая-маршрутизация-между-двумя-машинами)
- [Part 3. Утилита iperf3.](#part-3-утилита-iperf3)
- [Part 4. Сетевой экран.](#part-4-сетевой-экран)
- [Part 5. Статическая маршрутизация сети.](#part-5-статическая-маршрутизация-сети)
- [Part 6. Динамическая настройка IP с помощью DHCP:](#part-6-динамическая-настройка-ip-с-помощью-dhcp)
- [Part 7. NAT:](#part-7-nat)
- [Part 8. Дополнительно. Знакомство с SSH Tunnels:](#part-8-дополнительно-знакомство-с-ssh-tunnels)

**Рекомендация.** 
Перед дальнейшими манипуляциями, во избежании лишних проблем, заранее обновите систему и установите утилиты для одной виртуальной машины, далее просто клонируйте ее сколько необходимо (ws1, ws2. r1, r2, ws11, ws22, ws21):
1. `sudo apt-get update && sudo apt-get upgrade`
2. `sudo apt-get install ipcalc`
3. `sudo apt-get install iperf3`
4. `sudo apt-get install iptables`
5. `sudo apt-get install nmap`
6. `sudo apt-get install traceroute`
7. `sudo apt install inetutils-traceroute`
8. `sudo apt install isc-dhcp-server`
9. `sudo apt install apache2`
10. `sudo apt install openssh-server`

**Скачиваем `iso` образ для заданий ws1, ws2. r1, r2, ws11, ws22, ws21. [ubuntu-20.04-live-server](https://old-releases.ubuntu.com/releases/20.04.0/ubuntu-20.04-live-server-amd64.iso), далее следуем [инструкции](https://linuxconfig.org/how-to-install-ubuntu-20-04-on-virtualbox) по установке `iso` образа в VirtualBox.**

**Сохрание дампов образов виртуальных машин, после каждого выполненного Part задания**
* Справа от каждой VM есть кнопка с выпадающим меню **Details, Snapshots, Logs**. Выберите **Snapshots** и повяится окно сохранения состояния VM.
![image-id-a][]
* Нажмите кнопку **Take** и появится окно где для удобства, необходимо ввести имя соответствующему пунтку задания.
![image-id-b][]
Между состояниями VM можно переключатся в данном окне **перед новым запуском VM**, выбирая нужное состояние и далее нажимая кнопку **Restore**.
![image-id-с][]

## Part 1. Инструмент ipcalc.

1.1. Сети и маски:

1. Адрес сети *192.167.38.54 - 192.160.0.0*  
![image-id-1][]

2. Перевод маски *255.255.255.0* в префискную и двоичную запись:
* CIDR: /24
* Mask: 255.255.255.0
* Binary mask: 11111111.11111111.11111111.00000000  
![image-id-2][]

   Перевод маски */15* в обычную и двоичную запись:
* CIDR: /15
* Mask: 255.254.0.0
* Binary mask: 11111111.11111110.00000000.00000000  
![image-id-3][]

   Перевод маски *11111111.11111111.11111111.11110000* в обычную и двоичную запись
* CIDR: /28
* Mask: 255.255.255.240
* Binary mask: 11111111.11111111.11111111.11110000  
![image-id-4][]

3. MIN host: *12.0.0.1* MAX host: *12.255.255.254*  
![image-id-5][]

   MIN host: *12.167.0.1* MAX host: *12.167.255.254*  
![image-id-6][]

   MIN host: *12.167.38.1* MAX host: *12.167.39.254*  
![image-id-7][]

   MIN host: *0.0.0.1* MAX host: *15.255.255.254*  
![image-id-8][]

1.2. localhost:

* Можно обратиться к приложению с IP: 127.0.0.2/24, 127.1.0.1/8

* Нельзя обратиться к приложению с IP: 194.34.23.100, 128.0.0.1

1.3. Диапазоны и сегменты сетей:

1. Какие из перечисленных IP можно использовать в качестве публичного, а какие только в качестве частных: 10.0.0.45/8, 134.43.0.2/16, 192.168.4.2/16, 172.20.250.4/12, 172.0.2.1/12, 192.172.0.1/12, 172.68.0.2/12, 172.16.255.255/12, 10.10.10.10/8, 192.169.168.1/16
            
        частные:
            10.0.0.45/8
            192.168.4.2/16
            172.20.250.4/12
            172.16.255.255/12
            10.10.10.10/8
            
        публичные:
            134.43.0.2/16
            172.0.2.1/12
            192.172.0.1/12 (частично частный)
            172.68.0.2/12
            192.169.168.1/16

2. какие из перечисленных IP адресов шлюза возможны у сети 10.10.0.0/18: 10.0.0.1, 10.10.0.2, 10.10.10.10, 10.10.100.1, 10.10.1.255
         
            10.10.0.2
            10.10.10.10
            10.10.1.255

## Part 2. Статическая маршрутизация между двумя машинами.

**Далее слева **ws1**, справа **ws2**.**

* Смотрим существующие сетевые интерфейсы с помощью команды `ip a`:
![image-id-9][]

* Изменения вносим с помощью `vim /etc/netplan/00-installer-config.yaml`. Вывод содержания измененного файла `cat /etc/netplan/00-installer-config.yaml` для каждой машины и вызов команды `sudo netplan apply` для перезапуска сервиса сети так же для каждой машины:
![image-id-10][]

1. Добавление статического маршрута вручную:
* Добавим статистический маршрут при помощи команды `sudo ip r add` и пропингуем `ping -c` соединение между машинами:
* **Важная заметка:** Возможно при выполнении данной команды у вас возникнет ошибка **Destination host unreachable**, у меня возникла. Решение проблемы: Devices > Network > Network Settings... Там по умолчанию будет NAT, смените на Bridged adapter и нажмите OK. 
![image-id-11][]

2. Добавление статического маршрута с сохранением:
* Изменения вносим с помощью `vim /etc/netplan/00-installer-config.yaml`. Добавим статический маршрут от одной машины до другой с помощью файла `cat /etc/netplan/00-installer-config.yaml`, перезапустим сервер сети и пропингуем соединение между машинами:
![image-id-12][]

## Part 3. Утилита iperf3.

3.1. Скорость соединения:

* 8 Mbps = 1 MB/s
* 100 MB/s = 800000 Kbps
* 1 Gbps = 1000 Mbps

3.2. Утилита iperf3:
* Выполняем команды на ws1 - `sudo iperf3 -s` и на ws 2 - `sudo iperf3 -c 192.168.100.10` 
![image-id-13][]

## Part 4. Сетевой экран.

4.1. Утилита iptables:

* Создаем файлы `sudo vim /etc/firewall.sh`
![image-id-14][]

* Запуск файлов на обеих машинах командами `sudo chmod +x /etc/firewall.sh` и `sudo sh /etc/firewall.sh`
![image-id-15][]

4.2. Утилита nmap:

* Командой ping находим машину, которая не "пингуется", после чего утилитой nmap показываем, что хост машины запущен
![image-id-16][]
* ws1 - INPUT для пакетов на ping-reply DROP - не работает т.е. пакеты отправляет, но не принемает.
* ws2 - INPUT для пакетов на ping-reply ACCEPT - работает.

**Сохранить дампы образов виртуальных машин. Инструкция в начале**

## Part 5. Статическая маршрутизация сети.

5.1. Настройка адресов машин:

**В данном задании создайте 5 новых миртуальных машин. Можно взять iso образ по ссылке в начале.**
* Сеть:
![image-id-17][]

* Вносим изменения для каждой из машин: 
  * Для **r1, r2**: Settings > Network > Adapter 1 (Internal Network, intnet), Adapter 2 (Internal Network, intnet), Adapter 3 (Internal Network, intnet)
  * Для **ws11, ws22, ws21**:  Settings > Network > Adapter 1 (Internal Network, intnet), Adapter 2 (NAT)
* 2 роутера (r1, r2):
![image-id-18][]

* 3 рабочие станции (ws11, ws22, ws21):
![image-id-19][]

* Перезапустить сервис сети командой `sudo netplan apply` и выполнить команду `ip -4 a` для каждой машины:
* 2 роутера (r1, r2):
![image-id-20][]

* 3 рабочие станции (ws11, ws22, ws21):
![image-id-21][]

* Пропингуйте ping ws22 с ws21 и ping r1 с ws11:
![image-id-22][]

5.2. Включение переадресации IP-адресов:

* Для включения переадресации IP, выполните команду на роутерах(r1, r2): `sudo sysctl -w net.ipv4.ip_forward=1`
![image-id-23][]

* Откройте файл `sudo vim /etc/sysctl.conf` и добавьте в него следующую строку: **net.ipv4.ip_forward = 1**
![image-id-24][]

5.3. Установка маршрута по-умолчанию:

* Настроика маршрута по-умолчанию (шлюз) для рабочих станций(ws11, ws22, ws21):
* Вносим изменения для каждой из машин `sudo vim /etc/netplan/00-installer-config.yaml`
![image-id-25][]

* Вызвать ip r и проверяем, добавился ли маршрут в таблицу маршрутизации:
![image-id-26][]

* Пропингуем ws11 - r2; sudo tcpdump -tn -i enp0s8
![image-id-27][]

5.4. Добавление статических маршрутов:

* Добавить в роутеры r1 и r2 статические маршруты в файле конфигураций.
![image-id-28][]

* Вызвать ip r и показать таблицы с маршрутами на обоих роутерах.
![image-id-29][]

* Запустить команды на ws11: `ip r list 10.10.0.0/[маска сети] и ip r list 0.0.0.0/0`
* Для адреса 10.10.0.0/[маска сети] был выбран маршрут, отличный от 0.0.0.0/0, потому что маска /18 описывает маршрут к сети точнее, в отличие от маски /0.  
![image-id-30][]

5.5. Построение списка маршрутизаторов:

* Запустить на r1 команду дампа: `tcpdump -tnv -i eth0` **В нашем случае `tcpdump -tnv -i enp0s8`**
* При помощи утилиты traceroute построить список маршрутизаторов на пути от ws11 до ws21: `traceroute [адрес сети]`
![image-id-31][]
* Принцип работы traceroute:

Для определения промежуточных маршрутизаторов traceroute отправляет серию пакетов данных целевому узлу, при этом каждый раз увеличивая на 1 значение поля TTL («время жизни»). Это поле обычно указывает максимальное количество маршрутизаторов, которое может быть пройдено пакетом. Первый пакет отправляется с TTL, равным 1, и поэтому первый же маршрутизатор возвращает обратно сообщение ICMP, указывающее на невозможность доставки данных. Traceroute фиксирует адрес маршрутизатора, а также время между отправкой пакета и получением ответа (эти сведения выводятся на монитор компьютера). Затем traceroute повторяет отправку пакета, но уже с TTL, равным 2, что позволяет первому маршрутизатору пропустить пакет дальше.

Процесс повторяется до тех пор, пока при определённом значении TTL пакет не достигнет целевого узла. При получении ответа от этого узла процесс трассировки считается завершённым.

5.6. Использование протокола ICMP при маршрутизации:

* Запустить на r1 перехват сетевого трафика, проходящего через eth0 с помощью команды: `tcpdump -n -i eth0 icmp`
* Пропинговать с ws11 несуществующий IP (например, 10.30.0.111) с помощью команды: `ping -c 1 10.30.0.111`
![image-id-32][]

**Сохранить дампы образов виртуальных машин. Инструкция в начале**

## Part 6. Динамическая настройка IP с помощью DHCP:

**В данном задании используются виртуальные машины из Части 5.**

* Для r2 настроить в файле /etc/dhcp/dhcpd.conf конфигурацию службы DHCP:
1. У казать адрес маршрутизатора по-умолчанию, DNS-сервер и адрес внутренней сети.
![image-id-33][]

2. В файле resolv.conf прописать nameserver 8.8.8.8.
![image-id-34][]

* Перезагрузить службу DHCP командой `systemctl restart isc-dhcp-server`. Машину ws21 перезагрузить при помощи `reboot` и через `ip a` показать, что она получила адрес. Также пропинговать ws22 с ws21.
![image-id-35][]

* Пинг ws22 с ws21.  
![image-id-36][]

* Указать MAC адрес у ws11, для этого в etc/netplan/00-installer-config.yaml надо добавить строки: macaddress: 10:10:10:10:10:BA, dhcp4: true.  
![image-id-37][]

* Для r1 настроить аналогично r2, но сделать выдачу адресов с жесткой привязкой к MAC-адресу (ws11). Провести аналогичные тесты: `sudo vim /etc/dhcp/dhcpd.conf` для машины r1
![image-id-38][]

* Для r1 настроить аналогично r2, в файле resolv.conf прописать nameserver 8.8.8.8.
![image-id-39][]

* Перезагрузить службу DHCP командой `systemctl restart isc-dhcp-server`. Машину ws11 перезагрузить при помощи `reboot` и через `ip a` показать, что она получила адрес.
![image-id-40][]

* Запросить с ws21 обновление ip адреса **до**:
![image-id-41][]

* Запросить с ws21 обновление ip адреса **после**:
* `sudo dhclient -r` для сброса текущего адреса.
* `sudo dhclient -v` для получения нового адреса.
![image-id-42][]

**Сохранить дампы образов виртуальных машин. Инструкция в начале**

## Part 7. NAT:

**В данном задании используются виртуальные машины из Части 5.**

* В файле /etc/apache2/ports.conf на ws22 и r1 изменить строку Listen 80 на Listen 0.0.0.0:80, то есть сделать сервер Apache2 общедоступным.
![image-id-43][]

* Запустить веб-сервер Apache командой `service apache2 start` на ws22 и r1.
![image-id-44][]

* Добавить в фаервол, созданный по аналогии с фаерволом из Части 4, на r2 следующие правила:
1) Удаление правил в таблице filter - iptables -F
2) Удаление правил в таблице "NAT" - iptables -F -t nat
3) Отбрасывать все маршрутизируемые пакеты - iptables --policy FORWARD DROP
![image-id-45][]

* Запустить файл.  
![image-id-46][]

* Пингуем ws22 и r1, пинг не проходит как и должен.
![image-id-47][]

* Добавить в файл ещё одно правило в r2:
4) Разрешить маршрутизацию всех пакетов протокола ICMP
![image-id-48][]

* Запустить файл.  
![image-id-49][]

* Пингуем ws22 и r1, пинг проходит.
![image-id-50][]

* Добавить в файл ещё два правила:
5) Включить SNAT, а именно маскирование всех локальных ip из локальной сети, находящейся за r2 (по обозначениям из Части 5 - сеть 10.20.0.0).
6) Включить DNAT на 8080 порт машины r2 и добавить к веб-серверу Apache, запущенному на ws22, доступ извне сети.
![image-id-51][]

* Запустить файл.  
![image-id-52][]

**Перед тестированием рекомендуется отключить сетевой интерфейс NAT (его наличие можно проверить командой ip a) в VirtualBox, если он включен**

* Проверить соединение по TCP для SNAT, для этого с ws22 подключиться к серверу Apache на r1 командой:
![image-id-53][]

* Проверить соединение по TCP для DNAT, для этого с r1 подключиться к серверу Apache на ws22 командой telnet (обращаться по адресу r2 и порту 8080):  
![image-id-54][]

**Сохранить дампы образов виртуальных машин. Инструкция в начале**

## Part 8. Дополнительно. Знакомство с SSH Tunnels:

**В данном задании используются виртуальные машины из Части 5.**

* Запустить на r2 фаервол с правилами из Части 7.
![image-id-55][]

* Запустить веб-сервер Apache на ws22 только на localhost (то есть в файле /etc/apache2/ports.conf изменить строку Listen 80 на Listen localhost:80). После введите `service apache2 start`
![image-id-56][]

**Крайне важный момент, у вас может быть активен порт 2022, а нужен 22**

**Проделайте данные операции для машин ws11, ws22, ws21**

**Для ws22: Settings > Network > Adapter 1 (Internal Network, intnet), Adapter 2 (NAT), во втором адаптере нажать Advanced > Port Forfarding > зеленую кнопку Add new port forwarding rule > Host port 80 > Guest port 22**
* Меняем Port 2022 на Port 20
* Раскоментите ListenAddress 0.0.0.0
* Раскоментите ListenAddress ::
![image-id-57][]
* Закоментите Port 2022  
![image-id-58][]
* Перезапустите sshd: `sudo systemctl restart sshd`
* Проверьте статус sshd: `sudo systemctl status sshd`
* Аналогичные результаты для ws22 и ws21.
![image-id-59][]

* Воспользоваться Local TCP forwarding с ws21 до ws22, чтобы получить доступ к веб-серверу на ws22 с ws21.
`ssh -L local_port:remote_ip:remote_port user@hostname`
![image-id-60][]

* Воспользоваться Remote TCP forwarding c ws11 до ws22, чтобы получить доступ к веб-серверу на ws22 с ws11.
![image-id-61][]

* Для проверки, сработало ли подключение в обоих предыдущих пунктах, перейдите во второй терминал (например, клавишами Alt + F2) и выполните команду: `telnet 127.0.0.1 [локальный порт]`
* ![image-id-62][]

**Сохранить дампы образов виртуальных машин. Инструкция в начале**