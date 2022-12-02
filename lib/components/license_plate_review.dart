import 'package:book_of_ui/widgets/draw_license_plate_widget/draw_license_plate_widget.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent licensePlateReviewComponent() {
  return WidgetbookComponent(
    name: 'License Plate Review Component',
    useCases: [
      drawLicensePlateUseCase(),
    ],
  );
}
