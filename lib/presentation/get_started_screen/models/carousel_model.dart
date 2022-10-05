
import '../../../core/utils/image_constant.dart';

class Carousels {
  final String description;
  final String image;

  Carousels({required this.description, required this.image});
}

List<Carousels> carouselsList = [
  Carousels(
    description:
        'The best way to pay teams, vendors, and other business beneficiaries',
    image: ImageConstant.imgSend,
  ),
  Carousels(
    description: 'The easy way to collect & track payments',
    image: ImageConstant.imgCards,
  ),
  Carousels(
    description: 'Say goodbye to paperwork, manual work, and busywork',
    image:ImageConstant.imgApproved,
  ),
  Carousels(
    description: 'Supercharge your business growth',
    image: ImageConstant.imgCards,
  ),
];
