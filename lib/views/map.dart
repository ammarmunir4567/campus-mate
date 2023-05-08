import 'package:flutter/material.dart';

class DepartmentScreen extends StatefulWidget {
  @override
  _DepartmentScreenState createState() => _DepartmentScreenState();
}

class _DepartmentScreenState extends State<DepartmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.power),
              iconSize: 50,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ImageScreen('img/em.jpeg'),
                ),
              ),
              tooltip: 'Electrical Department Map',
            ),
            SizedBox(height: 16),
            Text('Electrical Department'),
            SizedBox(height: 80),
            IconButton(
              icon: Icon(Icons.construction),
              iconSize: 50,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ImageScreen('img/civil.jpeg'),
                ),
              ),
              tooltip: 'Civil Department',
            ),
            SizedBox(height: 16),
            Text('Civil Department '),
          ],
        ),
      ),
    );
  }
}

class ImageScreen extends StatefulWidget {
  final String imagePath;

  const ImageScreen(this.imagePath);

  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  double _scale = 1.0;
  double _previousScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onScaleStart: (ScaleStartDetails details) {
          _previousScale = _scale;
          setState(() {});
        },
        onScaleUpdate: (ScaleUpdateDetails details) {
          _scale = _previousScale * details.scale;
          setState(() {});
        },
        onScaleEnd: (ScaleEndDetails details) {
          _previousScale = 1.0;
          setState(() {});
        },
        child: Center(
          child: Transform.scale(
            scale: _scale,
            child: Image.asset(widget.imagePath),
          ),
        ),
      ),
    );
  }
}
