import 'package:bookly_app/features/home/data/models/book_model/item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/widgets/custom_button.dart';

class BooksAction extends StatelessWidget {
  final Item book;
  const BooksAction({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          const Expanded(
            child: CustomButton(
              text: "Free",
              backGroundColor: Colors.white,
              fontColor: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                bottomLeft: Radius.circular(16.0),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () async {
                debugPrint("Done");
                Uri url = Uri.parse(book.volumeInfo.previewLink!);
                if (await canLaunchUrl(url)) {
                print("Gg");
                  await launchUrl(url);
                }
              },
              text: "Preview",
              backGroundColor: const Color(0xFFEF8261),
              fontColor: Colors.white,
              fontSize: 16.0,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
