import 'package:day9_provider_favlistapp/providers/MovieProvider.dart';
import 'package:day9_provider_favlistapp/screens/Page2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Page1 extends StatefulWidget {
  Page1State createState() {
    return Page1State();
  }
}

class Page1State extends State<Page1> {
  Widget build(BuildContext context) {
    var movies = context.watch<MovieProvider>().movies;
    var favList = context.watch<MovieProvider>().favList;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FAv MOviE App',
          style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Page2(),
              ));
            },
          )
        ],
      ),
      body: Center(
          child: ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              var currentmovie = movies[index];
              return Card(
                key: ValueKey(currentmovie.movieName),
                color: Colors.blueAccent,
                elevation: 4,
                child: ListTile(
                  title: Text("${currentmovie.movieName}"),
                  subtitle: Text("${currentmovie.duration}"),
                  trailing: IconButton(
                    icon: Icon(Icons.favorite),
                    color: favList.contains(currentmovie)
                        ? Colors.red
                        : Colors.white,
                    onPressed: () {
                      if (favList.contains(currentmovie)) {
                        context
                            .read<MovieProvider>()
                            .RemoveFromFavourites(currentmovie);
                      } else {
                        context
                            .read<MovieProvider>()
                            .AddToFavourites(currentmovie);
                      }
                    },
                  ),
                ),
              );
            },
          ),
        
      ),
    );
  }
}
