import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

import 'package:re_tune/ui/story/view_models/story_view_model.dart';

import 'package:re_tune/ui/story/widgets/story_details.dart';

import '../../../domain/models/story/story.dart';

class StoryListItem extends StatefulWidget {
  const StoryListItem({
    super.key,
    required this.storyViewModel,
    required this.story,
    required this.initData,
  });

  final StoryViewModel storyViewModel;
  final Story story;

  final Future<void> Function() initData;

  @override
  State<StatefulWidget> createState() => _StoryListItemState();
}

class _StoryListItemState extends State<StoryListItem> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  var _editModeOn = false;

  DateTime? _pickedStartDate;
  DateTime? _pickedEndDate;

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.story.name ?? '';
    _descriptionController.text = widget.story.description ?? '';
    _startDateController.text = widget.story.startDate?.toString() ?? '';
    _endDateController.text = widget.story.endDate?.toString() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ExpansionTile(
            title: _editModeOn
                ? TextField(controller: _titleController)
                : Text(_titleController.text),
            leading: Icon(Icons.note),
            children: [
              ListTile(
                title: _editModeOn
                    ? TextField(controller: _descriptionController)
                    : Text(_descriptionController.text),
              ),
              ListTile(
                title: Row(
                  children: [
                    SizedBox(
                      width: 150,
                      child: TextField(
                        controller: _startDateController,
                        onTap: () async {
                          if (!_editModeOn) return;

                          final pickedDate = await showAdaptiveDateTimePicker(
                            context: context,
                            mode: DateTimeFieldPickerMode.date,
                          );
                          if (pickedDate != null) {
                            _startDateController.text = pickedDate.toString();
                            _pickedStartDate = pickedDate;
                            setState(() {});
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: TextField(
                        controller: _endDateController,
                        onTap: () async {
                          if (!_editModeOn) return;

                          final pickedDate = await showAdaptiveDateTimePicker(
                            context: context,
                            mode: DateTimeFieldPickerMode.date,
                          );

                          if (pickedDate != null) {
                            _endDateController.text = pickedDate.toString();
                            _pickedEndDate = pickedDate;
                            setState(() {});
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextButton(
                child: Row(
                  children: [
                    Icon(Icons.info, size: 16, color: Colors.blue),
                    SizedBox(width: 2),
                    Text('Details'),
                  ],
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (builder) => StoryDetails(
                        storyViewModel: widget.storyViewModel,
                        story: widget.story,
                      ),
                    ),
                  );
                },
              ),

              TextButton(
                child: Row(
                  children: [
                    Icon(Icons.delete, size: 16, color: Colors.red),
                    SizedBox(width: 2),
                    Text('Delete'),
                  ],
                ),
                onPressed: () => _showAlertDialogDeleteStory(),
              ),

              TextButton(
                child: Row(
                  children: [
                    Icon(
                      _editModeOn ? Icons.done : Icons.edit,
                      size: 16,
                      color: Colors.amber,
                    ),
                    SizedBox(width: 2),
                    Text(_editModeOn ? 'Finish' : 'Edit'),
                  ],
                ),
                onPressed: () async {
                  if (_editModeOn) {
                    widget.story.name = _titleController.text;
                    widget.story.description = _descriptionController.text;
                    widget.story.startDate = _pickedStartDate;
                    widget.story.endDate = _pickedEndDate;

                    widget.storyViewModel.putStory(widget.story);
                  } else {
                    debugPrint('Going into edit');
                  }

                  _editModeOn = !_editModeOn;
                  setState(() {});
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showAlertDialogDeleteStory() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete story ${widget.story.name}?'),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context, 'Cancel'),
          ),
          TextButton(
            child: const Text('Yes'),
            onPressed: () async {
              await widget.storyViewModel.deleteStory(widget.story);
              Navigator.pop(context);
              widget.initData();
            },
          ),
        ],
      ),
    );
  }
}
