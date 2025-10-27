import 'package:flutter/material.dart';

class StoryDetails extends StatefulWidget {
  const StoryDetails({super.key});

  @override
  State<StatefulWidget> createState() => _StoryDetailsState();
}

class _StoryDetailsState extends State<StoryDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Story details go here!')));
  }
}
