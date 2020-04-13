import 'dart:io';
import 'package:mysql1/mysql1.dart';
import 'package:yaml/yaml.dart';
void main(List<String> args) async {

  File config = new File("./lib/private/config.yaml");
  String yamlString = config.readAsStringSync();
  Map yaml = loadYaml(yamlString);

  print(yaml);

  var settings = new ConnectionSettings(
    host: '185.145.203.195', 
    port: 3306,
    user: yaml["db-user"],
    password: yaml["db-pass"],
    db: yaml["db-user"]
  );
  var conn = await MySqlConnection.connect(settings);

  var results = await(conn.query("select article_id, category_id, user_id, article_state, message, publish_date, reaction_score, cover_image_id from xf_xa_ams_article WHERE article_id = ?", [32]));

  // Future toResolve = client.get("/profile-post-comments/6/");
  // var result = await toResolve;
  // dynamic json = jsonDecode(result.body);

  // TProfilePostComment asf = TProfilePostComment.fromJson(json["comment"]);
}