### The begging of my monitoring stack task 

# [ ] 1)Отримати у віртуалізаторів 2 віртуальні машини Ubuntu, мережевий адаптер (stage). Заповнити документацію по IP-адресам в таблицю.

.35 and .36 VM`s

# [ ] 2)на VM1 налаштувати prometheus, loki, grafana, blackbox_exporter, iptables, logrotate, timesync з ntp.mil.gov.ua


sudo nano /etc/ntp.conf
server ntp.mil.gov.ua iburst

# Check NTP
```
user@plgbl-01:/etc$ ntpq -p
     remote           refid      st t when poll reach   delay   offset  jitter
==============================================================================
 0.ubuntu.pool.n .POOL.          16 p    -   64    0    0.000   +0.000   0.000
 1.ubuntu.pool.n .POOL.          16 p    -   64    0    0.000   +0.000   0.000
 2.ubuntu.pool.n .POOL.          16 p    -   64    0    0.000   +0.000   0.000
 3.ubuntu.pool.n .POOL.          16 p    -   64    0    0.000   +0.000   0.000
 ntp.mil.gov.ua  .POOL.          16 p    -   64    0    0.000   +0.000   0.000
+10.222.0.123    31.28.161.71     2 u    3   64    1    0.520   -0.347   1.315
*ntp0.campus-rv. .PPS.            1 u    3   64    1    7.378   -1.240   1.846
 fido.odessa.ua  31.28.161.68     2 u    1   64    1   11.595   -0.190   1.052
```

[ ] 3)на VM2 підняти web server (nginx, apache) , iptables, logrotate, timesync з ntp.mil.gov.ua


[ ] 4)на VM2 підняти node_exporter, promtail


[ ] 5)зібрати з VM2 метрики на VM1 на прометеус і відобразити їх на якомусь dashboard в Grafana


[ ] 6)на VM1 підняти alertmanger законектити його з prometheus та спробувати написати правила на Prometheus і за допомогою відправити при спрацюванні на правило алерт на smtp та discord(telegram)


[ ] 7)додати до VM2 сервіс розгорнутий в docker контейнері і зібрати з нього логи використовуючи promtail


[ ] 8)додати лейблів використовуючи pipeline_stages promtail


[ ] 9)зібрати логи auth з ВМ1 і зробити на це алерт при підключенні до вірутальної машини


[ ] 10) отримати dns імена для цих двух віртуальних машин в домені stage.mil.gov.ua . Перевести конфігурацію з ip на dns імена. Згенерувати сертифікати для цих двух машин по dns іменам. Перевести з http на https зібрання метрик на Prometheus. Після виконання уточнити, що робити далі. у @v.mykhailov
