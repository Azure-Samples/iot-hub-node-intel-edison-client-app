# IoT Hub Intel Edison Client application
[![Build Status](https://travis-ci.com/Azure-Samples/iot-hub-node-intel-edison-client-app.svg?token=5ZpmkzKtuWLEXMPjmJ6P&branch=master)](https://travis-ci.com/Azure-Samples/iot-hub-node-intel-edison-client-app)

> This repo contains the source code to help you get familiar with Azure IoT using the Microsoft IoT Pack for Intel Edison Starter Kit. You will find the [lesson-based tutorials on Azure.com](https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-intel-edison-kit-node-get-started).

This repo contains an nodejs application that runs on Intel Edison with a Grove temperature sensor, and then sends these data to your IoT hub. At the same time, this application receives Cloud-to-Device message from your IoT hub, and takes actions according to the C2D command. 

## Set up your edison
Follow [this page](https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-intel-edison-kit-node-get-started#setup-intel-edison) to set up your edison and enable SSH. Then connect the Grove temperature sensor.

## Connect your sensor with your edison
### Connect with a physical Grove temperature sensor and LED
You can follow the image to connect your Grove temperature sensor and a LED with your Intel Edison.

![Grove temperature sensor](https://docs.microsoft.com/en-us/azure/iot-hub/media/iot-hub-intel-edison-kit-node-get-started/16_edion_sensor.png)

### DON'T HAVE A PHYSICAL Grove temperature sensor?
You can use the application to simulate temperature data and send to your IoT hub.
1. Open the `config.json` file.
2. Change the `simulatedData` value from `false` to `true`.


## Running this sample
### Install package
Install all packages by the following command, it may take serval minutes to complete:

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
