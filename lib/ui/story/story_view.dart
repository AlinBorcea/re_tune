import 'package:flutter/material.dart';
import 'package:re_tune/ui/settings/time_settings.dart';
import 'package:re_tune/ui/story/story_add_edit_view.dart';
import 'package:re_tune/ui/story/story_details.dart';
import 'package:re_tune/ui/story/story_view_model.dart';

import '../../domain/models/story/story.dart';

class StoryView extends StatefulWidget {
  const StoryView({super.key, required this.viewModel});

  final StoryViewModel viewModel;

  @override
  State<StatefulWidget> createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView> {
  late List<Story> _stories;
  bool _initDone = false;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    _stories = await widget.viewModel.stories;
    _initDone = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stories'),
        actions: [
          PopupMenuButton<void Function()>(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text('Time Settings'),
                  value: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TimeSettings()),
                  ),
                ),
              ];
            },
            onSelected: (fn) => fn(),
          ),
        ],
      ),
      body: _body(),
      floatingActionButton: _fab(),
    );
  }

  Widget _body() {
    return _initDone
        ? Card(
            child: ListView.builder(
              padding: EdgeInsets.all(2.0),
              itemCount: _stories.length,
              itemBuilder: (context, index) => _storyItem(_stories[index]),
            ),
          )
        : Text("Init not done!");
  }

  Widget _fab() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (builder) =>
                StoryViewAddEdit(storyViewModel: widget.viewModel, story: null),
          ),
        );
        _initData();
      },
    );
  }

  Widget _storyItem(Story story) {
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
                        storyViewModel: widget.viewModel,
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
                onPressed: () => _showAlertDialogDeleteStory(story),
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
                        storyViewModel: widget.viewModel,
                        story: story,
                      ),
                    ),
                  );
                  _initData();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showAlertDialogDeleteStory(Story story) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete story ${story.name}?'),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context, 'Cancel'),
          ),
          TextButton(
            child: const Text('Yes'),
            onPressed: () async {
              await widget.viewModel.deleteStory(story);
              Navigator.pop(context);
              _initData();
            },
          ),
        ],
      ),
    );
  }
}
