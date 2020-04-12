import 'dart:core';
class TUser {
  String about;
  bool activityVisible;
  int age;
  List<dynamic> alertOptout;
  Map<String, dynamic> avatarUrls;
  bool canBan;
  bool canConverse;
  bool canEdit;
  bool canFollow;
  bool canIgnore;
  bool canPostProfile;
  bool canViewProfile;
  bool canViewProfilePosts;
  bool canWarn;
  bool contentShowSignature;
  // bool contentShowSignature;
  String creatioWatchState;
  Map<String, dynamic> customFields;
  String customTitle;
  Map<String, dynamic> dateOfBirth;
  String email;
  bool emailOnConversation;
  String gravatar;
  String interactionWatchState;
  bool isAdmin;
  bool isBanned;
  bool isDiscouraged;
  bool isFollowed;
  bool isIgnored;
  bool isModerator;
  bool isSuperAdmin;
  int lastActivity; // UNIX
  String location;
  int warningPoints;
  String userState;
  String userTitle;
  int messageCount;
  int registerDate;
  int reactionScore;
  String username;
  bool isStaff;

  TUser.fromJson(Map<String, dynamic> json)
    : about = json["about"],
      alertOptout = json["alert_optout"],
      canBan = json["can_ban"],
      canConverse = json["can_converse"],
      canEdit = json["can_edit"],
      canFollow = json["can_follow"],
      canIgnore = json["can_ignore"],
      canPostProfile = json["can_post_profile"],
      canViewProfile = json["can_view_profile"],
      canViewProfilePosts = json["can_view_profile_posts"],
      canWarn = json["can_warn"],
      contentShowSignature = json["content_show_signature"],
      customFields = json["custom_fields"],
      customTitle = json["custom_title"],
      dateOfBirth = json["dob"],
      email = json["email"],
      emailOnConversation = json["email_on_conversation"],
      gravatar = json["gravatar"],
      interactionWatchState = json["interaction_watch_state"],
      isAdmin = json["is_admin"],
      isBanned = json["is_banned"],
      isDiscouraged = json["is_discouraged"],
      isFollowed = json["is_followed"],
      isIgnored = json["is_ignored"],
      isModerator = json["is_moderator"],
      isSuperAdmin = json["is_super_admin"],
      lastActivity = json["last_activity"],
      location = json["location"],
      warningPoints = json["warning_points"],
      userState = json["user_state"],
      messageCount = json["message_count"],
      registerDate = json["register_date"],
      reactionScore = json["reaction_score"],
      username = json["username"],
      isStaff = json["is_staff"];

}