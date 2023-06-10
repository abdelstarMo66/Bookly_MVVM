import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../constance.dart';
import '../../../../../core/utils/styles.dart';
import '../../../data/models/book_model/item.dart';
import 'book_rating.dart';

class BookListViewItem extends StatelessWidget {
  final Item bookItem;
  const BookListViewItem({super.key, required this.bookItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: bookItem);
      },
      child: SizedBox(
        height: 125.0,
        child: Row(
          children: [
            CustomBookImage(imageUrl: bookItem.volumeInfo.imageLinks?.smallThumbnail ?? " "),
            const SizedBox(
              width: 30.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      bookItem.volumeInfo.title,
                      style:
                          StyleManager.titleStyle20.copyWith(fontFamily: appFont),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  Text(
                    bookItem.volumeInfo.authors[0],
                    style: StyleManager.titleStyle14,
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Free",
                        style: StyleManager.titleStyle20
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      BookRating(
                        rate: bookItem.volumeInfo.averageRating ?? 0.0,
                        count: bookItem.volumeInfo.ratingsCount ?? 0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

