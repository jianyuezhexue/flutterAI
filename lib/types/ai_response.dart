// lib/types/ai_response.dart

class Message {
  String? role;
  String? content;

  Message({this.role, this.content});

  Message copyWith({String? role, String? content}) =>
      Message(role: role ?? this.role, content: content ?? this.content);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["role"] = role;
    map["content"] = content;
    return map;
  }

  Message.fromJson(dynamic json) {
    role = json["role"];
    content = json["content"];
  }
}

class Choices {
  Message? message;
  String? finishReason;
  num? index;
  dynamic logprobs;

  Choices({this.message, this.finishReason, this.index, this.logprobs});

  Choices copyWith({
    Message? message,
    String? finishReason,
    num? index,
    dynamic logprobs,
  }) => Choices(
    message: message ?? this.message,
    finishReason: finishReason ?? this.finishReason,
    index: index ?? this.index,
    logprobs: logprobs ?? this.logprobs,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (message != null) {
      map["message"] = message?.toJson();
    }
    map["finish_reason"] = finishReason;
    map["index"] = index;
    map["logprobs"] = logprobs;
    return map;
  }

  Choices.fromJson(dynamic json) {
    message =
        json["message"] != null ? Message.fromJson(json["message"]) : null;
    finishReason = json["finish_reason"];
    index = json["index"];
    logprobs = json["logprobs"];
  }
}

// lib/types/ai_response.dart

class PromptTokensDetails {
  num? cachedTokens;

  PromptTokensDetails({this.cachedTokens});

  PromptTokensDetails copyWith({num? cachedTokens}) =>
      PromptTokensDetails(cachedTokens: cachedTokens ?? this.cachedTokens);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["cached_tokens"] = cachedTokens;
    return map;
  }

  PromptTokensDetails.fromJson(dynamic json) {
    cachedTokens = json["cached_tokens"];
  }
}

class Usage {
  num? promptTokens;
  num? completionTokens;
  num? totalTokens;
  PromptTokensDetails? promptTokensDetails;

  Usage({
    this.promptTokens,
    this.completionTokens,
    this.totalTokens,
    this.promptTokensDetails,
  });

  Usage copyWith({
    num? promptTokens,
    num? completionTokens,
    num? totalTokens,
    PromptTokensDetails? promptTokensDetails,
  }) => Usage(
    promptTokens: promptTokens ?? this.promptTokens,
    completionTokens: completionTokens ?? this.completionTokens,
    totalTokens: totalTokens ?? this.totalTokens,
    promptTokensDetails: promptTokensDetails ?? this.promptTokensDetails,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["prompt_tokens"] = promptTokens;
    map["completion_tokens"] = completionTokens;
    map["total_tokens"] = totalTokens;
    if (promptTokensDetails != null) {
      map["prompt_tokens_details"] = promptTokensDetails?.toJson();
    }
    return map;
  }

  Usage.fromJson(dynamic json) {
    promptTokens = json["prompt_tokens"];
    completionTokens = json["completion_tokens"];
    totalTokens = json["total_tokens"];
    promptTokensDetails =
        json["prompt_tokens_details"] != null
            ? PromptTokensDetails.fromJson(json["prompt_tokens_details"])
            : null;
  }
}

class AiResponse {
  List<Choices>? choicesList;
  Message? message;
  String? object;
  Usage? usage;
  num? created;
  dynamic systemFingerprint;
  String? model;
  String? id;

  AiResponse({
    this.choicesList,
    this.object,
    this.usage,
    this.created,
    this.systemFingerprint,
    this.model,
    this.id,
  });

  AiResponse copyWith({
    List<Choices>? choicesList,
    String? object,
    Usage? usage,
    num? created,
    dynamic systemFingerprint,
    String? model,
    String? id,
  }) => AiResponse(
    choicesList: choicesList ?? this.choicesList,
    object: object ?? this.object,
    usage: usage ?? this.usage,
    created: created ?? this.created,
    systemFingerprint: systemFingerprint ?? this.systemFingerprint,
    model: model ?? this.model,
    id: id ?? this.id,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (choicesList != null) {
      map["choices"] = choicesList?.map((v) => v.toJson()).toList();
    }
    map["object"] = object;
    if (usage != null) {
      map["usage"] = usage?.toJson();
    }
    map["created"] = created;
    map["system_fingerprint"] = systemFingerprint;
    map["model"] = model;
    map["id"] = id;
    return map;
  }

  AiResponse.fromJson(dynamic json) {
    if (json["choices"] != null) {
      choicesList = [];
      json["choices"].forEach((v) {
        choicesList?.add(Choices.fromJson(v));
      });
    }
    object = json["object"];
    usage = json["usage"] != null ? Usage.fromJson(json["usage"]) : null;
    created = json["created"];
    systemFingerprint = json["system_fingerprint"];
    model = json["model"];
    id = json["id"];
  }
}
