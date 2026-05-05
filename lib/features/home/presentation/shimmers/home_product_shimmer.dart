import 'package:cyna/common/widgets/t_grid_layout.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeProductShimmer extends StatelessWidget {
  const HomeProductShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: TGridLayout(
          itemCount: 4,
          mainAxisExtent: 200,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20), // Bords plus arrondis
              ),
            );
          }),
    );
  }
}
