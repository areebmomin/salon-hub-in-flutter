part of '../login_page.dart';

class LoginTabLayout extends StatefulWidget {
  final Function(TabType position) onTabSelected;

  const LoginTabLayout(this.onTabSelected, {super.key});

  @override
  State<LoginTabLayout> createState() => _LoginTabLayoutState();
}

class _LoginTabLayoutState extends State<LoginTabLayout> {
  TabType selectedTab = TabType.customerTab;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 22, right: 20, bottom: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          LoginTab(
            tabType: TabType.customerTab,
            onTabSelected: onTabSelected,
            isSelected: selectedTab == TabType.customerTab,
          ),
          LoginTab(
            tabType: TabType.salonTab,
            onTabSelected: onTabSelected,
            isSelected: selectedTab == TabType.salonTab,
          ),
        ],
      ),
    );
  }

  void onTabSelected(TabType position) {
    if (position != selectedTab) {
      setState(() {
        selectedTab = position;
      });
    }
    widget.onTabSelected(position);
  }
}

class LoginTab extends StatelessWidget {
  final TabType tabType;
  final Function(TabType position) onTabSelected;
  final bool isSelected;

  const LoginTab({
    required this.tabType,
    required this.onTabSelected,
    required this.isSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              onTabSelected(tabType);
            },
            child: Container(
              height: 68,
              width: double.infinity,
              decoration: BoxDecoration(
                color: getBackgroundColor(),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(getCustomerTabRadius()),
                  topRight: Radius.circular(getSalonTabRadius()),
                  bottomLeft: Radius.circular(getCustomerTabRadius()),
                  bottomRight: Radius.circular(getSalonTabRadius()),
                ),
              ),
              child: Center(
                child: Text(
                  getTabText(),
                  style: TextStyle(
                    color: getTextColor(),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: CustomPaint(
              painter: TrianglePainter(
                strokeColor: getTriangleColor(),
                strokeWidth: 10,
                paintingStyle: PaintingStyle.fill,
              ),
              child: const SizedBox(
                height: 12,
                width: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color getBackgroundColor() {
    return isSelected
        ? AppColors.headingTextColor
        : AppColors.unSelectedTabBackground;
  }

  double getCustomerTabRadius() {
    return tabType == TabType.customerTab ? 10 : 0;
  }

  double getSalonTabRadius() {
    return tabType == TabType.salonTab ? 10 : 0;
  }

  String getTabText() {
    switch (tabType) {
      case TabType.customerTab:
        return Strings.iAmCustomer;
      case TabType.salonTab:
        return Strings.salon;
    }
  }

  Color getTextColor() {
    return isSelected ? Colors.white : AppColors.headingTextColor;
  }

  Color getTriangleColor() {
    return isSelected ? AppColors.headingTextColor : Colors.transparent;
  }
}

class TrianglePainter extends CustomPainter {
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  final double strokeWidth;

  TrianglePainter(
      {this.strokeColor = Colors.black,
      this.strokeWidth = 3,
      this.paintingStyle = PaintingStyle.stroke});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..style = paintingStyle;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(x, 0)
      ..lineTo(x / 2, y)
      ..lineTo(0, 0);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) {
    return oldDelegate.strokeColor != strokeColor ||
        oldDelegate.paintingStyle != paintingStyle ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
