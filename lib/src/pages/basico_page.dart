import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {
  final estiloTitulo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSubtitulo = TextStyle(fontSize: 18.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SafeArea(
            child: Column(
              children: [
                _crearImagen(),
                _crearTitulo(),
                _crearAcciones(),
                _crearTexto(),
                _crearTexto(),
                _crearTexto(),
                _crearTexto(),
                _crearTexto()
              ],
            ),
          ),
    ));
  }

  Widget _crearImagen() {
    return Container(
      width: double.infinity,
      child: FadeInImage(
        image: NetworkImage("https://i.redd.it/tk46u5nrkxm21.png"),
        placeholder: AssetImage('assets/img/loading.gif'),
        fit: BoxFit.cover,
        height: 230.0,
      ),
    );
  }

  Widget _crearTitulo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Titulo', style: estiloTitulo),
                SizedBox(
                  height: 7.0,
                ),
                Text('Subtitulo', style: estiloSubtitulo)
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red,
            size: 30.0,
          ),
          Text(
            '41',
            style: TextStyle(fontSize: 20.0),
          )
        ],
      ),
    );
  }

  Widget _crearAcciones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _botonAccion(Icons.call, 'Llamar'),
        _botonAccion(Icons.near_me, 'Ruta'),
        _botonAccion(Icons.share, 'Compartir')
      ],
    );
  }

  Widget _botonAccion(IconData icon, String text) {
    return InkWell(
      onTap: () {
        print('pulsado: $text');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Column(
          children: [
            Icon(
              icon,
              color: Colors.blue,
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 15.0, color: Colors.blue),
            )
          ],
        ),
      ),
    );
  }

  Widget _crearTexto() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Text(
          'Devastation, tragedy, and nuclear flux. One synthetic silence i give you: hear each other. The anchor whines punishment like a misty lagoon. Devastation, tragedy, and nuclear flux. One synthetic silence i give you: hear each other. The anchor whines punishment like a misty lagoon. Devastation, tragedy, and nuclear flux. One synthetic silence i give you: hear each other. The anchor whines punishment like a misty lagoon.',
          textAlign: TextAlign.justify,
        ));
  }
}
