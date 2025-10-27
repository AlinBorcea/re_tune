import 'package:flutter/material.dart';
import 'package:re_tune/ui/story/story_view_model.dart';

import '../../domain/models/story/story.dart';

class StoryDetails extends StatefulWidget {
  const StoryDetails({
    super.key,
    required this.storyViewModel,
    required this.story,
  });

  final StoryViewModel storyViewModel;
  final Story story;

  @override
  State<StatefulWidget> createState() => _StoryDetailsState();
}

class _StoryDetailsState extends State<StoryDetails> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _targetController = TextEditingController();
  final _progressValuesController = TextEditingController();
  final _milestoneValuesController = TextEditingController();
  final _setbackValuesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initMetricData();
  }

  void _initMetricData() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details of story')),
      body: Center(
        child: Column(
          children: [
            Container(child: Text('Story info ${widget.story}')),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: 'Metric Name'),
                    validator: (value) => value,
                  ),
                  TextFormField(
                    controller: _targetController,
                    decoration: InputDecoration(labelText: 'Target'),
                    validator: (value) => value,
                  ),
                  Text('Progress time interval picker'),
                  TextFormField(
                    controller: _progressValuesController,
                    decoration: InputDecoration(labelText: 'Progress made'),
                    validator: (value) => value,
                  ),
                  TextFormField(
                    controller: _milestoneValuesController,
                    decoration: InputDecoration(labelText: 'Milestones'),
                    validator: (value) => value,
                  ),
                  TextFormField(
                    controller: _setbackValuesController,
                    decoration: InputDecoration(labelText: 'Setbacks'),
                    validator: (value) => value,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
