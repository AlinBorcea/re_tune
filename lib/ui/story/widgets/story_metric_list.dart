import 'package:flutter/material.dart';

class StoryMetricList extends StatefulWidget {
  const StoryMetricList({
    super.key,
    required this.title,
    required this.controllers,
  });

  final String title;
  final List<TextEditingController> controllers;

  @override
  State<StatefulWidget> createState() => _StoryMetricListState();
}

class _StoryMetricListState extends State<StoryMetricList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.controllers.length + 2,
      itemBuilder: (context, index) {
        if (index == 0) return Text(widget.title);
        if (index == widget.controllers.length + 1) {
          return Row(
            children: [
              IconButton(
                onPressed: () {
                  widget.controllers.removeLast();
                  setState(() {});
                },
                icon: Icon(Icons.minimize),
              ),
              IconButton(
                onPressed: () {
                  widget.controllers.add(TextEditingController());
                  setState(() {});
                },
                icon: Icon(Icons.add),
              ),
            ],
          );
        }

        return TextField(controller: widget.controllers[index-1]);
      },
    );
  }
}
