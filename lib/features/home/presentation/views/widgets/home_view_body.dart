import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'newest_list_view.dart';
import 'custom_app_bar.dart';
import 'feature_list_books.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: CustomAppBar(),
              ),
              FeatureBooksListView(),
              SizedBox(
                height: 50.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  "Newest Books",
                  style: StyleManager.titleStyle18,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
        const SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: NewestListView(),
          ),
        ),
      ],
    );
  }
}
