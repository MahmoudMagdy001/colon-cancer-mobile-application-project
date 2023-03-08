// ignore_for_file: sized_box_for_whitespace

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../../../modules/web_view/web_view_screen.dart';
import '../divider/divider.dart';
import '../navigator_push/navigator_push.dart';

Widget buildArticleItem(article, context) => InkWell(
      onTap: () {
        navigatePushTo(context, WebViewScreen(article['url']));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            // Container(
            //   width: 120.0,
            //   height: 120.0,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10.0),
            //     image: DecorationImage(
            //       image: NetworkImage('${article['urlToImage']}'),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   width: 20.0,
            // ),
            Expanded(
              child: Container(
                height: 120.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
Widget articleBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
    condition: list.isNotEmpty,
    builder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(list[index], context),
        separatorBuilder: (context, index) => CustomDivider(),
        itemCount: list.length),
    fallback: (context) => isSearch
        ? Container()
        : const Center(child: CircularProgressIndicator()));
