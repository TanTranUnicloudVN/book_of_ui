import 'package:book_of_ui/components/license_plate_review.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookCategory ocrCategory() {
  return WidgetbookCategory(
    name: 'Ocr Category',
    folders: [
      WidgetbookFolder(
        name: "License Plate",
        widgets: [
          licensePlateReviewComponent(),
        ],
      ),
    ],
  );
}
