import 'package:flutter/material.dart';
import 'package:re_tune/domain/models/story/story.dart';
import 'package:re_tune/ui/story/story_view_model.dart';

class StoryViewAdd extends StatelessWidget {
  final StoryViewModel storyViewModel;

  const StoryViewAdd({super.key, required this.storyViewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Story')),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              storyViewModel.putStory(Story());
              Navigator.of(context).pop();
            },
            child: Text('Add Story to IsarDB'),
          ),
        ],
      ),
    );
  }
}
