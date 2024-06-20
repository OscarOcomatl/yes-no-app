
enum FromWho {me, hers}

class Message {
  
  final String text;
  final String? url;

  final FromWho fromWho;

  // Adicionalmente se puden colocar cosas como la fecha, estátus de leído, etc

  Message({
    required this.text,
    this.url,
    required this.fromWho
  });



}