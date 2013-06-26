Screenshoter with sharing images
================================

Простой shell-скрипт для создания скриншотов и мгновенной загрузки их на сервер с получением прямой ссылки на картинку

Минимальные требования
----------------------

* Установленный imagemagic
* Доступ в интернет

Установка
---------

1. Установите imagemagic, если он не установлен

  apt-get install imagemagick

2. Скачайте любым способом файлы репозитория к себе на компьютер
3. Скопируйте файл config.example.sh в ту же папку с именем config.sh
4. Отредактируйте при необходимости параметры в config.sh
5. Назначте любую удобную горячую клавишу (комбинацию клавиш) для запуска скрипта

Принцип работы
--------------

При запуске скрипта из консоли или по горячей клавише запускается компонент import пакета imagemagic и ожидает, 
когда пользователь выделит мышью область экрана для копирования.

После этого скопированная область сохраняется в файл (файл располагается по пути, прописанному в переменной path 
файла config.(example).sh).

Затем запускается редактор (редактор также задается в файле конфигурации в переменной editor), позволяя пользователю 
внести изменения в сделанный скриншот.

После закрытия редактора выполняется отправка файла на http://vanchester.ru/pic. Сайт возвращает адрес загруженного 
файла, и этот адрес копируется в буфер обмена. 

Вставить данные из буфера обмена можно средней кнопкой мыши.

По окончании выводится notice-сообщение о статусе загрузки, имени файла и адресе загруженного файла

Дополнительно
-------------

Рекомендуемый редактор изображений: pinta

Установить его можно командой (Ubuntu)

  apt-get install pinta
  

