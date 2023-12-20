import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_task/ui/pages/add_page/add_page.dart';
import 'package:food_task/ui/theme/app_style.dart';

class UploadPage extends StatelessWidget {
  const UploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const UploadPageBody(),
    );
  }
}

class UploadPageBody extends StatelessWidget {
  const UploadPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Click button to add your food',
            style: AppStyle.fontHeader,
          ),
          IconButton(onPressed: (){
            
            Navigator.push(context, CupertinoPageRoute(builder: (context) => const AddPage()));
          }, icon: const Icon(Icons.add,color: Colors.green,))
        ],
      ),
    );
  }
}
