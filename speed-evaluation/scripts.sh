#execute redis server

sudo ./redis-6.0.10/src/redis-server\
 --protected-mode no\
  --loadmodule ~/ntua-diplwmatikh/redis-module/tmem.so
