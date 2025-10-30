import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:re_tune/domain/models/story/story.dart';
import 'package:re_tune/ui/story/story_view_model.dart';

class StoryViewAddEdit extends StatefulWidget {
  const StoryViewAddEdit({
    super.key,
    required this.storyViewModel,
    required this.story,
  });

  final StoryViewModel storyViewModel;
  final Story? story;

  @override
  State<StatefulWidget> createState() => _StoryViewAddEditState();
}

class _StoryViewAddEditState extends State<StoryViewAddEdit> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  DateTime? _startDate, _endDate;

  @override
  void initState() {
    super.initState();
    if (widget.story == null) return;

    _nameController.text = widget.story!.name ?? '';
    _descriptionController.text = widget.story!.description ?? '';
    _startDate = widget.story!.startDate;
    _endDate = widget.story!.endDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.story != null ? widget.story!.name! : 'Add Story'),
      ),
      body: Center(
        child: Card(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Story Name',
                    hintText: 'Start a great story!',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                  validator: (value) =>
                      widget.storyViewModel.isValidStoryName(value)
                      ? null
                      : 'Name is not valid!',
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Story Description',
                    hintText: 'Tell everyone more about it!',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                  validator: (value) =>
                      widget.storyViewModel.isValidStoryDescription(value)
                      ? null
                      : 'Description must be at least 5 characters long',
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _startDateController,
                        decoration: InputDecoration(
                          labelText: 'Enter start date',
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
                        onTap: () async {
                          final pickedDate = await showAdaptiveDateTimePicker(
                            context: context,
                            mode: DateTimeFieldPickerMode.date,
                          );
                          if (pickedDate != null) {
                            _startDate = pickedDate;
                            _startDateController.text = _startDate.toString();
                            setState(() {});
                          }
                        },
                      ),
                    ),
                    SizedBox(width: 2),
                    Expanded(
                      child: TextFormField(
                        controller: _endDateController,
                        decoration: InputDecoration(
                          labelText: 'Enter end date',
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
                        onTap: () async {
                          final pickedDate = await showAdaptiveDateTimePicker(
                            context: context,
                            mode: DateTimeFieldPickerMode.date,
                          );

                          if (pickedDate != null) {
                            _endDate = pickedDate;
                            _endDateController.text = _endDate.toString();
                            setState(() {});
                          }
                        },
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () async {
                    bool isValid1 = _formKey.currentState!.validate();
                    bool isValid2 = widget.storyViewModel.isValidStoryDates(
                      _startDate,
                      _endDate,
                    );
                    debugPrint('Validation button: $isValid1 and $isValid2');
                    final story = Story()
                      ..name = _nameController.text
                      ..description = _descriptionController.text
                      ..startDate = _startDate
                      ..endDate = _endDate;

                    if (widget.story != null) story.id = widget.story!.id;
                    await widget.storyViewModel.putStory(story);
                    //Navigator.of(context).pop();
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
