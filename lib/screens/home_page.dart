import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final images = List.generate(
    6,
    (index) => Hero(
      key: ValueKey(index),
      tag: index,
      child: CachedNetworkImage(
        imageUrl: 'https://picsum.photos/seed/${index * 7}/350/250',
        fit: BoxFit.cover,
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bandeco'),
      ),
      body: SizedBox(
        // height: 650,
        child: CarouselView.weighted(
          flexWeights: const [1, 8, 1],
          // itemExtent: 350,
          itemSnapping: true,
          children: images,
          onTap: (value) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailsPage(index: value),
            ));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const DetailsPage(index: 1),
          ));
        },
      ),
    );
  }
}
