import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_task/domain/providers/add_provider.dart';
import 'package:food_task/ui/theme/app_colors.dart';
import 'package:food_task/ui/theme/app_style.dart';
import 'package:image_picker/image_picker.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const AddPageBody(),
    );
  }
}

class AddPageBody extends StatefulWidget {
  const AddPageBody({super.key});
  @override
  State<AddPageBody> createState() => _AddPageBodyState();
}

class _AddPageBodyState extends State<AddPageBody> {
  File? _imageFile;
  final _picker = ImagePicker();
  List<int>? imagebytes;
  double valueslide = 10.0;
  Future<void> _pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
    imagebytes = await _imageFile!.readAsBytesSync();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AddProvider>();
    model.image = imagebytes;
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: ListView(
        children: [
          GestureDetector(
            onTap: () {
              _pickImageFromGallery();
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  image: DecorationImage(
                      image: _imageFile != null
                          ? Image.file(_imageFile!).image
                          : const AssetImage(
                              'assets/images/Cover.jpg',
                            ),
                      fit: BoxFit.fill)),
              height: 161,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Food Name',
                  style: AppStyle.fontHeader,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 56,
            width: 327,
            child: TextField(
              controller: model.foodName,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(32))),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(32))),
                hintText: 'Enter food name',
                hintStyle: AppStyle.fontText,
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Description',
            style: AppStyle.fontHeader,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
              controller: model.foodDescription,
              maxLines: 3,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                hintText: 'Tell a little about your food',
                hintStyle: AppStyle.fontText,
              )),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Text(
                'Cooking Duration ',
                style: AppStyle.fontHeader,
              ),
              Text(
                '(in minutes)',
                style: AppStyle.fontText.copyWith(fontSize: 17),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '<10',
                    style: TextStyle(color: AppColors.green),
                  ),
                  Text('30', style: TextStyle(color: AppColors.green)),
                  Text('>60', style: TextStyle(color: AppColors.green)),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Slider(
              thumbColor: AppColors.green,
              activeColor: AppColors.green,
              divisions: 2,
              value: valueslide,
              max: 60,
              onChanged: ((double value) {
                setState(() {
                  valueslide = value;
                  model.value = valueslide;
                });
              }),
            ),
          ),
          FloatingActionButton(
            elevation: 0,
            backgroundColor: AppColors.green,
            onPressed: () {
              if (model.foodDescription.text.isNotEmpty &&
                  model.foodName.text.isNotEmpty &&
                  model.image != null) {
                model.addFoods();
                Navigator.pop(context);
              }
            },
            child: const Text(
              'Upload',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
