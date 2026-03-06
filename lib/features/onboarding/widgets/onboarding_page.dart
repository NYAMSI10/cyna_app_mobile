import 'package:cyna/common/helpers/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TOnBoardingPage extends StatelessWidget {
  const TOnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.isMobile(context);

    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Centre verticalement
        children: [
          // L'image s'adapte à la taille de l'écran
          SvgPicture.asset(
            image,
            height: isMobile ? size.height * 0.35 : size.height * 0.45,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 40),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                ),
          ),
          // Un petit spacer en bas pour ne pas que le texte soit caché par les boutons
          SizedBox(height: isMobile ? 120 : 150),
        ],
      ),
    );
  }
}
