// talk.dart
import 'package:flutter/material.dart';
import 'package:assistant/api/ai.dart';


class Talk extends StatefulWidget {
  const Talk({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ChatScreenState();
  }
}

class Message {
  final String text;
  final bool isUser;
  final DateTime timestamp;

  Message({required this.text, required this.isUser, required this.timestamp});
}

class _ChatScreenState extends State<Talk> {
  final TextEditingController _textController = TextEditingController();
  final List<Message> _messages = [];
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI对话'), elevation: 4),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _messages.length,
              padding: const EdgeInsets.all(12),
              itemBuilder: (context, index) {
                final message = _messages[index];
                return _buildMessageBubble(message);
              },
            ),
          ),
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: CircularProgressIndicator(),
            ),
          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(Message message) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color:
              message.isUser
                  // ? Theme.of(context).primaryColor
                  ? Colors.amber[100]
                  : Colors.amber[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.text,
              style: TextStyle(
                color: message.isUser ? Colors.black : Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              _formatTime(message.timestamp),
              style: TextStyle(
                color: message.isUser ? Colors.black : Colors.grey,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputArea() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: '输入你的问题',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              maxLines: 3,
              minLines: 1,
              onSubmitted: (_) => _handleSend(),
            ),
          ),
          IconButton(icon: const Icon(Icons.send), onPressed: _handleSend),
        ],
      ),
    );
  }

  void _handleSend() async {
    final text = _textController.text.trim();
    if (text.isEmpty) return;

    // 添加用户消息
    setState(() {
      _messages.add(
        Message(text: text, isUser: true, timestamp: DateTime.now()),
      );
      _textController.clear();
    });
    _scrollToBottom();
    try {
      setState(() => _isLoading = true);
      // 调用AI API
      final aiResponse = await AiApi.getAiResponse(text);
      setState(() {
        _messages.add(
          Message(text: aiResponse, isUser: false, timestamp: DateTime.now()),
        );
      });
    } catch (e) {
      _showError('Failed to get response: $e');
    } finally {
      setState(() => _isLoading = false);
      _scrollToBottom();
    }
  }

  // 滚动到底部
  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  // 格式化时间
  String _formatTime(DateTime time) {
    return '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
  }

  // 显示报错
  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }
}
