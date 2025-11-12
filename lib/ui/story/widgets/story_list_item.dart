import 'package:flutter/material.dart';
import 'package:re_tune/ui/story/view_models/story_view_model.dart';
import 'package:re_tune/ui/story/widgets/story_add_edit_view.dart';
import 'package:re_tune/ui/story/widgets/story_details.dart';

import '../../../domain/models/story/story.dart';

class StoryListItem extends StatelessWidget {
  const StoryListItem({
    super.key,
    required this.storyViewModel,
    required this.story,
    required this.initData,
    required this.showAlertDialogDeleteStory,
  });

  final StoryViewModel storyViewModel;
  final Story story;

  final Future<void> Function() initData;
  final void Function(Story story) showAlertDialogDeleteStory;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ExpansionTile(
            title: Text(story.name ?? 'Nothing'),
            leading: Icon(Icons.note),
            children: [
              ListTile(
                title: Text(
                  story.description ?? 'Description of the story goes here.',
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextButton(
                child: Row(
                  children: [
                    Icon(Icons.info, size: 16, color: Colors.blue),
                    SizedBox(width: 2),
                    Text('Details'),
                  ],
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (builder) => StoryDetails(
                        storyViewModel: storyViewModel,
                        story: story,
                      ),
                    ),
                  );
                },
              ),
              TextButton(
                child: Row(
                  children: [
                    Icon(Icons.delete, size: 16, color: Colors.red),
                    SizedBox(width: 2),
                    Text('Delete'),
                  ],
                ),
                onPressed: () => showAlertDialogDeleteStory(story),
              ),
              TextButton(
                child: Row(
                  children: [
                    Icon(Icons.edit, size: 16, color: Colors.amber),
                    SizedBox(width: 2),
                    Text('Edit'),
                  ],
                ),
                onPressed: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (builder) => StoryViewAddEdit(
                        storyViewModel: storyViewModel,
                        story: story,
                      ),
                    ),
                  );
                  initData();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
