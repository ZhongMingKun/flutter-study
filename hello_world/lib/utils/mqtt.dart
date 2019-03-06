import 'dart:async';
import 'package:mqtt_client/mqtt_client.dart';
class CustomMqtt {
  static MqttClient _client = MqttClient('mqtt://test.mosquitto.org', null);

  Future<MqttClientConnectionStatus> connect(String username, String password) async {
    _client.connect(username, password);
    _client.onConnected();
  }
}
