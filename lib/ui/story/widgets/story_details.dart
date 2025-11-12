import 'package:flutter/material.dart';
import 'package:re_tune/domain/models/metric/metric.dart';
import 'package:re_tune/ui/story/view_models/story_view_model.dart';

import '../../../domain/models/story/story.dart';

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

  late final int? _metricId;
  final _nameController = TextEditingController();
  final _targetController = TextEditingController();
  final _timeIntervalValues = [
    TimeInterval.daily,
    TimeInterval.weekly,
    TimeInterval.monthly,
  ];
  var _selectedTimeInterval = TimeInterval.daily;

  final List<TextEditingController> _progressControllers = [
    TextEditingController(),
  ];
  final List<TextEditingController> _milestoneControllers = [
    TextEditingController(),
  ];
  final List<TextEditingController> _setbackControllers = [
    TextEditingController(),
  ];

  late final List<Widget> _progressFormWidgets = [
    TextFormField(
      controller: _progressControllers[0],
      decoration: InputDecoration(
        labelText: 'Progress made',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          borderSide: BorderSide(color: Colors.black, width: 1),
        ),
      ),
      validator: (value) => value,
    ),
    Row(
      children: [
        IconButton(
          icon: Icon(Icons.remove, color: Colors.red),
          onPressed: () {
            setState(() {
              _removeTextFormFieldInWidgetList(
                _progressFormWidgets,
                _progressControllers,
              );
            });
          },
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            setState(() {
              _insertTextFormFieldInWidgetList(
                _progressFormWidgets,
                _progressControllers,
              );
            });
          },
        ),
      ],
    ),
  ];

  late final List<Widget> _milestoneFormWidgets = [
    TextFormField(
      controller: _milestoneControllers[0],
      decoration: InputDecoration(
        labelText: 'Milestones',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          borderSide: BorderSide(color: Colors.black, width: 1),
        ),
      ),
      validator: (value) => value,
    ),
    Row(
      children: [
        IconButton(
          icon: Icon(Icons.remove, color: Colors.red),
          onPressed: () {
            setState(() {
              _removeTextFormFieldInWidgetList(
                _milestoneFormWidgets,
                _milestoneControllers,
              );
            });
          },
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            setState(() {
              _insertTextFormFieldInWidgetList(
                _milestoneFormWidgets,
                _milestoneControllers,
              );
            });
          },
        ),
      ],
    ),
  ];
  late final List<Widget> _setbacksFormWidgets = [
    TextFormField(
      controller: _setbackControllers[0],
      decoration: InputDecoration(
        labelText: 'Setbacks',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          borderSide: BorderSide(color: Colors.black, width: 1),
        ),
      ),
      validator: (value) => value,
    ),
    Row(
      children: [
        IconButton(
          icon: Icon(Icons.remove, color: Colors.red),
          onPressed: () {
            setState(() {
              _removeTextFormFieldInWidgetList(
                _setbacksFormWidgets,
                _setbackControllers,
              );
            });
          },
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            setState(() {
              _insertTextFormFieldInWidgetList(
                _setbacksFormWidgets,
                _setbackControllers,
              );
            });
          },
        ),
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _initMetricData();
  }

  void _initMetricData() async {
    final metricsList = await widget.storyViewModel.getMetricsOfStory(
      widget.story.id,
    );

    if (metricsList.isEmpty) return;

    final metric = metricsList[0];

    _metricId = metric.id;
    _nameController.text = metric.name ?? '';
    _targetController.text = metric.target ?? '';

    if (metric.progressValues != null && metric.progressValues!.isNotEmpty) {
      _progressFormWidgets.removeAt(0);
      _progressControllers.removeAt(0);
      for (final progress in metric.progressValues!) {
        final controller = TextEditingController()..text = progress;
        _progressFormWidgets.insert(
          _progressFormWidgets.length - 1,
          TextFormField(controller: controller, validator: (value) => value),
        );
        _progressControllers.add(controller);
      }
    }

    if (metric.milestoneNames != null && metric.milestoneNames!.isNotEmpty) {
      _milestoneFormWidgets.removeAt(0);
      _milestoneControllers.removeAt(0);
      for (final milestone in metric.milestoneNames!) {
        final controller = TextEditingController()..text = milestone;
        _milestoneFormWidgets.insert(
          _milestoneFormWidgets.length - 1,
          TextFormField(controller: controller, validator: (value) => value),
        );
        _milestoneControllers.add(controller);
      }
    }

    if (metric.setbackNames != null && metric.setbackNames!.isNotEmpty) {
      _setbacksFormWidgets.removeAt(0);
      _setbackControllers.removeAt(0);
      for (final setback in metric.setbackNames!) {
        final controller = TextEditingController()..text = setback;
        _setbacksFormWidgets.insert(
          _setbacksFormWidgets.length - 1,
          TextFormField(controller: controller, validator: (value) => value),
        );
        _setbackControllers.add(controller);
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.story.name}'),
        actions: [
          TextButton(
            onPressed: () {
              _saveMetric();
            },
            child: Text('Save'),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            _storyInfoSection(widget.story),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Card(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _nameController,
                                decoration: InputDecoration(
                                  labelText: 'Metric Name',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(4.0),
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                validator: (value) => value,
                              ),
                            ),
                            SizedBox(width: 2),
                            Expanded(
                              child: TextFormField(
                                controller: _targetController,
                                decoration: InputDecoration(
                                  labelText: 'Target',
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(4.0),
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                validator: (value) => value,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      DropdownButton<TimeInterval>(
                        value: _selectedTimeInterval,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        onChanged: (TimeInterval? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            if (value != null) {
                              _selectedTimeInterval = value;
                            }
                          });
                        },
                        items: _timeIntervalValues
                            .map<DropdownMenuItem<TimeInterval>>((
                              TimeInterval value,
                            ) {
                              return DropdownMenuItem<TimeInterval>(
                                value: value,
                                child: Text(_getTimeIntervalValue(value)),
                              );
                            })
                            .toList(),
                      ),
                    ],
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Card(
                          child: Column(children: _progressFormWidgets),
                        ),
                      ),
                      SizedBox(width: 2),
                      Expanded(
                        child: Card(
                          child: Column(children: _milestoneFormWidgets),
                        ),
                      ),
                    ],
                  ),
                  Card(child: Column(children: _setbacksFormWidgets)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _storyInfoSection(Story story) {
    return Card(
      child: Column(
        children: [
          Row(children: [Text('Name: '), Text(story.name ?? '')]),
          Row(children: [Text('Description: '), Text(story.description ?? '')]),
          Row(
            children: [Text('Start Date: '), Text(story.startDate.toString())],
          ),
          Row(children: [Text('End Date: '), Text(story.endDate.toString())]),
        ],
      ),
    );
  }

  void _saveMetric() {
    final metric = Metric()
      ..name = _nameController.text
      ..target = _targetController.text
      ..progressTimeInterval = _selectedTimeInterval
      ..progressValues = List.generate(
        _progressControllers.length,
        (index) => _progressControllers[index].text,
      )
      ..progressDone = List.generate(
        _progressControllers.length,
        (index) => false,
      )
      ..milestoneNames = List.generate(
        _milestoneControllers.length,
        (index) => _milestoneControllers[index].text,
      )
      ..milestonesDone = List.generate(
        _milestoneControllers.length,
        (index) => false,
      )
      ..setbackNames = List.generate(
        _setbackControllers.length,
        (index) => _setbackControllers[index].text,
      )
      ..storyId = widget.story.id;

    if (_metricId != null) metric.id = _metricId;
    widget.storyViewModel.pushMetric(metric);
  }

  void _insertTextFormFieldInWidgetList(
    List<Widget> formList,
    List<TextEditingController> controllers,
  ) {
    controllers.add(TextEditingController());
    formList.insert(
      formList.length - 1,
      TextFormField(
        controller: controllers.last,
        validator: (value) => value,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            borderSide: BorderSide(color: Colors.black, width: 1),
          ),
        ),
      ),
    );
  }

  void _removeTextFormFieldInWidgetList(
    List<Widget> formList,
    List<TextEditingController> controllers,
  ) {
    if (formList.length <= 2) return;
    controllers.removeLast();
    formList.removeAt(formList.length - 2);
  }

  String _getTimeIntervalValue(TimeInterval interval) {
    return switch (interval) {
      TimeInterval.daily => 'Daily',
      TimeInterval.weekly => 'Weekly',
      TimeInterval.monthly => 'Monthly',
      //_ => 'Unknown time interval',
    };
  }
}
