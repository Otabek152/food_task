import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_task/ui/pages/tab_pages/home_page.dart';
import 'package:food_task/ui/theme/app_style.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String search = '';
  final textcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: SizedBox(
          child: SizedBox(
            width: 240,
            height: 54,
            child: TextField(
              controller: textcontroller,
              onChanged: (value) {
                setState(() {
                  search = value;
                });
              },
              decoration: InputDecoration(
                prefix: const Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Icon(Icons.search),
                ),
                suffix:  IconButton(onPressed: (){
                  setState(() {
                    textcontroller.clear();
                    search = '';
                  });
                }, icon: const Icon(Icons.close)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(32))),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(32))),
                hintText: 'Search',
                hintStyle: AppStyle.fontText,
              ),
            ),
          ),
        ),
        actions: [SvgPicture.asset('assets/icons/Filter.svg')],
      ),
      body: HomePageBody(search: search),
    );
  }
}
