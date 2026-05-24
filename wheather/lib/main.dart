import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wheather App',
      theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Wheather'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

fetchPosts() async{

}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(widget.title),
      ),
      body:Container(
        child:  FutureBuilder(
          future:fetchPosts(),
          builder:(BuildContext context, AsyncSnapshot snapshot){
           if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child:CircularProgressIndicator(),
           );
          } 
          
          else if(snapshot.data!=null){
              if(snapshot.data=="Sorry for Iconvenience, Server Under Maintainence"){
                return Center(
                    child:Text(snapshot.data.toString()),
                  );
              }
              else{
                return ListView.builder(
                  itemCount: snapshot.data.length,
          
            itemBuilder: (BuildContext context,int index){
              
          return Container(
            decoration: BoxDecoration(
                boxShadow: const[
                  BoxShadow(
                    color: Color(0xFFE0E0E0),
                    offset: Offset(0.5, 0.5),
                    blurRadius: 10.0,
                  ),
                ],
                shape: BoxShape.rectangle,
                color: Color(0xFFFAFAFA),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/6,
                  child: Container(
                  
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                        color:Colors.red,

                  ),
                  child:Container(
                    margin: EdgeInsets.only(left:MediaQuery.of(context).size.width/19),
                    child:Text("1",style: TextStyle(color:Colors.white,fontSize: 16,fontWeight: FontWeight.w700),))
                )),

                 Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:const[
                   Text("Banglore",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700)),
                    Text("15 Km from Banglore",style: TextStyle(fontSize: 12))

                  ]
                ),
              ],
            ),
          );
    });
              }
            }
            else {
        return const Center(
          child: Text("No data available"),
        );
            }
         },
        
    ))
    );
  }
}