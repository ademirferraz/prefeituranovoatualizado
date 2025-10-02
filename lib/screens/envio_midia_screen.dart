import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EnvioMidiaScreen extends StatelessWidget {
  final picker = ImagePicker();

  Future<void> enviarMidia(BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser;
    final imagem = await picker.pickImage(source: ImageSource.camera);

    if (imagem != null && user != null) {
      final ref = FirebaseStorage.instance
          .ref('midias/${user.uid}/${DateTime.now().millisecondsSinceEpoch}.jpg');
      await ref.putData(await imagem.readAsBytes());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Mídia enviada com sucesso')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enviar Foto/Vídeo')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => enviarMidia(context),
          child: Text('Capturar e Enviar'),
        ),
      ),
    );
  }
}
