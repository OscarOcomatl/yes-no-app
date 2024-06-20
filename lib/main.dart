import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Se coloca en el punto mas alto de la app para que todos los widgets hijos tengan acceso
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider()) // Se usa en el chat_screen
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 7).theme(),
        title: 'Yes No App',
        home: const ChatScreen(),
        // home: const Scaffold(
        //   // appBar: AppBar(
        //   //   title: const Text('Material App Bar'),
        //   // ),
      
        //   body: const ChatScreen(),
        //   // body: Center(
        //   //   child: FilledButton.tonal(
        //   //     onPressed: (){},
        //   //     child: const Text('Click me')
        //   //   ),
        //   // ),
        // ),
      ),
    );
  }
}