import 'package:flutter/cupertino.dart';
import 'package:store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:store/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:store/utils/constants/colors.dart';

class VPrimaryHeaderContainer extends StatelessWidget {
  const VPrimaryHeaderContainer({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return VCurvedEdgeWidget(
      child: SizedBox(
        child: Container(
          color: VColors.primaryColor,
          padding: const EdgeInsets.all(0),
          child: SizedBox(
            child: Stack(
              children: [
                Positioned(
                  top: -150,
                  right: -250,
                  child: VCircularContainer(
                    backgroundColor: VColors.textWhite.withOpacity(0.1),
                  ),
                ),
                Positioned(
                  top: 100,
                  right: -300,
                  child: VCircularContainer(
                    backgroundColor: VColors.textWhite.withOpacity(0.1),
                  ),
                ),
                child
              ],
            ),
          ),
        ),
      ),
    );
  }
}
