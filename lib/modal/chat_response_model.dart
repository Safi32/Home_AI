class ChatResponse {
  final String userMessage;
  final String botResponse;
  final String queryType;
  final String objectName;
  final String timestamp;

  ChatResponse({
    required this.userMessage,
    required this.botResponse,
    required this.queryType,
    required this.objectName,
    required this.timestamp,
  });

  factory ChatResponse.fromJson(Map<String, dynamic> json) {
    return ChatResponse(
      userMessage: json['user_message'] ?? '',
      botResponse: json['bot_response'] ?? '',
      queryType: json['query_type'] ?? '',
      objectName: json['object_name'] ?? '',
      timestamp: json['timestamp'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_message': userMessage,
      'bot_response': botResponse,
      'query_type': queryType,
      'object_name': objectName,
      'timestamp': timestamp,
    };
  }
}
