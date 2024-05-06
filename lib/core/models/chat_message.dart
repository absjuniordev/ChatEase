class ChatMessage {
  final String id;
  final String text;
  final DateTime createdAt;

  final String uerId;
  final String username;
  final String userImageUrl;
  ChatMessage({
    required this.id,
    required this.text,
    required this.createdAt,
    required this.uerId,
    required this.username,
    required this.userImageUrl,
  });
}
