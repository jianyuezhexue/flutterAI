import 'package:assistant/api/dio.dart';
import 'package:assistant/types/ai_response.dart';
import 'package:assistant/types/ai_request.dart';

class AiApi {
  // AI对话接口
  static Future<String> getAiResponse(String prompt) async {
    // 组合最终参数
    AiRequest request = AiRequest(
      model: 'qwen-plus',
      messagesList: [
        Messages(role: 'system', content: "你是一个AI助手"),
        Messages(role: 'user', content: prompt),
      ],
    );
    try {
      // 预设header
      DioClient.instance.setHeaders({
        'Authorization': 'Bearer sk-e692504205e74522b45710e1c25065ad',
        'Content-Type': 'application/json',
      });
      final response = await DioClient.instance.post(
        '/compatible-mode/v1/chat/completions',
        data: request.toJson(),
      );

      // 解析数据
      AiResponse aiResponse = AiResponse.fromJson(response.data);
      return aiResponse.choicesList![0].message?.content ?? '系统繁忙,请稍后再试!';
    } catch (e) {
      return '系统繁忙,请稍后再试!';
    }
  }
}
