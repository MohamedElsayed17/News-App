import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/app_cubit/cubit.dart';
import 'package:news_app/shared/cubit/app_cubit/states.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildTextFormField(context),
                Expanded(
                  child: Conditional.single(
                    context: context,
                    conditionBuilder: (context) =>
                        state is! GetSearchDataLoadingState,
                    widgetBuilder: (context) => buildList(
                      list: AppCubit.getInstance(context).search,
                    ),
                    fallbackBuilder: (context) => Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
      },
    );
  }

  Widget _buildTextFormField(context) {
    return TextFormField(
      controller: searchController,
      autofocus: true,
      decoration: InputDecoration(
        labelText: 'Search',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        prefixIcon: Icon(Icons.search),
      ),
      keyboardType: TextInputType.text,
      maxLines: 1,
      onChanged: (text) {
        print(text);
        AppCubit.getInstance(context).searchWithName(name: text);
      },
    );
  }
}
