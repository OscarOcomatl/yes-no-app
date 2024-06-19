import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {

    // final colors = Theme.of(context).colorScheme;

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.transparent
      ),
      borderRadius: BorderRadius.circular(30)
    );

    final inputDecoration = InputDecoration(
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          onPressed: (){
            print('valor de la caja de texto');
          }, 
          icon: const Icon(Icons.send_outlined)
        )
      );

    return TextFormField(
      decoration: inputDecoration,
      onFieldSubmitted: (value){
        print('SUBMIT VALUE: $value');
      },
      onChanged: (value){
        print('changed: $value');
      },
    );
  }
}