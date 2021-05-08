import 'package:flutter/material.dart';
import 'package:recipe_box/expansionPanel.dart';
import 'package:recipe_box/expansionTile.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Screen',
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext          context)=>Expansiontile()));
                    },
                    child: Text(
                        'ExpansionTile'
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context)=>Expansionpanel()));
                    },
                    child: Text(
                        'ExpansionPanel'
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}