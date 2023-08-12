import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  // const Detail({super.key});
  final url;
  final title;
  final content;
  final publishedAt;
  final author;
  final urlToImage;

  const Detail({
    super.key,
    this.url,
    this.title,
    this.content,
    this.publishedAt,
    this.author,
    this.urlToImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            urlToImage != null
                ? Image.network(urlToImage)
                : Container(
                    width: double.infinity,
                    height: 250,
                    color: Colors.grey,
                    child: const Icon(
                      Icons.image_not_supported,
                      size: 100,
                    ),
                  ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      title != null ? '$title' : 'No title',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      publishedAt != null
                          ? '$publishedAt'
                          : 'NO current date in public',
                      style: const TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text(content != null ? '$content' : 'No content'),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text(author != null ? '$author' : 'no author'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text(url != null ? '$url' : 'no url'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.close),
        onPressed: () => Navigator.pop(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
