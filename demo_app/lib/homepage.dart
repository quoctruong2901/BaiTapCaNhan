import 'package:flutter/material.dart';
import 'package:demo_app/square.dart';
import 'package:demo_app/circle.dart';

class HomePage extends StatelessWidget {
  final List _post = ["Post 1", "Post 2", "Post 3", "Post 4", "Post 5"];

  final List _stories = ["Story 1", "Story 2", "Story 3", "Story 4"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // stories
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _stories.length,
              itemBuilder: (context, index) {
                return MyCircle(child: _stories[index]);
              },
            ),
          ),
          // posts
          Expanded(
            child: ListView.builder(
              itemCount: _post.length,
              itemBuilder: (context, index) {
                return MySquare(child: _post[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
