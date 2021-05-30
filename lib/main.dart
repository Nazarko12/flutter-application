import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: PersonWidget(),
    );
  }
}

class FavoriteWidget extends StatefulWidget {

  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = false;
  int _favoriteCount = 87654;

  @override
  Widget build(BuildContext context){
    return Row(
      children: <Widget>[
        Container(
          child: IconButton(
            icon: (_isFavorited ? Icon(Icons.favorite) : Icons.favorite_border),
            onPressed: _toggleFavorite,
            color: Colors.red[500],
          ),
        ),
          SizedBox(
            width: 45,
            child: Container(
            child: Text('$_isFavorited'),

          ),
        )
      ],
    );
  }
  void _toggleFavorite() {
    setState(() {

      if (_isFavorited) {
        _isFavorited = false;
        _favoriteCount -= 1;

      } else {
          _isFavorited = true; 
          _favoriteCount += 1;
      }

      
    });
  }
  
}

class PersonWidget extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Football palyer'),
        ),
        body: Container(
          child: _buildMainColumn()
        ),
      );
    }

    Widget _buildMainColumn() => ListView(
      children: [
        _buildTopImage(),
        Center(child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(5),
                child: _buildRating(),
                 ),
                 Card(
                   elevation: 5,
                   child: Container(
                     margin: const EdgeInsets.all(5),
                     padding: const EdgeInsets.all(10),
                     child: _buildAction(),
                   ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: _buildDescription(),
                 ),
                ],
              ),
            ))
          ]
        );

        Widget _buildTopImage() => Container(
          child: Card(
            margin: EdgeInsets.only(left: 20,
             right: 20,
             top: 20
             ),
            elevation: 5,
            child: Image.asset(
              'assets/images/', 
              fit: BoxFit.cover,
              ),
            ),
          );

          Widget _buildRating() => ListTile(
            title: Text(
              'Marco Veratti',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                'Football club PSG',
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FavoriteWidget()
                ],
              ),
           
          );

          Widget _buildAction() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildButton('Quantity', Icons.star, Colors.grey),
              _buildButton('Position', Icons.star, Colors.grey),
              _buildButton('National', Icons.star, Colors.grey),
            ],
          );

          Widget _buildButton(
            String label,
            IconData icon,
            Color color
            ) => Column(
            children: <Widget>[
              Icon(icon, color: Colors.grey,),
              Container(
                child: Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: color,
                  ),
                ),
              ),
            ],
          );

          Widget _buildDescription() => Text(
            ' ',
            softWrap: true,
            style: TextStyle(
              fontSize: 15,
            ),
          );

     }



   
