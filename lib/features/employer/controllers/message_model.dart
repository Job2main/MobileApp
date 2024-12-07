
class MessageModel {
  final String senderId;
  final String receiverId;
  final String senderEmail;
  final String message;

  MessageModel({
    required this.senderId,
    required this.senderEmail,
    required this.receiverId,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return {
      'sender_id': senderId,
      'receiver_id': receiverId,
      'sender_email': senderEmail,
      'message': message,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      senderId: map['sender_id'] as String,
      senderEmail: map['sender_email'] as String,
      receiverId: map['receiver_id'] as String,
      message: map['message'] as String,
    );
  }
}