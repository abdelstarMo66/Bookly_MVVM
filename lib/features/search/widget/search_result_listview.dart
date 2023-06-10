import 'package:flutter/material.dart';
import '../../home/presentation/views/widgets/book_list_view_item.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      // itemBuilder: (context, index) =>  const BookListViewItem(),
      itemBuilder: (context, index) =>  Container(),
      separatorBuilder: (context, index) => const SizedBox(
        height: 15.0,
      ),
      itemCount: 10,
    );
  }
}
