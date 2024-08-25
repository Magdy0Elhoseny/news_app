import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/articale_model.dart';

class NewsPost extends StatelessWidget {
  const NewsPost({super.key, required this.articaleModel});
  final ArticaleModel articaleModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6.0),
          child: articaleModel.image != null
              ? Image.network(
                  articaleModel.image!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              : CachedNetworkImage(
                  imageUrl: 'https://demofree.sirv.com/nope-not-here.jpg',
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
        ),
        const SizedBox(height: 12),
        Text(
          articaleModel.title!,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          articaleModel.subTitle ?? '',
          maxLines: 2,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
