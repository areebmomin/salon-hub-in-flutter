part of '../user_home_page.dart';

class SaloonListView extends StatelessWidget {
  const SaloonListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      itemCount: 5,
      prototypeItem: const SaloonListViewItem(),
      itemBuilder: (context, index) {
        return const SaloonListViewItem();
      },
    );
  }
}

class SaloonListViewItem extends StatelessWidget {
  const SaloonListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Card(
        color: AppColors.cardBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              Assets.appLogo,
              height: 192,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, top: 16, bottom: 16, right: 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(Assets.appLogo),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            Strings.businessNameHint,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: Strings.firaSans,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          RichText(
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            maxLines: 3,
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(
                                    Icons.location_on_sharp,
                                    color: Colors.grey.shade600,
                                    size: 18,
                                  ),
                                ),
                                const TextSpan(
                                  text: ' ${Strings.businessAddressHint}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.lightTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(
                                    Icons.circle,
                                    color: AppColors.checkboxActive,
                                    size: 15,
                                  ),
                                ),
                                TextSpan(
                                  text: ' Open',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.inputText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
