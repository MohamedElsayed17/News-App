import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/app_cubit/cubit.dart';
import 'package:news_app/shared/cubit/app_cubit/states.dart';

class TechnologyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            body: Conditional.single(
          context: context,
          conditionBuilder: (context) =>
              state is! GetTechnologyDataLoadingState,
          widgetBuilder: (context) => buildList(
            list: AppCubit.getInstance(context).technology,
          ),
          fallbackBuilder: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        ));
      },
    );
  }
}
