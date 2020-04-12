import 'user.dart';

class TProfilePostComment {
  String username;
  bool canEdit;
  bool canSoftDelete;
  bool canHardDelete;
  bool canReact;
  TProfilePost profilePost;
  bool isReactedToo;
  int visitorReactionId;
  int profilePostCommentId;
  int profilePostId;
  int userId;
  int commentDate;
  String message;
  String messageState;
  String warningMessage;
  int reactionScore;
  TUser user;

  TProfilePostComment.fromJson(Map<String, dynamic> json) {
    username = json["username"];
    canEdit = json["can_edit"];
    canSoftDelete = json["can_soft_delete"];
    canReact = json["can_react"];
    profilePost = json["ProfilePost"] != null ? TProfilePost.fromJson(json["ProfilePost"]) : null;
    isReactedToo = json["is_reacted_too"];
    visitorReactionId = json["visitor_reaction_id"];
    profilePostCommentId = json["profile_post_comment_id"];
    profilePostId = json["profile_post_id"];
    userId = json["user_id"];
    commentDate = json["comment_date"];
    message = json["message"];
    messageState = json["message_state"];
    warningMessage = json["warning_message"];
    reactionScore = json["reaction_user"];
    user = json["User"] != null ? TUser.fromJson(json["User"]) : null;
  }
}
  
class TProfilePost {
  String username;
  bool canEdit;
  bool canSoftDelete;
  bool canHardDelete;
  bool canReact;
  TUser profileUser;
  List<TProfilePostComment> latestComments;
  bool isReactedTo;
  int visitorReactionId;
  int profilePostId;
  int profileUserId;
  int userId;
  int postDate;
  String message;
  String messageState;
  String warningMessage;
  int commentCount;
  int firstCommentDate;
  int lastCommentDate;
  int reactionScore;
  TUser user;

  TProfilePost.fromJson(Map<String, dynamic> json) {
    username = json["username"];
    canEdit = json["can_edit"];
    canSoftDelete = json["can_soft_delete"];
    canReact = json["can_react"];
    isReactedTo = json["is_reacted_to"];
    visitorReactionId = json["visitor_reaction_id"];
    profilePostId = json["profile_post_id"];
    profileUserId = json["profile_user_id"];
    userId = json["user_id"];
    postDate = json["post_date"];
    message = json["message"];
    messageState = json["message_state"];
    warningMessage = json["warning_message"];
    commentCount = json["comment_count"];
    firstCommentDate = json["first_comment_date"];
    lastCommentDate = json["last_comment_date"];
    reactionScore = json["reaction_score"];

    latestComments = List<TProfilePostComment>(); // END
    profileUser = json["ProfileUser"] != null ? TUser.fromJson(json["ProfileUser"]) : null; // TODO: Look in docs

    if (json["LatestComments"] != null) {
      for (final comment in json["LatestComments"]) {
        latestComments.add(TProfilePostComment.fromJson(comment));
      }
    }
    user = json["User"] != null ? TUser.fromJson(json["User"]) : null;
  }
}