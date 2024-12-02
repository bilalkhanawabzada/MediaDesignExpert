import 'package:flutter/material.dart';
import 'package:jaat_app/core/res/utils/app_colors.dart';
import 'package:jaat_app/views/order_details/order_details_viewmodel.dart';
import 'package:jaat_app/widgets/custom_app_bar.dart';
import 'package:jaat_app/widgets/next_forward_keybar.dart';
import 'package:jaat_app/widgets/order_row.dart';
import 'package:stacked/stacked.dart';

/// This screen displays the details of an order, including information about 
/// the order number, name, delivery date, and order details. It allows users
/// to submit new rows and save drafts of the order.
/// but only order details are implemented rest of the details are hard coded as per the guidelines from the test
class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    // Using ViewModelBuilder to reactively manage the OrderDetailsViewModel's state
    return ViewModelBuilder<OrderDetailsViewModel>.reactive(
      // Creates an instance of OrderDetailsViewModel for the view
      viewModelBuilder: () => OrderDetailsViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          // Custom app bar with default settings
          appBar: const CustomAppBar(),
          body: Stack(
            children: [
              // Positioned widget for placing the close icon at the top of the screen
              Positioned(
                top: 0.0,
                left: 0,
                right: 0,
                child: IconsRowInStack(
                  closeIcon: Icons.arrow_back, 
                  closeIconPressed: viewModel.goBack, 
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, bottom: 30.0, top: 70),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Displaying order number using OrderRow widget
                    const OrderRow(
                      heading: "Order#",
                      details: "112096",
                      textColor: AppColors.primaryColor,
                    ),
                    // Displaying order name
                    const OrderRow(
                      heading: "Order name",
                      details: "Joe’s catering",
                      textColor: AppColors.primaryColor,
                    ),
                    // Displaying delivery date
                    const OrderRow(
                      heading: "Delivery date",
                      details: "May 4th 2024",
                      textColor: AppColors.primaryColor,
                    ),
                    // Displaying total quantity
                    const OrderRow(heading: "Total quantity", details: "38"),
                    // Displaying estimated total cost
                    const OrderRow(heading: "Estimated Total", details: "1402.96"),
                    // Displaying order details using viewModel data
                    OrderRow(
                      heading: "Order details",
                      details: viewModel.orderDetails != null
                          // If order details are available, display them as a string
                          ? viewModel.orderDetails!
                              .map((map) => map.values.join(', '))
                              .join(' | ')
                          : "No details available", // If no details, display default message
                    ),

                    // Column for delivery information
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 36.0, top: 16),
                          child: Text(
                            "Deliver to:",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: AppColors.darkGray,
                            ),
                          ),
                        ),
                        // Displaying delivery location using OrderRow widget
                        OrderRow(
                          heading: "Location",
                          details: "355 onderdonk st Marina Dubai, UAE",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Section for delivery instructions title
                    const Text(
                      "Delivery instruction",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    // Row with Submit button to add new row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: (){}, // Action for Submit button
                            child: const Text(
                              'Submit',
                              style: TextStyle(
                                height: 3,
                                color: AppColors.white, // White text color
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Spacer for separating sections
                    const SizedBox(height: 16.0),
                    // Displaying "Save as draft" label
                    const Text(
                      "Save as draft",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: AppColors.primaryColor,
                      ),
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