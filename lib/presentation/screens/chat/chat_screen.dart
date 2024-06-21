

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Center(child: Text('Mi amor ❤️'),),
        leading: const Padding(
          padding: EdgeInsets.all(5.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://cdn.britannica.com/44/219144-050-243B5815/Lily-Collins-Actress.jpg'),
          ),
        ),
        title: const Text('Mi amor ❤️'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  // const _ChatView({
  //   super.key,
  // });

  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>(); // Va a estar escuchando los cambios que tenga la instancia de esa clase

    return SafeArea(
      // Un padding para que el contenido fuera del widget no esté pegado
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            // Permite expandir el hijo a todo el espacio disponible
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messages.length,
                itemBuilder: (_,index ) {
                  final message = chatProvider.messages[index];
                  return (message.fromWho == FromWho.hers)
                    ? HerMessageBubble()
                    : MyMessageBubble(message: message);
                  // return ( index % 2 == 0)
                    // ? const HerMessageBubble()
                    // : const MyMessageBubble();
                }
              )
            ),

            // Caja de textp de mensajes
            MessageFieldBox(
              // onValue: (value)=> chatProvider.sendMessage(value)
              onValue: chatProvider.sendMessage,
            )
          ],
        ),
      ),
    );
  }
}

