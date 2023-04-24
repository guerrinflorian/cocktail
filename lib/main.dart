import 'package:flutter/material.dart';

void main() {
  runApp(MuseumApp());
}

class MuseumApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Museum',
      theme: ThemeData(primarySwatch: Colors.brown),
      home: Artwork(),
    );
  }
}

class Artwork extends StatefulWidget {
  @override
  _ArtworkState createState() => _ArtworkState();
}

class _ArtworkState extends State<Artwork> {
  bool _isFavorite = false;
  bool _showDescription = false;

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  void _toggleDescription() {
    setState(() {
      _showDescription = !_showDescription;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Museum'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('assets/images/Mona_Lisa.jpg'),
                Icon(
                  Icons.favorite,
                  size: 100,
                  color: _isFavorite
                      ? Colors.red.withOpacity(1.0)
                      : Colors.white.withOpacity(0.75),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Mona Lisa',
              style: TextStyle(
                fontFamily: 'Merriweather',
                fontSize: 30,
                color: Colors.brown,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Léonard De Vinci',
              style: TextStyle(
                fontFamily: 'Merriweather',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.article),
                  color: Colors.brown,
                  onPressed: _toggleDescription,
                ),
                IconButton(
                  icon: Icon(Icons.favorite),
                  color: _isFavorite ? Colors.red : Colors.brown,
                  onPressed: () {
                    _toggleFavorite();
                    if (_isFavorite) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Oeuvre ajoutée à vos favoris'),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
            if (_showDescription)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'La Joconde est une peinture à l\'huile sur panneau de bois de peuplier réalisée par Léonard de Vinci entre 1503 et 1506, ou entre 1513 et 1516, et peut-être jusqu\'à 1519, date de sa mort. Cette œuvre est exposée au musée du Louvre à Paris.',
                  textAlign: TextAlign.justify,
                ),
              ),
          ],
        ),
      ),
    );
  }
}