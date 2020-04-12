import 'dart:io';
import 'package:yaml/yaml.dart';
import 'package:http/http.dart' as http;
import './utils.dart';

const BASE_URL =  "https://hypercord.co.il/api";

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
  Future<http.Response> request(String method, String endpoint, [String body]) async {
    Map<String, String> headers = {
      "XF-Api-Key": this.superUserKey,
      "XF-Api-User": "1",
      "Content-Type": "application/x-www-form-urlencoded"
    };

    if (method == "GET") {
      return await (client.get(BASE_URL + endpoint, headers: headers));
    }
    
    if (method == "POST") {
      return client.post(BASE_URL + endpoint, body: body, headers: headers);
    }
  }

  Future<http.Response> get(String endpoint) {
    return request("GET", endpoint);
  }

  Future<http.Response> post(String endpoint, Map<String,String> body) {
    return request("POST", endpoint, getQueryString(body));
  }

  ApiClient() {
    File config = new File("private/config.yaml");
    String yamlString = config.readAsStringSync();
    Map yaml = loadYaml(yamlString);

    this.superUserKey = yaml["super-user-token"];
  }
}