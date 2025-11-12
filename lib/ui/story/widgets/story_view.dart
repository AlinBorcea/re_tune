import 'package:flutter/material.dart';

import 'package:re_tune/ui/story/widgets/story_add_edit_view.dart';

import 'package:re_tune/ui/story/widgets/story_view_popup_menu.dart';
import 'package:re_tune/ui/story/widgets/story_list_item.dart';

import 'package:re_tune/ui/story/view_models/story_view_model.dart';

import '../../../domain/models/story/story.dart';

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
        actions: [StoryViewPopupMenu(storyViewModel: widget.viewModel)],
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
              itemBuilder: (context, index) => StoryListItem(
                storyViewModel: widget.viewModel,
                story: _stories[index],
                initData: _initData,
                showAlertDialogDeleteStory: _showAlertDialogDeleteStory,
              ),
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
