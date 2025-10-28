import 'package:flutter/material.dart';
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
      body: _initDone
          ? ListView.builder(
              itemCount: _stories.length,
              itemBuilder: (context, index) => _storyItem(_stories[index]),
            )
          : Text("Init not done!"),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (builder) =>
                  StoryViewAddEdit(storyViewModel: _viewModel, story: null),
            ),
          );
          debugPrint('Fab debug re init data');
          _initData();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _storyItem(Story story) {
    return Card(
      child: ExpansionTile(
        title: Text(story.name ?? 'Nothing'),
        leading: Icon(Icons.note),
        children: [
          ListTile(
            title: Text(
              story.description ?? 'Description of the story goes here.',
            ),
          ),
          Card(
            child: Row(
              children: [
                TextButton(
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
                  child: Text('Details'),
                ),
                TextButton(
                  onPressed: () => _showAlertDialogDeleteStory(story),
                  child: Text('Delete'),
                ),
                TextButton(
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
                  child: Text('Edit'),
                ),
              ],
            ),
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
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              await _viewModel.deleteStory(story);
              Navigator.pop(context);
              _initData();
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }
}
