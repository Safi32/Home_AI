import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_ai/constants/api_constant.dart';
import 'package:home_ai/modal/chat_response_model.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class ChatController extends GetxController {
  var isLoading = false.obs;
  var chatHistory = <ChatResponse>[].obs;
  var errorMessage = RxnString();

  Future<ChatResponse?> sendMessage({required String userMessage}) async {
    try {
      isLoading.value = true;
      errorMessage.value = null;

      final response = await http.post(
        Uri.parse(ApiConstants.chat),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"message": userMessage}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final chatResponse = ChatResponse.fromJson(data);
        
        chatHistory.add(chatResponse);
        
        Get.snackbar(
          "Success",
          "Message sent successfully",
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.green,
        );
        
        return chatResponse;
      } else {
        final data = jsonDecode(response.body);
        errorMessage.value = data["message"] ?? "Failed to send message";
        
        Get.snackbar(
          "Error",
          errorMessage.value!,
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
        
        return null;
      }
    } catch (e) {
      errorMessage.value = e.toString();
      
      Get.snackbar(
        "Exception",
        e.toString(),
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
      
      return null;
    } finally {
      isLoading.value = false;
    }
  }

  void clearChatHistory() {
    chatHistory.clear();
  }

  List<ChatResponse> getChatHistory() {
    return chatHistory.toList();
  }
}
