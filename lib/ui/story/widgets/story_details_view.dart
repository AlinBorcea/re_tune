import 'package:flutter/material.dart';
import 'package:re_tune/domain/models/metric/metric.dart';
import 'package:re_tune/ui/story/view_models/story_view_model.dart';
import 'package:re_tune/ui/story/widgets/story_metric_list.dart';

import '../../../domain/models/story/story.dart';
import '../../../utils/utils.dart';

class StoryDetailsView extends StatefulWidget {
  const StoryDetailsView({
    super.key,
    required this.storyViewModel,
    required this.story,
  });

  final StoryViewModel storyViewModel;
  final Story story;

  @override
  State<StatefulWidget> createState() => _StoryDetailsViewState();
}

class _StoryDetailsViewState extends State<StoryDetailsView> {
  final _nameController = TextEditingController();
  final _targetController = TextEditingController();

  final List<TextEditingController> _progressControllers = [];
  final List<TextEditingController> _milestoneControllers = [];
  final List<TextEditingController> _setbackControllers = [];

  final _timeIntervalValues = [
    TimeInterval.daily,
    TimeInterval.weekly,
    TimeInterval.monthly,
  ];
  var _selectedTimeInterval = TimeInterval.daily;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.story.name}'),
        actions: [
          TextButton(
            onPressed: () {
              //_saveMetric();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Saved Details'),
                  duration: Duration(seconds: 2),
                ),
              );
              Navigator.of(context).pop();
            },
            child: Text('Save', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Column(
        children: [
          /// Story section
          Row(
            children: [
              Expanded(
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name: ${widget.story.name ?? ''}'),
                      Text('Description: ${widget.story.description ?? ''}'),
                      Text(
                        'Start Date: ${widget.story.startDate != null ? formattedDate(widget.story.startDate!) : ''}',
                      ),
                      Text(
                        'End Date: ${widget.story.endDate != null ? formattedDate(widget.story.endDate!) : ''}',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          /// Name and target section
          Row(
            children: [
              Expanded(
                child: Card(
                  child: Row(
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
                ),
              ),
            ],
          ),

          /// Time interval section
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
                items: _timeIntervalValues.map<DropdownMenuItem<TimeInterval>>((
                  TimeInterval value,
                ) {
                  return DropdownMenuItem<TimeInterval>(
                    value: value,
                    child: Text(_getTimeIntervalValue(value)),
                  );
                }).toList(),
              ),
            ],
          ),

          /// progress milestone section
          Row(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Card(
                        child: StoryMetricList(
                          title: 'Progress',
                          controllers: _progressControllers,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        child: StoryMetricList(
                          title: 'Milestones',
                          controllers: _milestoneControllers,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Row(
            children: [
              Expanded(
                child: Card(
                  child: StoryMetricList(
                    title: 'Setbacks',
                    controllers: _setbackControllers,
                  ),
                ),
              ),
              Expanded(child: SizedBox()),
            ],
          ),
        ],
      ),
    );
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
