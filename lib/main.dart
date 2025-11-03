import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:re_tune/data/repositories/story/story_repository_isar.dart';
import 'package:re_tune/data/services/story_data_validation.dart';
import 'package:re_tune/ui/story/story_view.dart';
import 'package:re_tune/ui/story/story_view_model.dart';

void main() async {
  final dirPath = await getApplicationDocumentsDirectory();
  final storyRepository = StoryRepositoryIsar(dirPath.path);
  final storyDataValidation = StoryDataValidation();
  final viewModel = StoryViewModel(storyRepository, storyDataValidation);
  runApp(ReTuneApp(viewModel: viewModel));
}

class ReTuneApp extends StatelessWidget {
  const ReTuneApp({super.key, required this.viewModel});

  final StoryViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Re:Tune',
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        cardTheme: CardThemeData(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      home: StoryView(viewModel: viewModel),
    );
  }
}
