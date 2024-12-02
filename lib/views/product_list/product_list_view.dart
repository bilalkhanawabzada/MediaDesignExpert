import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jaat_app/core/res/utils/app_colors.dart';
import 'package:jaat_app/views/product_list/product_list_viewmodel.dart';
import 'package:jaat_app/widgets/custom_app_bar.dart';
import 'package:jaat_app/widgets/next_forward_keybar.dart';
import 'package:stacked/stacked.dart';

/// View for managing and displaying a list of user-defined products.
///
/// This widget uses the `ViewModelBuilder` to bind with the [ProductListViewModel].
/// Users can input product details and manage additional data such as notes and images.
///
/// **Features:**
/// - Display and input product quantity and names.
/// - Fetch product suggestions via autocomplete.
/// - Add custom notes and images to products.
/// - Dynamically add or clear rows.
///
/// **Dependencies:**
/// - `stacked` package for state management.
/// - `CustomAppBar` for the app bar.
class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductListViewModel>.reactive(
      viewModelBuilder: () => ProductListViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: CustomAppBar(
            icon: Icons.menu,
            onIconPressed: () {},
          ),
          body: Stack(
            children: [
              Positioned(
                top: 0.0,
                left: 0,
                right: 0,
                child: IconsRowInStack(
                  closeIcon: Icons.close,
                  rightIcon: Icons.arrow_forward,
                  closeIconPressed: viewModel.isButtonEnabled ? viewModel.clearTable : null,
                  onRightIconPressed:viewModel.isButtonEnabled ? viewModel.submitTable : null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 30.0, top: 50),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          "Order #",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "34512",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // Product rows
                    Expanded(
                        child: ListView.builder(
                          itemCount: viewModel.productRows.length,
                          itemBuilder: (context, index) {
                            // final row = viewModel.productRows[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 0.0),
                              child: Row(
                                children: [
                                  // Quantity TextField
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: MediaQuery.of(context).size.height * 0.04,
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(color: AppColors.primaryColor, width: 1.0),
                                          right: BorderSide(color: AppColors.primaryColor, width: 1.0),
                                        ),
                                      ),
                                      child: TextField(
                                        focusNode: viewModel.focusNodes[index],
                                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                                        decoration: const InputDecoration(
                                          border: InputBorder.none, // This removes all borders.
                                          enabledBorder: InputBorder.none, // No border when enabled.
                                          focusedBorder: InputBorder.none, 
                                          contentPadding: EdgeInsets.only(left: 30),
                                        ),
                                        keyboardType: TextInputType.number,
                                        onTap: () {
                                          final emptyRowIndex = viewModel.getFirstEmptyRowIndex();
                                          if (emptyRowIndex != null && emptyRowIndex < index) {
                                            viewModel.focusNodes[emptyRowIndex].requestFocus();
                                          }
                                        },
                                        onChanged: (value) {
                                          viewModel.updateQuantity(index, value);
                                        },
                                      ),
                                    ),
                                  ),
                                  // Product Name TextField
                                  Expanded(
                                    flex: 5,
                                    child: GestureDetector(
                                      onDoubleTap: () => _showNotesAndImageModal(context, viewModel, index),
                                      onLongPress: () => _showNotesAndImageModal(context, viewModel, index),
                                      child: Container(
                                        height: MediaQuery.of(context).size.height * 0.04,
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(color: AppColors.primaryColor, width: 1.0),
                                          ),
                                        ),
                                        child: Autocomplete<String>(
                                        optionsBuilder: (TextEditingValue textEditingValue) async {
                                          if (textEditingValue.text.isEmpty) {
                                            return const Iterable<String>.empty();
                                          }
                                          return await viewModel.fetchProductSuggestions(
                                            textEditingValue.text,
                                          );
                                        }, // optionsBuilder
                                        onSelected: (String suggestion) {
                                          viewModel.updateProductName(index, suggestion);
                                        }, // onSelected
                                        fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode focusNode, VoidCallback onFieldSubmitted) {
                                          return TextField(
                                            controller: textEditingController,
                                            focusNode: focusNode,
                                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              enabledBorder: InputBorder.none, // No border when enabled.
                                              focusedBorder: InputBorder.none, // No border when focused.
                                              contentPadding: EdgeInsets.only(left: 8),
                                            ), 
                                              onTap: () {
                                            final emptyRowIndex = viewModel.getFirstEmptyRowIndex();
                                            if (emptyRowIndex != null && emptyRowIndex < index) {
                                              viewModel.focusNodes[emptyRowIndex].requestFocus();
                                            }
                                          },
                                            onChanged: (value) {
                                              viewModel.updateProductName(index, value);
                                            }, // onChanged
                                          ); // TextField
                                        }, // fieldViewBuilder
                                      ), // Autocomplete,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),

                                          const SizedBox(height: 16.0),
                                          // Buttons
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              ElevatedButton(
                                                onPressed: viewModel.addNewRow,
                                                child: const Text('Add Row',
                                                style: TextStyle(
                                                  color: AppColors.white,
                                                ),),
                                                
                                              ),
                                            
                                          
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            
                          );
  }
  
}


// bottom modal sheet to add notes and add picture for a specific row
void _showNotesAndImageModal(BuildContext context, ProductListViewModel viewModel, int index) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      final TextEditingController notesController = TextEditingController(
        text: viewModel.getNotes(index),
      );
      String? selectedImage = viewModel.getImage(index);

      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              top: 16.0,
              left: 16.0,
              right: 16.0,
            ),
            child: Stack(
              children: [
                // Main Content
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Notes Input Field
                      TextField(
                        controller: notesController,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                        decoration: const InputDecoration(
                          labelText: "Notes",
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 3,
                        onChanged: (value) {
                          viewModel.updateNotes(index, value);
                        },
                      ),
                      const SizedBox(height: 16),

                      // Image Preview or Placeholder Icon
                      GestureDetector(
                        onTap: () async {
                          final image = await viewModel.selectImage();
                          if (image != null) {
                            setState(() {
                              selectedImage = image;
                            });
                            viewModel.updateImage(index, image);
                          }
                        },
                        child: Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: selectedImage != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.file(
                                    File(selectedImage!),
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : const Center(
                                  child: Icon(
                                    Icons.add_photo_alternate,
                                    size: 50,
                                    color: Colors.grey,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),

                // Close Button
                Positioned(
                  top: 0,
                  right: 0,

                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      // padding: const EdgeInsets.all(20),
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade300,
                      ),
                      child: const Center(
                        child: Text(
                          "X",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
