import 'package:flutter/material.dart';

import 'articlejp1.dart';
import 'articlejp2.dart';
import 'articlejp3.dart';
import 'articlekfc.dart';

class ArticleCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final VoidCallback onPressed;

  const ArticleCard({
    Key? key, // Use Key? key instead of super.key
    required this.title,
    required this.imageUrl,
    required this.onPressed,
  }) : super(key: key); // Pass key to super constructor

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imageUrl,
              width: 150,  // Adjust the width as per your requirement
              height: 100, // Adjust the height as per your requirement
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 97, 94, 252),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: onPressed,
                    child: const Text('View More'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArticleList extends StatelessWidget {
  const ArticleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        ArticleCard(
          title: 'Jawa Timur Park 1',
          imageUrl: 'assets/img/jp1.jpeg',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ArticleJP1()),
            );
          },
        ),
        ArticleCard(
          title: 'Jawa Timur Park 2',
          imageUrl: 'assets/img/jp2.jpg',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ArticleJP2()),
            );
          },
        ),
        ArticleCard(
          title: 'Jawa Timur Park 3',
          imageUrl: 'assets/img/jp3.jpg',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ArticleJP3()),
            );
          },
        ),
        ArticleCard(
          title: 'KFC',
          imageUrl: 'assets/img/kfc.jpg',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ArticleKFC()),
            );
          },
        ),
        // Add more ArticleCards as needed
      ],
    );
  }
}