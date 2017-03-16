# IoT Hub Intel Edison Client application

> This repo contains the source code to help you get familiar with Azure IoT using the Microsoft IoT Pack for Intel Edison Starter Kit. You will find the [lesson-based tutorials on Azure.com](#).

This repo contains an arduino application that runs on Intel Edison with a BME280 temperature&humidity sensor, and then sends these data to your IoT hub. At the same time, this application receives Cloud-to-Device message from your IoT hub, and takes actions according to the C2D command. 

## Set up your edison
Follow [this page](#) to set up your edison and enable SSH.

### Enable I2C on your edison
Follow [this page](https://learn.adafruit.com/adafruits-raspberry-pi-lesson-4-gpio-setup/configuring-i2c#installing-kernel-support-manually) to enable I2C on your edison.

## Build Azure IoT SDK

```bash
sed -i -e 's/\r$//' buildSDK.sh
chmod 755 buildSDK.sh
buildSDK.sh
```

## Connect your sensor with your edison
### Connect with a physical BEM280 sensor and LED
You can follow the image to connect your BME280 and a LED with your Intel Edison.

![BME280](#)

### DON'T HAVE A PHYSICAL BME280?
You can use the application to simulate temperature&humidity data and send to your IoT hub.
1. Open the `config.json` file.
2. Change the `simulatedData` value from `false` to `true`.


## Running this sample
### Install package
Install all packages by the following command:

```bash
npm install
```

### Run your client application
Run the client application with root priviledge, and you also need provide your Azure IoT hub device connection string, note your connection should be quoted in the command.

```bash
sudo node index.js '<your Azure IoT hub device connection string>'
```

### Send Cloud-to-Device command
You can send a C2D message to your device. You can see the device prints out the message and blinks once receiving the message.

### Send Device Method command
You can send `start` or `stop` device method command to your Pi to start/stop sending message to your IoT hub.
