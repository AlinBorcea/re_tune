import 'package:flutter/material.dart';
import 'package:re_tune/ui/story/view_models/story_view_model.dart';
import 'package:re_tune/ui/story/widgets/story_add_edit_view.dart';
import 'package:re_tune/ui/story/widgets/story_details.dart';

import '../../../domain/models/story/story.dart';

class StoryListItem extends StatefulWidget {
  const StoryListItem({
    super.key,
    required this.storyViewModel,
    required this.story,
    required this.initData,
  });

  final StoryViewModel storyViewModel;
  final Story story;

  final Future<void> Function() initData;

  @override
  State<StatefulWidget> createState() => _StoryListItemState();
}

class _StoryListItemState extends State<StoryListItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ExpansionTile(
            title: Text(widget.story.name ?? 'Nothing'),
            leading: Icon(Icons.note),
            children: [
              ListTile(
                title: Text(
                  widget.story.description ??
                      'Description of the story goes here.',
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
                        storyViewModel: widget.storyViewModel,
                        story: widget.story,
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
                onPressed: () => _showAlertDialogDeleteStory(),
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
                        storyViewModel: widget.storyViewModel,
                        story: widget.story,
                      ),
                    ),
                  );
                  widget.initData();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showAlertDialogDeleteStory() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete story ${widget.story.name}?'),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context, 'Cancel'),
          ),
          TextButton(
            child: const Text('Yes'),
            onPressed: () async {
              await widget.storyViewModel.deleteStory(widget.story);
              Navigator.pop(context);
              widget.initData();
            },
          ),
        ],
      ),
    );
  }
}
