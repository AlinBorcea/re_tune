import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:re_tune/ui/story/story_add_view.dart';
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
    _initData();
  }

  void _initData() async {
    final path = await getApplicationDocumentsDirectory();
    _viewModel = StoryViewModel(path.path);
    _stories = await _viewModel.stories;
    _initDone = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stories')),
      body: _initDone
          ? ListView.builder(
              itemCount: _stories.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  leading: Text('Item'),
                  trailing: TextButton.icon(
                    onPressed: () {},
                    label: Icon(Icons.info),
                  ),
                ),
              ),
            )
          : Text("Init not done!"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (builder) => StoryViewAdd(storyViewModel: _viewModel),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
