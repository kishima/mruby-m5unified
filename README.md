# mruby-m5unified

## How to build

We can use devcontainer.

### make dev container

you may need to modify `devcontainer.json`.

```
  "mounts": [ 
    "source=/dev/ttyACM0,target=/dev/ttyACM0,type=bind"
  ],
```

build container.

```
cd .devcontainer
./build.sh
```

then, load devcontainer.

### set module type

if you are using esp32.

`idf.py set-target esp32`

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
espidf@xxx:/project$ idf.py set-target esp32
```

### build

```
idf.py build 
```

