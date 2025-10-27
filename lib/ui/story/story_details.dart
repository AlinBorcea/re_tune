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

  late final List<Widget> _progressFormWidgets = [
    TextFormField(
      controller: _progressValuesController,
      decoration: InputDecoration(labelText: 'Progress made'),
      validator: (value) => value,
    ),
    Row(
      children: [
        ElevatedButton(onPressed: () {}, child: Text('Add Progress')),
        ElevatedButton(onPressed: () {}, child: Text('Remove Progress')),
      ],
    ),
  ];

  late final List<Widget> _milestoneFormWidgets = [
    TextFormField(
      controller: _milestoneValuesController,
      decoration: InputDecoration(labelText: 'Milestones'),
      validator: (value) => value,
    ),
    Row(
      children: [
        ElevatedButton(onPressed: () {}, child: Text('Add Milestone')),
        ElevatedButton(onPressed: () {}, child: Text('Remove Milestone')),
      ],
    ),
  ];
  late final List<Widget> _setbacksFormWidgets = [
    TextFormField(
      controller: _setbackValuesController,
      decoration: InputDecoration(labelText: 'Setbacks'),
      validator: (value) => value,
    ),
    Row(
      children: [
        ElevatedButton(onPressed: () {}, child: Text('Add Setback')),
        ElevatedButton(onPressed: () {}, child: Text('Remove Setback')),
      ],
    ),
  ];

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
            Card(child: Text('Story info ${widget.story}')),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Card(
                    child: Column(
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
                      ],
                    ),
                  ),

                  Text('Progress time interval picker'),
                  Card(child: Column(children: _progressFormWidgets)),
                  Card(child: Column(children: _milestoneFormWidgets)),
                  Card(child: Column(children: _setbacksFormWidgets)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
