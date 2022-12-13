import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/checkout/checkout_bloc.dart';
import '../../widgets/widgets.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  static const String routeName = '/checkout';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const CheckoutScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Checkout',
      ),
      bottomNavigationBar: const CustomNavBar(
        screen: routeName,
      ),
      body: BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          if (state is CheckoutLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CheckoutSucceeded) {
            return const BuildShowEmptyContent(
              content: 'Order Succeeded.',
              buttonTitle: 'Back To Shopping',
            );
          }
          if (state is CheckoutLoaded) {
            return Padding(
              padding: const EdgeInsets.all(20).copyWith(bottom: 10),
              child: LayoutBuilder(
                builder: (context, constraints) => SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraints.maxHeight),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SectionTitle(
                          title: 'CUSTOMER INFORMATION',
                          horizontalPadding: 0.0,
                        ),
                        // Text(
                        //   'CUSTOMER INFORMATION',
                        //   style: Theme.of(context).textTheme.headline3,
                        // ),
                        _buildTextFormFiled(
                          context: context,
                          onChange: (value) {
                            context
                                .read<CheckoutBloc>()
                                .add(UpdateCheckout(email: value));
                          },
                          fieldName: 'Email',
                        ),
                        _buildTextFormFiled(
                          context: context,
                          onChange: (value) {
                            context
                                .read<CheckoutBloc>()
                                .add(UpdateCheckout(fullName: value));
                          },
                          fieldName: 'Full Name',
                        ),
                        const SectionTitle(
                          title: 'DELIVERY INFORMATION',
                          horizontalPadding: 0.0,
                        ),

                        _buildTextFormFiled(
                          context: context,
                          onChange: (value) {
                            context
                                .read<CheckoutBloc>()
                                .add(UpdateCheckout(address: value));
                          },
                          fieldName: 'Address',
                        ),
                        _buildTextFormFiled(
                          context: context,
                          onChange: (value) {
                            context
                                .read<CheckoutBloc>()
                                .add(UpdateCheckout(city: value));
                          },
                          fieldName: 'City',
                        ),
                        _buildTextFormFiled(
                          context: context,
                          onChange: (value) {
                            context
                                .read<CheckoutBloc>()
                                .add(UpdateCheckout(country: value));
                          },
                          fieldName: 'Country',
                        ),
                        _buildTextFormFiled(
                          context: context,
                          onChange: (value) {
                            context
                                .read<CheckoutBloc>()
                                .add(UpdateCheckout(zipCode: value));
                          },
                          fieldName: 'zip Code',
                        ),
                        const SectionTitle(
                          title: 'ORDER SUMMARY',
                          horizontalPadding: 0.0,
                        ),
                        const OrderSummary(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const Center(
              child: Text('Something went wrong,'),
            );
          }
        },
      ),
    );
  }

  Padding _buildTextFormFiled({
    required BuildContext context,
    required Function(String)? onChange,
    required String fieldName,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              fieldName,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: TextFormField(
              onChanged: onChange,
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.only(left: 10),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
