part of '../user_home_page.dart';

class SaloonHubToolbar extends StatelessWidget {
  const SaloonHubToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
            child: Image.asset(
              Assets.appLogo,
              width: 40,
              height: 40,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8, top: 16, bottom: 16),
            child: Text(
              Strings.appName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
