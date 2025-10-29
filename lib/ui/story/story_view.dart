import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:re_tune/ui/story/story_add_edit_view.dart';
import 'package:re_tune/ui/story/story_details.dart';
import 'package:re_tune/ui/story/story_view_model.dart';

import '../../domain/models/story/story.dart';

class StoryView extends StatefulWidget {
  const StoryView({super.key});

  @override
  State<StatefulWidget> createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView> {
  late StoryViewModel _viewModel;
  late List<Story> _stories;
  bool _initDone = false;

  @override
  void initState() {
    super.initState();
    _initAll();
  }

  void _initAll() async {
    await _initIsar();
    await _initData();
  }

  Future<void> _initIsar() async {
    final path = await getApplicationDocumentsDirectory();
    _viewModel = StoryViewModel(path.path);
  }

  Future<void> _initData() async {
    _stories = await _viewModel.stories;
    _initDone = true;
    debugPrint(_stories.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stories')),
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
                StoryViewAddEdit(storyViewModel: _viewModel, story: null),
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
                        storyViewModel: _viewModel,
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
                        storyViewModel: _viewModel,
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
              await _viewModel.deleteStory(story);
              Navigator.pop(context);
              _initData();
            },
          ),
        ],
      ),
    );
  }
}
