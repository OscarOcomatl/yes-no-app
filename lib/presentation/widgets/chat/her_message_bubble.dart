import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({required this.message, super.key});
  final Message message;

  @override
  Widget build(BuildContext context) {
    // Extrae datos en base al contexto de la aplicacion basado en el esquema
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(15)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(message.text, 
            style: const TextStyle(
              color: Colors.white
            ),),
          ),
        ),
        const SizedBox(height: 5,),

        _ImageBubble(message: message,),

        const SizedBox(height: 10,)
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {

  final Message message;
  const _ImageBubble({required this.message, super.key});

  @override
  Widget build(BuildContext context) {

    // Media query va a darnos info acerca del dispositivo que estamos usando
    // El context nos va dar informacion del arbol de widgets
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        // 'https://yesno.wtf/assets/yes/15-3d723ea13af91839a671d4791fc53dcc.gif',
        message.url!,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if(loadingProgress == null) return child; // Si ya se obtuvo la imagen, que se muestre...
          
          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: const Text('Mi amor ❤️ está enviando una imagen...'),
          );
        },
      )
    );
  }
}