import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wheather/modules/whetherApi.dart';
import 'dart:async';
import 'dart:convert';

const String earthquakeUrl = 'https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=2014-01-01&endtime=2014-01-02';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wheather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Wheather'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late WhetherApi whetherApi;

  Future<WhetherApi> fetchPosts() async {
    final response = await http.get(
      Uri.parse(earthquakeUrl),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return WhetherApi.fromJson(data);
    }

    throw Exception('Server under maintenance');
  }

  final List<Color> colors = [
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(widget.title),
      ),
      body: FutureBuilder<WhetherApi>(
        future: fetchPosts(),
        builder: (BuildContext context, AsyncSnapshot<WhetherApi> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(
              child: Text('No data available'),
            );
          }

          whetherApi = snapshot.data!;
          final features = whetherApi.features ?? [];

          if (features.isEmpty) {
            return const Center(
              child: Text('No features found'),
            );
          }

          return ListView.builder(
            itemCount: features.length,
            itemBuilder: (BuildContext context, int index) {
              final feature = features[index];
              final properties = feature.properties;
              final mag = properties?.mag?.toDouble() ?? 0.0;
              final placeString = properties?.place ?? 'Unknown location';
              final places = placeString.split(',');
              final locationName = places.isNotEmpty ? places.last.trim() : 'Unknown';
              final locationDetail = places.isNotEmpty ? places.first.trim() : '';
              final colorIndex = mag.ceil().clamp(0, 4).toInt();
              final circleColor = colors[colorIndex];

              return Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFFAFAFA),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFE0E0E0),
                      offset: Offset(0.5, 0.5),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 6,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: circleColor,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 19,
                          ),
                          child: Text(
                            mag.ceil().toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          locationName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          locationDetail,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
