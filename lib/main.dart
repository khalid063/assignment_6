import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Assignment 5',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  /// My SnackBar
  _showSnackBar(message, context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message))
    );
  }

  /// Items List of Json array  (1st work make a Json list)
  var MyItems = [
    {"img":"https://i.pinimg.com/236x/de/f1/9d/def19de19ac7fc4bbb11b7bc35b89d32--beautiful-sunset-beautiful-places.jpg"},
    {"img":"https://i.pinimg.com/236x/de/f1/9d/def19de19ac7fc4bbb11b7bc35b89d32--beautiful-sunset-beautiful-places.jpg"},
    {"img":"https://i.pinimg.com/236x/de/f1/9d/def19de19ac7fc4bbb11b7bc35b89d32--beautiful-sunset-beautiful-places.jpg"},
    {"img":"https://i.pinimg.com/236x/de/f1/9d/def19de19ac7fc4bbb11b7bc35b89d32--beautiful-sunset-beautiful-places.jpg"},
    {"img":"https://i.pinimg.com/236x/de/f1/9d/def19de19ac7fc4bbb11b7bc35b89d32--beautiful-sunset-beautiful-places.jpg"},
  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Photo Gallery",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Center(
                child: Text(
                    "Welcome to My Photo Gallery!",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Wrap(
              alignment: WrapAlignment.spaceEvenly,
              spacing: 8,
              runSpacing: 8,
              children: [
                for (int i = 1; i <= 6; i++)
                  ElevatedButton(
                    onPressed: () {
                      //showSnackBar(context, 'Clicked on photo $i!');
                      _showSnackBar("Clicked on photo!", context);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: Stack(
                      children: [
                        Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHczM8KLrWEZGCnw_foZb9bKAltOirUqlREhnDwCWu&s',
                          fit: BoxFit.cover,
                          width: 105,
                          height: 105,
                        ),
                        Positioned(
                          bottom: 0,
                          left: 20,
                          right: 20,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            color: Colors.black54,
                            child: Text(
                              'Photo $i Caption',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,                   ///*** very importen : without this Scrallvie and ListView witll not work "together
              padding:  EdgeInsets.fromLTRB(0,10,10,0),
              children: <Widget>[
                ListTile(
                  //leading: Icon(Icons.favorite),
                  leading: Image.network("https://i.pinimg.com/236x/de/f1/9d/def19de19ac7fc4bbb11b7bc35b89d32--beautiful-sunset-beautiful-places.jpg"),
                  title: Text('Sample Photo 1'),
                  subtitle: Text("Caragory 1"),
                  onTap: () => print('Fav'),
                ),
                ListTile(
                  //leading: Icon(Icons.favorite),
                  leading: Image.network("https://i.pinimg.com/236x/de/f1/9d/def19de19ac7fc4bbb11b7bc35b89d32--beautiful-sunset-beautiful-places.jpg"),
                  title: Text('Sample Photo 2'),
                  subtitle: Text("Caragory 2"),
                  onTap: () => print('Fav'),
                ),
                ListTile(
                  //leading: Icon(Icons.favorite),
                  leading: Image.network("https://i.pinimg.com/236x/de/f1/9d/def19de19ac7fc4bbb11b7bc35b89d32--beautiful-sunset-beautiful-places.jpg"),
                  title: Text('Sample Photo 3'),
                  subtitle: Text("Caragory 3"),
                  onTap: () => print('Fav'),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:  EdgeInsets.fromLTRB(0,0,20,0),
                  child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      child: IconButton(onPressed: (){
                        //print("button is clicked");
                        _showSnackBar("Photos Uploaded Successfully!", context);
                      }, icon: Icon(Icons.cloud_upload_outlined, color: Colors.white,))
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


