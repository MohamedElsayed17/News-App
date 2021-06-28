import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/modules/05-web_view_screen/web_view_screen.dart';

Widget buildListItem(
    {required BuildContext context, required ArticalModel articalModel}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
    child: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebViewScreen(url: articalModel.url),
          ),
        );
      },
      child: Container(
        height: 120,
        child: Row(
          children: [
            Image.network(
              articalModel.urlToImage,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      articalModel.description,
                      style: Theme.of(context).textTheme.subtitle1,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                  Text(
                    articalModel.publishedAt,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildList({required List<ArticalModel> list}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListView.separated(
      itemBuilder: (context, index) {
        return buildListItem(context: context, articalModel: list[index]);
      },
      separatorBuilder: (context, index) {
        return Container(
          height: 2,
          color: Colors.grey,
        );
      },
      itemCount: list.length,
      physics: BouncingScrollPhysics(),
    ),
  );
}
