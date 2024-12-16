import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/movieProvider.dart';

void main() => runApp(ChangeNotifierProvider<MovieProvider>(
    create: (BuildContext context) => MovieProvider(),
    child: MaterialApp(
      home: MovieMain(),
      debugShowCheckedModeBanner: false,
    )));

class MovieMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var wishMovies = context.watch<MovieProvider>().movieWishlist;
    var movies = context.watch<MovieProvider>().movies;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ElevatedButton.icon(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => WishListScreen())),
                label: Text(
                    'My Wishlist (${wishMovies.length} movies)'),
                icon: const Icon(Icons.favorite_border)),
            Expanded(child: ListView.builder(
                itemCount:movies.length,
                itemBuilder: (context, index) {
              final currentMovie = movies[index];
              return Card(
                child: ListTile(
                  title: Text(currentMovie.title),
                  subtitle: Text(currentMovie.time!),
                  trailing: IconButton(
                      onPressed: () {
                        if (!wishMovies.contains(currentMovie)) {
                          context
                              .read<MovieProvider>()
                              .addToWishlist(currentMovie);
                        } else {
                          context
                              .read<MovieProvider>()
                              .removeFromWishlist(currentMovie);
                        }
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: wishMovies.contains(currentMovie)
                            ? Colors.red
                            : Colors.black26,
                      )),
                ),
              );
            }))
          ],
        ),
      ),
    );
  }
}

class WishListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var wishMovies = context.watch<MovieProvider>().movieWishlist;

    return Scaffold(
      appBar: AppBar(
        title: Text('My wishlist'),
      ),
      body: ListView.builder(
          itemCount: wishMovies.length,
          itemBuilder: (context, index) {
            final wishedMovie = wishMovies[index];

            return Card(
              child: ListTile(
                title: Text(wishedMovie.title),
                subtitle: Text(wishedMovie.time!),
                trailing: TextButton(
                    onPressed: () {
                      context
                          .read<MovieProvider>()
                          .removeFromWishlist(wishedMovie);
                    },
                    child: Text('Remove')),
              ),
            );
          }),
    );
  }
}
