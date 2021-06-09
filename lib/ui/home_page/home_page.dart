import 'package:appnation_demo_project/core/base/base_state.dart';
import 'package:appnation_demo_project/core/constants/enums/app_theme_enum.dart';
import 'package:appnation_demo_project/core/init/notifier/theme_notifier.dart';
import 'package:appnation_demo_project/core/init/theme/app_theme_light.dart';
import 'package:appnation_demo_project/model/reddit_model.dart';
import 'package:appnation_demo_project/ui/home_page/home_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      context.read<HomePageViewMopdel>().wait = true;
      context.read<HomePageViewMopdel>().getData(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: context.watch<HomePageViewMopdel>().wait == false
            ? SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    for (var i in context.read<HomePageViewMopdel>().dataList)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: sharingView(i),
                      ),
                  ],
                ),
              )
            : Center(child: CircularProgressIndicator()));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            child: ClipOval(
              child: Image.network(
                  'https://b.thumbs.redditmedia.com/X2q6YuAJK0WWktTZcp-1D-4HnxOQ8oH1DqJdrLQtS8s.png'),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Reddit/FlutterDev',
            style: TextStyle(
                letterSpacing: 1.1,
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
      actions: [themeChangeWidget(context)],
    );
  }

  GestureDetector themeChangeWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<ThemeNotifier>(context, listen: false).changeValue();
      },
      //currentTheme == AppThemeLight.instance?.theme
      child: Row(
        children: [
          Icon(
            Provider.of<ThemeNotifier>(context, listen: false).currentTheme !=
                    AppThemeLight.instance?.theme
                ? Icons.light_mode
                : Icons.dark_mode,
            color: Theme.of(context).colorScheme.primary,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }

  Widget sharingView(ShareModel share) {
    return InkWell(
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return showBottomSheet(share, context);
          },
        );
      },
      child: Container(
        height: dynamicHeight(0.2),
        width: dynamicWidth(1),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1))]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(
                      '${share.author}',
                      style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.7),
                          fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      'Score:${share.score}',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: dynamicHeight(0.09),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: share.thumbnail != 'self'
                        ? dynamicWidth(0.6)
                        : dynamicWidth(0.9),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        '${share.title}',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  if (share.thumbnail != 'self')
                    Container(
                      width: dynamicWidth(0.3),
                      child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.network(
                            '${share.thumbnail}',
                            fit: BoxFit.fill,
                          )),
                    ),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  height: dynamicHeight(0.08),
                  child: Text('${share.selftext}'),
                ),
                Container(
                  height: dynamicHeight(0.08),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                        Theme.of(context).colorScheme.onPrimary,
                        Theme.of(context).colorScheme.onPrimary.withOpacity(0.3)
                      ])),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Padding showBottomSheet(ShareModel share, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 15),
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(
                      '${share.author}',
                      style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.7),
                          fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      'Score:${share.score}',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    ),
                  )
                ],
              ),
              Container(
                width: dynamicWidth(0.9),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    '${share.title}',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              if (share.thumbnail != 'self')
                Container(
                  child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.network(
                        '${share.thumbnail}',
                        fit: BoxFit.fill,
                      )),
                ),
              Container(
                child: Text('${share.selftext}'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
