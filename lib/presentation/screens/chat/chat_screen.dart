

import 'package:flutter/material.dart';
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
    return SafeArea(
      // Un padding para que el contenido fuera del widget no esté pegado
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            // Permite expandir el hijo a todo el espacio disponible
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (_,index ) {
                  return ( index % 2 == 0)
                    ? const HerMessageBubble()
                    : const MyMessageBubble();
                }
              )
            ),

            // Caja de textp de mensajes
            const MessageFieldBox()
          ],
        ),
      ),
    );
  }
}

