import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/data/emotion.dart';
import 'package:movies/data/movie.dart';
import 'package:movies/features/home/new_movie/movie_cubit.dart';
import 'package:movies/shared/selector/selector_cubit.dart';
import 'package:movies/shared/selector/option_widget.dart';
import 'package:movies/shared/widgets/custom_button.dart';
import 'package:movies/shared/widgets/custom_text_field.dart';
import 'package:movies/shared/widgets/custom_widget_with_title.dart';

class NewMoviePageOne extends StatefulWidget {
  final Movie? movie;
  const NewMoviePageOne({
    super.key,
    required this.pageController,
    this.movie,
  });

  final PageController pageController;

  @override
  State<NewMoviePageOne> createState() => _NewMoviePageOneState();
}

class _NewMoviePageOneState extends State<NewMoviePageOne> {
  late TextEditingController titleController;
  late TextEditingController directorController;
  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    directorController = TextEditingController();
    if (widget.movie != null) {
      titleController.text = widget.movie!.title;
      directorController.text = widget.movie!.director;
      context
          .read<SelectorCubit>()
          .set(Emotion.values.indexOf(widget.movie!.emotion));
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    directorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomWidgetWithTitle(
            title: 'Movie title',
            child: CustomTextField(
              controller: titleController,
              onChanged: (_) => setState(() {}),
            ),
          ),
          CustomWidgetWithTitle(
            title: 'The movie\'s director',
            child: CustomTextField(
              controller: directorController,
              onChanged: (_) => setState(() {}),
            ),
          ),
          CustomWidgetWithTitle(
            title: 'What did you think of the movie',
            child: Column(
              children: List.generate(
                Emotion.values.length,
                (index) => OptionWidget(
                  index: index,
                  title: Emotion.values[index].description,
                  svgIconAssetPath: Emotion.values[index].assetPath,
                ),
              ),
            ),
          ),
          SizedBox(height: 12.h),
          BlocBuilder<SelectorCubit, int?>(
            builder: (context, selectorState) {
              final activeCondition = isFormFull(selectorState);
              return CustomButton(
                  title: 'Continue',
                  onPressed: () {
                    if (widget.movie != null) {
                      context.read<MovieCubit>().set(
                            Movie(
                              title: titleController.text,
                              director: directorController.text,
                              emotion: Emotion.values[selectorState!],
                              comment: widget.movie!.comment,
                              rate: widget.movie!.rate,
                            ),
                          );
                    } else {
                      context.read<MovieCubit>().set(
                            Movie(
                              title: titleController.text,
                              director: directorController.text,
                              emotion: Emotion.values[selectorState!],
                            ),
                          );
                    }
                    widget.pageController.animateToPage(1,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut);
                  },
                  activeConditon: activeCondition);
            },
          ),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }

  bool isFormFull(int? selectorState) {
    return titleController.text != '' &&
        directorController.text != '' &&
        selectorState != null;
  }
}
