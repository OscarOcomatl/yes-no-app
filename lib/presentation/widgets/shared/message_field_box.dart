import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {

  final ValueChanged<String> onValue;
  const MessageFieldBox({required this.onValue,super.key});

  @override
  Widget build(BuildContext context) {

    // final colors = Theme.of(context).colorScheme;

    final textController = TextEditingController();

    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.transparent
      ),
      borderRadius: BorderRadius.circular(30)
    );

    final inputDecoration = InputDecoration(
        hintText: 'End your message with a "?"',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          onPressed: (){
            final textValue = textController.value.text;
            textController.clear();
            onValue(textValue);
            // print('valor de text value: $textValue');

          }, 
          icon: const Icon(Icons.send_outlined)
        )
      );

    return TextFormField(
      onTapOutside: (event){
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value){
        // print('SUBMIT VALUE: $value');
        textController.clear();
        focusNode.requestFocus();
        onValue(value);
      },
      // onChanged: (value){
      //   print('changed: $value');
      // },
    );
  }
}