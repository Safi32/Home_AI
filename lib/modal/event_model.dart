class Event {
  final String id;
  final String? objectId;
  final String eventType;
  final String eventDescription;
  final String? relatedObjectId;
  final String? relatedObjectName;
  final String? zone;
  final double? positionX;
  final double? positionY;
  final bool isCurrent;
  final double? confidence;
  final DateTime createdAt;
  final DateTime lastUpdated;

  Event({
    required this.id,
    this.objectId,
    required this.eventType,
    required this.eventDescription,
    this.relatedObjectId,
    this.relatedObjectName,
    this.zone,
    this.positionX,
    this.positionY,
    required this.isCurrent,
    this.confidence,
    required this.createdAt,
    required this.lastUpdated,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id']?.toString() ?? '',
      objectId: json['object_id']?.toString(),
      eventType: json['event_type'] ?? '',
      eventDescription: json['event_description'] ?? '',
      relatedObjectId: json['related_object_id']?.toString(),
      relatedObjectName: json['related_object_name']?.toString(),
      zone: json['zone']?.toString(),
      positionX: json['position_x']?.toDouble(),
      positionY: json['position_y']?.toDouble(),
      isCurrent: json['is_current'] ?? false,
      confidence: json['confidence']?.toDouble(),
      createdAt: DateTime.parse(json['created_at']),
      lastUpdated: DateTime.parse(json['last_updated']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'object_id': objectId,
      'event_type': eventType,
      'event_description': eventDescription,
      'related_object_id': relatedObjectId,
      'related_object_name': relatedObjectName,
      'zone': zone,
      'position_x': positionX,
      'position_y': positionY,
      'is_current': isCurrent,
      'confidence': confidence,
      'created_at': createdAt.toIso8601String(),
      'last_updated': lastUpdated.toIso8601String(),
    };
  }
}
