import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class GridPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(context),
      body: Stack(
        children: [
          _fondoApp(),
          SingleChildScrollView(
            child: Column(
              children: [
                _titulos(),
                //_botonesRedondeadosTabla(), //MAL METODO
                _gridBotones()
                // _cardsToChart(context)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _fondoApp() {
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset(0.0, 0.6),
              end: FractionalOffset(0.0, 1),
              colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0)
          ])),
    );

    final cajaRosa = Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        width: 360.0,
        height: 360.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(236, 98, 188, 1.0),
            Color.fromRGBO(241, 142, 172, 1.0),
          ]),
          borderRadius: BorderRadius.circular(80.0),
        ),
      ),
    );

    return Stack(
      children: [gradiente, Positioned(top: -100.0, child: cajaRosa)],
    );
  }

  Widget _titulos() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Suns experiment on ellipse at subspace!',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Suns travel with malaria! C'mon! Pieces o' power are forever evil..",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
        primaryColor: Colors.pinkAccent,
        textTheme: Theme.of(context).textTheme.copyWith(
          caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0))
        )
      ),
      child: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today, size: 30,), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.bubble_chart, size: 30,), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle, size: 30,), label: ""),
        ],
      ),
    );
  }


  Widget _cardsToChart(BuildContext context) {

    return Container(

      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Card(
            margin: EdgeInsets.only(bottom: 10.0),
            child: ListTile(
              leading: Icon(Icons.add_chart),
              title: Text('Grafico 1'),
              subtitle: Text('25/11/2020'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pushNamed(context, "chart" );
              },
            ),
          ),
          Card(
            margin: EdgeInsets.only(bottom: 10.0),
            child: ListTile(
              leading: Icon(Icons.add_chart),
              title: Text('Grafico 1'),
              subtitle: Text('25/11/2020'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
            ),
          ),
          Card(
            margin: EdgeInsets.only(bottom: 10.0),
            child: ListTile(
              leading: Icon(Icons.add_chart),
              title: Text('Grafico 1'),
              subtitle: Text('25/11/2020'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
            ),
          ),
          Card(
            margin: EdgeInsets.only(bottom: 10.0),
            child: ListTile(
              leading: Icon(Icons.add_chart),
              title: Text('Grafico 1'),
              subtitle: Text('25/11/2020'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
            ),
          ),

        ],
      )
    );


  }

  Widget _botonesRedondeadosTabla() {

    return Table(
      children: [
        TableRow(
          children: [
            _crearBotonRedondeado(Colors.blue, Icons.border_all, 'General'),
            _crearBotonRedondeado(Colors.purpleAccent, Icons.directions_bike, 'Algo largo'),
          ]
        ),
        TableRow(
            children: [
              _crearBotonRedondeado(Colors.blue, Icons.border_all, 'General'),
              _crearBotonRedondeado(Colors.purpleAccent, Icons.directions_bike, 'Algo largo'),
            ]
        ),
        TableRow(
            children: [
              _crearBotonRedondeado(Colors.blue, Icons.border_all, 'General'),
              _crearBotonRedondeado(Colors.purpleAccent, Icons.directions_bike, 'Algo largo'),
            ]
        ),
        TableRow(
            children: [
              _crearBotonRedondeado(Colors.blue, Icons.border_all, 'General'),
              _crearBotonRedondeado(Colors.purpleAccent, Icons.directions_bike, 'Algo largo'),
            ]
        ),
      ],
    );
  }

  Widget _crearBotonRedondeado(Color color, IconData icon, String text) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          height: 180.0,
          //margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(62, 66, 107, 0.7),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundColor: color,
                radius: 35.0,
                child: Icon(icon, color: Colors.white, size: 30.0,),
              ),
              Text(text, style: TextStyle(color: Colors.pinkAccent),)
            ],
          ),
        ),
      ),
    );
  }

  Widget _gridBotones() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: 30,
      crossAxisSpacing: 30,
      padding: EdgeInsets.all(20.0),
      primary: false,
      children: [
        _crearBotonRedondeado(Colors.blue, Icons.border_all, 'General'),
        _crearBotonRedondeado(Colors.purpleAccent, Icons.directions_bike, 'Algo largo'),
        _crearBotonRedondeado(Colors.blue, Icons.border_all, 'General'),
        _crearBotonRedondeado(Colors.purpleAccent, Icons.directions_bike, 'Algo largo'),
        _crearBotonRedondeado(Colors.blue, Icons.border_all, 'General'),
        _crearBotonRedondeado(Colors.purpleAccent, Icons.directions_bike, 'Algo largo'),
        _crearBotonRedondeado(Colors.blue, Icons.border_all, 'General'),
      ],
    );
  }


}
