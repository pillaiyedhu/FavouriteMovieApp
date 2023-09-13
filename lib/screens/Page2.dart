import 'package:day9_provider_favlistapp/providers/MovieProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Page2 extends StatefulWidget {
  Page2State createState() {
    return Page2State();
  }
}

class Page2State extends State<Page2> {
  Widget build(BuildContext context) {
    var favList = context.watch<MovieProvider>().favList;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FAv MOviE App',
          style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: favList.length,
          itemBuilder: (context, index) {
            var currentmovie = favList[index];
            return Card(
              key: ValueKey(currentmovie.movieName),
              color: Colors.white,
              child: ListTile(
                title: Text("${currentmovie.movieName}",style: TextStyle(color: Colors.cyan),),
                  subtitle: Text("${currentmovie.duration}",style: TextStyle(color: Colors.cyan),),
                trailing: TextButton(
                  child: Text("Remove",style:TextStyle(color: Colors.red),),
                  onPressed: () {
                    context
                        .read<MovieProvider>()
                        .RemoveFromFavourites(currentmovie);
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
