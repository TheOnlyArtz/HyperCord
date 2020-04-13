import 'dart:convert';
import 'package:hyper_cord/rest/article.dart';
import 'package:mysql1/mysql1.dart';
import 'package:yaml/yaml.dart';
import 'package:http/http.dart' as http;
import './utils.dart';

const BASE_URL = "https://hypercord.co.il/api";

Function getMember(http.Client object, String name) {
  if (name == "GET") return object.get;
  if (name == "POST") return object.post;
  if (name == "PATCH") return object.patch;
  throw ArgumentError.value(name, "name");
}

class ApiClient {
  final client = http.Client();
  String superUserKey = "";
  String dbPass = "";
  String dbUser = "";

  /*
  * Sends off a request to hypercord.co.il's API 
  * with a given method, endpoint and body if specified.
  */
  Future<http.Response> request(String method, String endpoint,
      [String body]) async {
    Map<String, String> headers = {
      "XF-Api-Key": "P4wdWwlJmd5OXVXOwIfXEqd5kj6Z77gw",
      "XF-Api-User": "1",
      "Content-Type": "application/x-www-form-urlencoded"
    };

    if (method == "GET") {
      print(BASE_URL + endpoint);
      return await (client.get(BASE_URL + endpoint, headers: headers));
    }

    if (method == "POST") {
      return client.post(BASE_URL + endpoint, body: body, headers: headers);
    }
  }

  Future<http.Response> get(String endpoint) {
    return request("GET", endpoint);
  }

  Future<http.Response> post(String endpoint, Map<String, String> body) {
    return request("POST", endpoint, getQueryString(body));
  }

  Future<List<Article>> getHomePagePosts() async {
    var settings = new ConnectionSettings(
        host: '185.145.203.195',
        port: 3306,
        user: 'cameramy_rq1',
        password: 'V=p_KS{!sy*H',
        db: 'cameramy_rq1');

    try {
      var conn = await MySqlConnection.connect(settings);
      Results results = await (conn.query(
          "SELECT article_id, category_id, user_id, article_state, message, publish_date, reaction_score, cover_image_id, title, username, view_count FROM xf_xa_ams_article ORDER BY article_id DESC LIMIT 3"));
      List<Article> list = parseArticlesArray(results);

      conn.close();

      for (int i = 0; i < list.length; i++) {
        var url = await getAttachmentUrl(list[i].coverImageId);

        list[i].setThumbnailUrl(url);
      }

      return list;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  List<Article> parseArticlesArray(Results arr) {
    List<Article> result = List<Article>();

    for (final row in arr) {
      result.add(Article.fromList(row));
    }

    return result;
  }

  Future<String> getAttachmentUrl(int id) async {
    http.Response res = await get("/attachments/$id");
    var json = jsonDecode(res.body);
    return json["attachment"]["thumbnail_url"];
  }

  ApiClient() {
    // loadConfig();
  }

  // void loadConfig() async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   try {
  //     String s = await rootBundle.loadString("private/config.yaml");
  //     Map yaml = loadYaml(s);
  //     this.superUserKey = yaml["super-user-token"];
  //     this.dbPass = yaml["db-pass"];
  //     this.dbUser = yaml["db-user"];
  //   } catch (e){
  //     print(e);
  //     throw e;
  //   }

  // }
}
