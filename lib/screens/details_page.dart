import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final int index;
  const DetailsPage({super.key, required this.index});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  String nome(int index) => switch (index) {
        0 => 'segunda',
        1 => 'terça',
        2 => 'quarta',
        3 => 'quinta',
        4 => 'sexta',
        5 => 'sábado',
        _ => 'desconhecido'
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Refeição de ${nome(widget.index)}'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Hero(
              tag: widget.index,
              child: CarouselView.weighted(
                flexWeights: [10],
                itemSnapping: true,
                // itemExtent: 350,
                children: [
                  for (int i = 0; i < 5; i++)
                    CachedNetworkImage(
                      imageUrl:
                          'https://picsum.photos/seed/${widget.index * 7}/350/250',
                      fit: BoxFit.fill,
                    )
                ],
              ),
            ),
          ),
          Expanded(
              child: const Text(
                  '"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."')),
        ],
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () => Navigator.of(context).pop()),
    );
  }
}
