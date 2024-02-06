import 'package:flutter/material.dart';
import 'package:project_1/pages/member.dart';
import 'package:project_1/pages/details_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatelessWidget {
  fetchMovies() async {
    var url;
    url = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/now_playing?api_key=0a8d3eeb6d12c58e8ea655f66f5ff088&language=en-US"));
    return json.decode(url.body)['results'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RVmovies"),
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => MemberPage()));
              },
              icon: const Icon(Icons.more_vert));
        }),
      ),
      body: FutureBuilder(
          future: fetchMovies(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                padding: EdgeInsets.all(8),
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Container(
                        height: 300,
                        alignment: Alignment.centerLeft,
                        child: Card(
                          child: Image.network(
                              "https://image.tmdb.org/t/p/w500" +
                                  snapshot.data[index]['poster_path']),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Movie Name: " +
                                    snapshot.data[index]["original_title"],
                                style: TextStyle(color: Color(0xff868597)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 100,
                                child: Text(
                                  'Rating⭐: ' +
                                      (snapshot.data[index]["vote_average"])
                                          .toString(),
                                  style: TextStyle(color: Color(0xff868597)),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailPage(
                                                name: snapshot.data[index]
                                                    ['original_title'],
                                                posterurl:
                                                    'https://image.tmdb.org/t/p/w500' +
                                                        snapshot.data[index]
                                                            ['poster_path'],
                                                description: snapshot
                                                    .data[index]['overview'],
                                                rating: snapshot.data[index]
                                                        ['vote_average']
                                                    .toString(),
                                                
                                              )));
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orange),
                                child: const Text("More"),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
