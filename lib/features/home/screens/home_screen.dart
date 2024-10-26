import 'dart:async';
import 'package:flutter/material.dart';
import 'package:paypath_last/config/routes/custom_push_navigators.dart';
import 'package:paypath_last/core/utils/color_constants.dart';
import 'package:paypath_last/core/utils/global_constants.dart';
import 'package:paypath_last/features/auth/providers/user_provider.dart';
import 'package:paypath_last/features/auth/services/auth_service.dart';
import 'package:paypath_last/features/home/screens/account_and_card_screen.dart';
import 'package:paypath_last/features/home/screens/beneficiary_screen.dart';
import 'package:paypath_last/features/home/screens/comming_soon_screen.dart';
import 'package:paypath_last/features/home/screens/fund_wallet_screen.dart';
import 'package:paypath_last/features/home/screens/pay_bills_screen.dart';
import 'package:paypath_last/features/home/screens/pre_paid_cards_screen.dart';
import 'package:paypath_last/features/home/screens/send_money_screen.dart';
import 'package:paypath_last/features/home/screens/transaction_report_screen.dart';
import 'package:paypath_last/features/home/services/home_service.dart';
import 'package:paypath_last/features/home/widgets/add_send_funds_container.dart';
import 'package:paypath_last/features/transactions/models/transactions.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String route = '/home-screens';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeService homeService = HomeService();
  final AuthService authService = AuthService();
  int? balance = 0;
  String naira = '';
  List<Transactions> transactions = [];
  late Future _future;
  final ScrollController scrollController = ScrollController();

  getUserBalance() async {
    getCreditNotifications();
    getAllTransactions();
    final user = Provider.of<UserProvider>(context, listen: false).user;
    balance = await homeService.getUserBalance(
      context: context,
      username: user.username,
    );

    if (mounted) {
      setState(() {});
    }
  }

  getAllTransactions() async {
    transactions = await homeService.getAllTransactions(
      context: context,
    );
    if (mounted) {
      setState(() {});
    }
  }

  void checkIfUserHasPin() {
    homeService.checkIfUserHasSetPin(context);
  }

  obtainTokenAndUserData() async {
    await authService.obtainTokenAndUserData(context);
  }

  getCreditNotifications() {
    homeService.creditNotification(
        context: context,
        onSuccess: () {
          Future.delayed(const Duration(seconds: 6), () {
            deleteNotification();
            ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
          });
        });
  }

  deleteNotification() {
    homeService.deleteNotification(context: context);
  }

  @override
  void initState() {
    super.initState();

    getUserBalance();
    checkIfUserHasPin();
    obtainTokenAndUserData();
    _future = getAllTransactions();
    Future.delayed(const Duration(seconds: 5), () {
      ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
    });
  }


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
        backgroundColor: primaryAppColor,
        appBar: AppBar(
          backgroundColor: primaryAppColor,
          title: Text('Hi, ${user.fullname}',
              style: const TextStyle(fontWeight: FontWeight.bold)),
          leading: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: CircleAvatar(
              backgroundColor: Colors.white54,
                radius: heightValue25,
                child: Center(
                    child: Text(
                  user.fullname[0].toUpperCase(),
                  style: TextStyle(
                      color: textColor,
                      fontSize: heightValue25,
                      fontWeight: FontWeight.bold),
                )),
              ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications, color: Colors.white54),
              iconSize: 30,
              onPressed: () {// Handle notification action
              },
            ),
          ],
        ),
        body: RefreshIndicator(
          displacement: 80,
          onRefresh: () => getUserBalance(),
          child: Container(
            margin: const EdgeInsets.only(
              left: 10.0,
              right: 10.0,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                // Account Balance
                SizedBox(
                  width: 500,
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    margin: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 4,
                          blurRadius: 5,
                          offset: const Offset(0, 10),
                        ),
                      ],
                      color: primaryAppColor,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Account Balance',
                          style: TextStyle(fontSize: 18.0, color: Colors.white),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          "${amountFormatter.format(balance)} LYD",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: heightValue50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Grid of Buttons
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                      children: [

                        AddSendFundsContainers(
                          text: "Pay",
                          icon: "assets/images/money.png",
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const CommingSoonScreen(),));
                          },
                        ),
                        AddSendFundsContainers(
                          text: "Transfer",
                          icon: "assets/images/transfer.png",
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SendMoneyScreen(),))
                        ),
                        AddSendFundsContainers(
                            icon:  "assets/images/fundWallet.png",
                            text: "Fund wallet",
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const FundWalletScreen(),))
                        ),
                        AddSendFundsContainers(
                          icon: "assets/images/preparedCards.png",
                          text: "Prepaid cards",
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const PrePaidCardsScreen(),));
                          },
                        ),
                        AddSendFundsContainers(
                          icon: "assets/images/payBills.png",
                          text: "Bills",
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const PayBillScreen(),));
                          },
                        ),
                        AddSendFundsContainers(
                          icon: "assets/images/wallet-43 1.png",
                          text: "Account-card",
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountAndCardScreen(),));
                          },
                        ),
                        AddSendFundsContainers(
                          icon: "assets/images/transactionReport.png",
                          text: "Daily report",
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const TransactionReportScreen(),));
                          },
                        ),
                        AddSendFundsContainers(
                          icon: "assets/images/contacts.png",
                          text: "Beneficiary",
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  BeneficiaryScreen(),));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
