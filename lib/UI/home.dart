import 'package:flutter/material.dart';
import 'package:gfmobile/UI/buttons.dart';


class GFUI extends StatefulWidget {
  GFUI({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _GFUIState createState() => _GFUIState();
}

class _GFUIState extends State<GFUI> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
        backgroundColor: Color(0xff1a8caf),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Buttons()
                  )
                );
              },
              child: Card(
                elevation: 1.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xff1a8caf).withOpacity(0.1)
                  ),
                  height: 40.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 25.0,
                          vertical: 10.0
                        ),
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple),
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.purple.withOpacity(0.1),
                        ),
                        child: Text(
                          'Button',
                          style: TextStyle(
                            color: Colors.purpleAccent,
                            fontSize: 18.0
                          ),
                        ),
                      ),
                      Text(
                        'Button',
                        style: TextStyle(
                          fontSize: 14.0
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            title: Text('Widgets')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            title: Text('Settings')
          ),
        ]
      ),
    );
  }
}
