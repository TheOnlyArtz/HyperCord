import 'user.dart';

class TThread {
  String username;
  bool isWatching;
  int visitorPostCount;
  Map<String, dynamic> customFields;
  List<dynamic> tags;
  String prefix;
  bool canEdit;
  bool canEditTags;
  bool canReply;
  bool canSoftDelete;
  bool canHardDelete;
  bool canViewAttachments;
  TForum forum;
  int threadId;
  int nodeId;
  String title;
  int replyCount;
  int viewCount;
  int userId;
  int postDate;
  bool sticky;
  String discussionState;
  bool discussionOpen;
  String discussionType;
  int firstPostId;
  int lastPostDate;
  int lastPostId;
  int lastPostUserId;
  String lastPostUsername;
  int firstPostReactionScore;
  int prefixId;
  TUser user;

  TThread.fromJson(Map<String, dynamic> json) {
    username = json["username"];
    isWatching = json["is_watching"];
    visitorPostCount = json["visitor_post_count"];
    customFields = json["custom_fields"];
    tags = json["tags"];
    prefix = json["prefix"];
    canEdit = json["can_edit"];
    canEditTags = json["can_edit_tags"];
    canReply = json["can_reply"];
    canSoftDelete = json["can_soft_delete"];
    canHardDelete = json["can_hard_delete"];
    canViewAttachments = json["can_view_attachments"];
    forum = json["Forum"] != null ? TForum.fromJson(json["Forum"]) : null;// TODO
    threadId = json["thread_id"];
    nodeId = json["node_id"];
    title = json["title"];
    replyCount = json["reply_count"];
    viewCount = json["view_count"];
    userId = json["user_id"];
    postDate = json["post_date"];
    sticky = json["sticky"];
    discussionState = json["discussion_state"];
    discussionOpen = json["discussion_open"];
    discussionType = json["discussion_type"];
    firstPostId = json["first_post_id"];
    lastPostDate = json["last_post_date"];
    lastPostId = json["last_post_id"];
    lastPostUserId = json["last_post_user_id"];
    lastPostUsername = json["last_post_username"];
    firstPostReactionScore = json["first_post_reaction_score"];
    prefixId = json["prefix_id"];
    user = json["User"] != null ? TUser.fromJson(json["User"]) : null;
  }
}

class TForum {
  List<dynamic> breadcrumbs;
  Map<String, dynamic> typeData;
  int nodeId;
  String title;
  String nodeName;
  String description;
  String nodeTypeId;
  int parentNodeId;
  int displayOrder;
  bool displayInList;

  TForum.fromJson(Map<String, dynamic> json) {
    breadcrumbs = json["breadcrumbs"];
    nodeId = json["node_id"];
    title = json["title"];
    nodeName = json["node_name"];
    description = json["description"];
    nodeTypeId = json["node_type_id"];
    parentNodeId = json["parent_node_id"];
    displayOrder = json["display_order"];
    displayInList = json["display_in_list"];
  }
}

class TNode {
  int id;
  String title;
  String description;
  String typeId; //BLOB
  int parentNodeId;
  String nodeIcon;

  TNode.fromList(List<dynamic> data) {
    id = data[0];
    title = data[1].toString();
    description = data[2].toString();
    typeId = data[3].toString();
    parentNodeId = data[4];
    nodeIcon = data[5].toString();
  }
}

class TThreadField {
  String fieldId;
  String title;
  String description;
  int displayOrder;
  String fieldType;
  Map<String, dynamic> fieldChoices;
  String matchType;
  List<dynamic> matchParams;
  int maxLength;
  bool isRequired;
  String displayGroup;

  TThreadField.fromJson(Map<String, dynamic> json) {
    fieldId = json["field_id"];
    title = json["title"];
    description = json["description"];
    displayOrder = json["display_order"];
    fieldType = json["field_type"];
    fieldChoices = json["field_choices"];
    matchType = json["match_type"];
    matchParams = json["match_params"];
    maxLength = json["max_length"];
    isRequired = json["is_required"];
    displayGroup = json["display_group"];
  }
}