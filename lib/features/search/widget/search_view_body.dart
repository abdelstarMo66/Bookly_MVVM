import 'package:flutter/material.dart';
import '../../../core/utils/styles.dart';
import 'custom_text_field.dart';
import 'search_result_listview.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(
            height: 16.0,
          ),
          CustomTextField(),
          SizedBox(
            height: 16.0,
          ),
          Text(
            "Search Result",
            style: StyleManager.titleStyle18,
          ),
          SizedBox(
            height: 16.0,
          ),
          Expanded(
            child: SearchResultListView(),
          ),
        ],
      ),
    );
  }
}
