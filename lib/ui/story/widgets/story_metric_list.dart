import 'package:flutter/material.dart';

class StoryMetricList extends StatefulWidget {
  const StoryMetricList({super.key, required this.title, required this.values});

  final String title;
  final List<String> values;

  @override
  State<StatefulWidget> createState() => _StoryMetricListState();
}

class _StoryMetricListState extends State<StoryMetricList> {
  late List<String> _values;

  @override
  void initState() {
    super.initState();
    _values = widget.values;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.values.length,
      itemBuilder: (context, index) {
        return Text('Item $index');
      },
    );
  }
}
