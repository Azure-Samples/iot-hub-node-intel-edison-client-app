/*
* IoT Hub Raspberry Pi NodeJS - Microsoft Sample Code - Copyright (c) 2017 - Licensed MIT
*/
'use strict';

const five = require("johnny-five");

const DEFAULT_PIN = "A0";
function Sensor(pin) {
  pin = pin || DEFAULT_PIN;
  this.reader = new five.Temperature({
    pin: pin,
    controller: "GROVE"
  });
}

Sensor.prototype.read = function (callback) {
  var temperature = this.reader.celsius
  callback(null, {
    temperature: temperature,
  });
}

module.exports = Sensor;
