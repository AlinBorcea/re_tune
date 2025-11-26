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

  late List<TextEditingController> _progressControllers;
  late List<TextEditingController> _milestoneControllers;
  late List<TextEditingController> _setbackControllers;

  final _timeIntervalValues = [
    TimeInterval.daily,
    TimeInterval.weekly,
    TimeInterval.monthly,
  ];
  var _selectedTimeInterval = TimeInterval.daily;

  late final Metric _metric;
  bool _initDone = false;

  @override
  void initState() {
    super.initState();
    _initMetric();
  }

  Future<void> _initMetric() async {
    final metricsOfStory = await widget.storyViewModel.getMetricsOfStory(
      widget.story.id,
    );

    _metric = metricsOfStory.firstOrNull ?? Metric();
    _nameController.text = _metric.name ?? '';
    _targetController.text = _metric.target ?? '';

    _progressControllers = _metric.progressValues == null
        ? []
        : List.generate(
            _metric.progressValues!.length,
            (index) =>
                TextEditingController(text: _metric.progressValues![index]),
          );

    _milestoneControllers = _metric.milestoneNames == null
        ? []
        : List.generate(
            _metric.milestoneNames!.length,
            (index) =>
                TextEditingController(text: _metric.milestoneNames![index]),
          );

    _setbackControllers = _metric.setbackNames == null
        ? []
        : List.generate(
            _metric.setbackNames!.length,
            (index) =>
                TextEditingController(text: _metric.setbackNames![index]),
          );

    _initDone = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (!_initDone) return Text('Loading...');

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.story.name}'),
        actions: [
          TextButton(
            onPressed: () {
              _saveMetrics();
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

  void _saveMetrics() {
    _metric.name = _nameController.text;
    _metric.target = _targetController.text;
    _metric.progressTimeInterval = _selectedTimeInterval;
    _metric.storyId = widget.story.id;

    _metric.progressValues = List.generate(
      _progressControllers.length,
      (index) => _progressControllers[index].text,
    );

    _metric.milestoneNames = List.generate(
      _milestoneControllers.length,
      (index) => _milestoneControllers[index].text,
    );

    _metric.setbackNames = List.generate(
      _setbackControllers.length,
      (index) => _setbackControllers[index].text,
    );

    widget.storyViewModel.pushMetric(_metric);
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
