import 'dart:io';
import 'package:yaml/yaml.dart';
import 'package:http/http.dart' as http;

const BASE_URL =  "hypercord.co.il/api";

Function getMember(http.Client object, String name) {
   if (name == "GET") return object.get;
   if (name == "POST") return object.post;
   if (name == "PATCH") return object.patch;
   throw ArgumentError.value(name, "name");
}

class ApiClient {
  final client = http.Client();
  String superUserKey = "";
  /*
  * Sends off a request to hypercord.co.il's API 
  * with a given method, endpoint and body if specified.
  */
  void request(String method, String endpoint, [String body]) async {
    try {
      var uriResponse = await (getMember(client, method)(BASE_URL + endpoint, body: body));
    } catch (exception) {
      print(exception);
    }
  }

  ApiClient() {
    File config = new File("private/config.yaml");
    String yamlString = config.readAsStringSync();
    Map yaml = loadYaml(yamlString);

    this.superUserKey = yaml["super-user-token"];
  }
}