import 'user.dart';

class TConversation {
  String username;
  Map<String, dynamic> recipients;
  bool isStarred;
  bool canEdit;
  bool canReply;
  bool canInvite;
  bool canUploadAttachment;
  int conversationId;
  String title;
  int userId;
  int startDate;
  bool openInvite;
  bool conversationOpen;
  int replyCount;
  int recipientCount;
  int firstMessageId;
  int lastMessageDate;
  int lastMessageId;
  int lastMessageUserId;
  TUser starter;

  TConversation.fromJson(Map<String, dynamic> json)
    : username = json["username"],
      recipients = json["recipients"],
      isStarred = json["is_starred"],
      canEdit = json["can_edit"],
      canReply = json["can_reply"],
      canInvite = json["can_invite"],
      canUploadAttachment = json["can_upload_attachment"],
      conversationId = json["conversation_id"],
      title = json["title"],
      userId = json["user_id"],
      startDate = json["start_date"],
      openInvite = json["open_invite"],
      conversationOpen = json["conversation_open"],
      replyCount = json["reply_count"],
      recipientCount = json["recipient_count"],
      firstMessageId = json["first_message_id"],
      lastMessageDate = json["last_message_date"],
      lastMessageId = json["last_message_id"],
      lastMessageUserId = json["last_message_user_id"],
      starter = json["starter"] != null ? TUser.fromJson(json["starter"]) : null;
}