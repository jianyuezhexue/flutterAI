class Messages {
  String? role;
  String? content;

  Messages({this.role, this.content});

  Messages copyWith({String? role, String? content}) =>
      Messages(role: role ?? this.role, content: content ?? this.content);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["role"] = role;
    map["content"] = content;
    return map;
  }

  Messages.fromJson(dynamic json) {
    role = json["role"];
    content = json["content"];
  }
}

class ResponseFormat {
  String? type;

  ResponseFormat({this.type});

  ResponseFormat copyWith({String? type}) =>
      ResponseFormat(type: type ?? this.type);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["type"] = type;
    return map;
  }

  ResponseFormat.fromJson(dynamic json) {
    type = json["type"];
  }
}

class AiRequest {
  String? model;
  List<Messages>? messagesList;
  ResponseFormat? responseFormat;

  AiRequest({this.model, this.messagesList, this.responseFormat});

  AiRequest copyWith({
    String? model,
    List<Messages>? messagesList,
    ResponseFormat? responseFormat,
  }) => AiRequest(
    model: model ?? this.model,
    messagesList: messagesList ?? this.messagesList,
    responseFormat: responseFormat ?? this.responseFormat,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["model"] = model;
    if (messagesList != null) {
      map["messages"] = messagesList?.map((v) => v.toJson()).toList();
    }
    if (responseFormat != null) {
      map["response_format"] = responseFormat?.toJson();
    }
    return map;
  }

  AiRequest.fromJson(dynamic json) {
    model = json["model"];
    if (json["messages"] != null) {
      messagesList = [];
      json["messages"].forEach((v) {
        messagesList?.add(Messages.fromJson(v));
      });
    }
    responseFormat =
        json["response_format"] != null
            ? ResponseFormat.fromJson(json["response_format"])
            : null;
  }
}
