import 'dart:math';

import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class GridPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.map, title: 'Discovery'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.message, title: 'Message'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        initialActiveIndex: 2, //optional, default as 0
        onTap: (int i) => print('click index=$i'),
      ),
      body: Stack(
        children: [
          _fondoApp(),
          SingleChildScrollView(
            child: Column(
              children: [
                _titulos(),
                _cardsToChart(context)
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

        ],
      )
    );


  }
}
