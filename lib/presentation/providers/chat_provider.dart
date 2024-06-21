



import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  final ScrollController chatScrollController = ScrollController();

  List<Message> messages = [
    Message(text: 'Hola amor', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.me)

  ];
    Future<void> sendMessage(String text) async {
      final newMessage = Message(text: text, fromWho: FromWho.me);
      messages.add(newMessage);

      notifyListeners(); // Hubieron cambios en el provider por lo tanto tiene que volver notificar ese cambio
    }

    void moveScrollToBottom(){
      chatScrollController.animateTo(
        2, 
        duration: const Duration(milliseconds: 300), 
        curve: Curves.easeOut
      );
    }




}