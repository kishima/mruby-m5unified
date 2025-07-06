# mruby-m5unified

## How to build

### make dev container

### set module type

idf.py set-target esp32

```
$ ./run_dev_container.sh 
Checking "python3" ...
Python 3.12.3
"python3" has been detected
Activating ESP-IDF 5.4
Setting IDF_PATH to '/opt/esp/idf'.
* Checking python version ... 3.12.3
* Checking python dependencies ... OK
* Deactivating the current ESP-IDF environment (if any) ... OK
* Establishing a new ESP-IDF environment ... OK
* Identifying shell ... bash
* Detecting outdated tools in system ... OK - no outdated tools found
* Shell completion ... Autocompletion code generated

Done! You can now compile ESP-IDF projects.
Go to the project directory and run:

  idf.py build
espidf@fc3755e4ea71:/project$ idf.py set-target esp32
```

### build

```
idf.py build 
```

