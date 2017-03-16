#!/bin/sh
if [ ! -d ~/azure-iot-sdk-c ];
then
  git clone https://github.com/Azure/azure-iot-sdk-c.git ~/azure-iot-sdk-c && cd ~/azure-iot-sdk-c && git checkout 76906dc;
fi

cd ~/azure-iot-sdk-c/uamqp
if ! [ "$(ls -A .)" ];
then
  git clone https://github.com/Azure/azure-uamqp-c.git . && git checkout 5bf09d3;
fi

cd ~/azure-iot-sdk-c/umqtt
if ! [ "$(ls -A .)" ];
then
  git clone https://github.com/Azure/azure-umqtt-c.git . && git checkout 51da812;
fi

cd ~/azure-iot-sdk-c/parson
if ! [ "$(ls -A .)" ];
then
  git clone https://github.com/kgabis/parson.git . && git checkout c22be79;
fi

cd ~/azure-iot-sdk-c/c-utility
if ! [ "$(ls -A .)" ];
then
  git clone https://github.com/Azure/azure-c-shared-utility.git . && git checkout 9073d21;
fi

cd ~/azure-iot-sdk-c/uamqp/c-utility
if ! [ "$(ls -A .)" ];
then
git clone https://github.com/Azure/azure-c-shared-utility.git . && git checkout b0b5b1b;
fi

cd ~/azure-iot-sdk-c/umqtt/c-utility
if ! [ "$(ls -A .)" ];
then
  git clone https://github.com/Azure/azure-c-shared-utility.git . && git checkout b0b5b1b;
fi

sed -i 's/--jobs=$CORES/--jobs=2/g' ~/azure-iot-sdk-c/build_all/linux/build.sh

test -e ~/azure-iot-sdk-c/cmake/iotsdk_linux/iothub_client/libiothub_client_mqtt_transport.a || (cd ~/azure-iot-sdk-c && sudo build_all/linux/build.sh --skip-unittests --no-amqp --no-http --no_uploadtoblob)
