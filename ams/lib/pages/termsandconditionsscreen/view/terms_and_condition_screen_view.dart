import 'package:ams/pages/termsandconditionsscreen/controller/terms_and_condition_controller.dart';
import 'package:ams/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../loginscreen/view/loginview_view.dart';

class TermsAndConditionScreenView
    extends GetView<TermsAndConditionsController> {
  const TermsAndConditionScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TermsAndConditionsController());
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 6.5.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 20.h,
                width: 100.w,
                alignment: Alignment.center,
                child: Image.asset("assets/images/amslogotoobig.png"),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                "ACCEPTABLE USE POLICY",
                style: controller.header,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "BY USING ARTWORK MARKETPLACE SERVICES OR OPENING AN ACCOUNT, YOU GIVE YOUR IRREVOCABLE ACCEPTANCE OF AND CONSENT TO THE TERMS OF THIS AGREEMENT, INCLUDING THOSE ADDITIONAL TERMS AND CONDITIONS AND POLICIES.  ",
                style: controller.body,
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                "Before becoming a User of the Site, you must read and accept all of the terms and conditions in, and  these Terms of Service and you must consent to the processing of your personal data as described in the Privacy Policy. ",
                style: controller.body,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Basic terms and conditions",
                style: controller.header,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "1.1 Eligibility. You affirm and guarantee that none of your actions or overall performance related to this Agreement or any part of this Agreement will conflict with any obligation you have, whether those obligations are legal or otherwise. You have all necessary rights and authority to enter into this Agreement and carry out your obligations under this Agreement",
                style: controller.body,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "1.2 Privacy Policy. Personal information you knowingly choose to disclose and the information that our website collects on an entire basis as you browse our website. Our site is secured to ensure a safe and secure shopping experience. We do not share this information with any outside parties. By accessing or using the services in any way, you agree to be governed by these policies. Please carefully read this form part of your contract with us, prospective customers, and purchases ( If the terms of this agreement conflict, the relationship between you and the customer or buyer(s), as well as the relationship between you and us, is governed by this agreement.",
                style: controller.body,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "2. Payment Process",
                style: controller.body,
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                "2.1 Setup. Before you may market, offer, or sell any items through the Services, and before we will accept payment from buyers or remit cash to you via electronic transfer, we may require you to provide payment information or supporting documentation. In order to confirm your identification, we might potentially demand personal information from you at any moment. In order to approve you for use of our transaction-related services you give us permission to check your information (including any updated information you supply).",
                style: controller.body,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "2.2 Collection. Upon confirmation of each online purchase, we will charge the customer the 'Total Purchase Price,' which consists of the cost of the purchased item and any additional charges, such as shipping fees, that the buyer has authorized in connection with the sale. To process any payment, we have the right to utilize payment processors that we choose on our own.",
                style: controller.body,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "2.3 Payment Process. We might make use of this payment process to handle customer transactions to process transactions from buyers. We will not be liable or responsible for any loss of or failure to do business or other damage or loss of any kind resulting directly or indirectly from. Any refusal to accept payment or other forms of payment, or to transmit funds to you via electronic transfer in connection with any transaction Any inability to register with or use any payment processor's services. If we allow a buyer to cancel an online purchase because a payment processor's services are no longer available after the buyer starts the transaction, we won't be held responsible.",
                style: controller.body,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "2.4 Buyer may only change their preferred mode of payment for their purchase prior to making payment.",
                style: controller.body,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "2.5 Account Settlement. We will start paying you for the 'Net Proceeds' of that sale, which are the purchase price of that item less our commission provided we receive payment of the total purchase price in good cleared funds from the buyer with respect to the sale of any item by you using the services within eight (8) business days following confirmed delivery to the buyer.",
                style: controller.body,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "2.6 Online Purchase Cancellation. In the unlikely event that a buyer requests to cancel or return an online purchase, you agree to accept their request if ",
                style: controller.body,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "1) the order was not accurately described; ",
                style: controller.body,
              ),
              Text(
                "2) the buyer is entitled to cancel the sale as described in the Conditions of Sale; and",
                style: controller.body,
              ),
              Text(
                "3) the buyer wishes to cancel or return an order for any other reason. You will work with Artwork Marketplace and the buyer to try to reach a mutually agreeable solution. ",
                style: controller.body,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "3.USER INFORMATION ",
                style: controller.body,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "3.1When a customer buys an item from you, you might get the winner's name, email address, postal address, or other information (collectively, 'Buyer Information'). You agree not to utilize buyer information for unsolicited marketing emails or other unsolicited communications, only for purposes linked to carrying out a transaction. By using the Services or providing information on the Site, you:",
                style: controller.body,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "3.2 consent to Artwork Marketplace, use, disclosure and/or processing of your Content, personal data and User Information. ",
                style: controller.body,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                " - agree and acknowledge that the proprietary rights of your User Information are jointly owned by you and Artwork Marketplace; and",
                style: controller.body,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                " - shall not, whether directly or indirectly, disclose your User Information to any third party, or otherwise allow any third party to access or use your User Information, without Artwork Marketplace prior written consent.",
                style: controller.body,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "4. ACCOUNTS AND SECURITY ",
                style: controller.body,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "4.1 Some functions of our Services require registration for an Account by selecting a unique user identification (“User ID”) and password, and by providing certain personal information. You may be able to use your Account to gain access to other products, websites or services to which we have enabled access or with which we have tied up or collaborated.",
                style: controller.body,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "4.2 You agree to ",
                style: controller.body,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "(a) keep your password confidential and use only your User ID and password when logging in, ",
                style: controller.body,
              ),
              Text(
                "(b) ensure that you log out from your account at the end of each session on the Site, ",
                style: controller.body,
              ),
              Text(
                "(c) immediately notify Artwork Marketplace of any unauthorized use of your Account, User ID and/or password, and ",
                style: controller.body,
              ),
              Text(
                "(d) ensure that your Account information is accurate and up-to-date. You are fully responsible for all activities that occur under your User ID and Account even if such activities or uses were not committed by you. Artwork Marketplace will not be liable for any loss or damage arising from unauthorized use of your password or your failure to comply with this Section.",
                style: controller.body,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "5. SELLERS RESPONSIBILITIES ",
                style: controller.body,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "5.1 Seller shall properly manage and ensure that relevant information such as the price and the details of items, and shall not post inaccurate or misleading information.",
                style: controller.body,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "5.2 The price of items for sale will be determined by the Seller at his/her own discretion. The price of an item and shipping charges shall include the entire amount to be charged. ",
                style: controller.body,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "5.3 Seller shall issue receipts, upon the buyer’s request.",
                style: controller.body,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "6. Custody, Shipping and Fulfillment ",
                style: controller.body,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "6.1 Our Role. We expressly agree otherwise in writing with respect to a certain Item, the packing, handling, pickup, shipping, and fulfillment of each Item sold will be solely at yours and the buyer’s risk. At no time will we assume custody, physical possession, risk or responsibility for any Item. We may, but are not obligated to. ",
                style: controller.body,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "6.2 Release of Purchased Property. If the buyer chooses a common carrier shipment method, you agree to release physical possession of an item on the scheduled date of collection by the common carrier, and if not, within seven (7) days of that date. If the buyer selected fine art shipping, you agree to release physical possession of an item within seven (7) days of the fine artwork marketplace shipper informing you that the item is ready for pickup.",
                style: controller.body,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "If the buyer has chosen a common carrier shipping method, it is your responsibility to pack the item securely and safely. You must adhere to all issued guidelines and provide evidence in the form of images showing how the item was packed.",
                style: controller.body,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "You will make a reasonable attempt to make the item available to the customer if they ask to pick it up in person. You must promptly inform Artwork Marketplace and the customer if the item won't be available for pickup so that the buyer can choose another delivery option.",
                style: controller.body,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "You can work directly with the buyer to arrange shipment if we've agreed to it in writing. If you arrange delivery, you consent to provide Artwork Marketplace with shipment tracking information and, upon request, a copy of the release records for each item. a copy of the shipping company's bill of lading that you have signed, attesting that you have released the item or the buyer's signature on the item. If you coordinate a shipment and the work is lost or damaged, you will make every effort to cooperate with the shipper to find a solution. Furthermore, unless Artwork Marketplace has made an alternative arrangement in advance, you are responsible for insuring the items in your possession and accepting a return, refund, or discount on a lost or damaged work.",
                style: controller.body,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "In the scenario where the item is kept in a storage facility, you are responsible for covering any pre-collection storage and insurance fees as well as any charges related to the item's release.",
                style: controller.body,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "7. Disclosure. We reserve the right, but not the obligation, to monitor any activity or material found on or occurring through the Services and investigate as we deem appropriate. We will look into any reported or suspected violations of our agreements or policies, or any third-party complaints, and take any actions we deem appropriate, which may include, but is not limited to, issuing warnings, suspending or terminating service, denying access to the Services, or taking other appropriate action.",
                style: controller.body,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "We reserve the right, in our sole discretion, to inform the proper law enforcement authorities, regulators, or other third parties about any activity or content that we suspect violates any law or regulation. We reserve the right, at our sole discretion, to disclose any information as we deem necessary or appropriate, including but not limited to user contact information, IP addresses and traffic information, usage history, and posted material, in response to governmental requests, to comply with applicable laws, to protect the Services or Users, or to ensure the integrity and operation of the Services and our business, in order to work together. If we exercise the rights we have reserved in this section, you won't be held responsible. ",
                style: controller.body,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "8. Term and Termination. Regardless of any representation made in this agreement or elsewhere (whether written, oral, or implied), we reserve the right to end this agreement and/or restrict, terminate, or suspend your use of any or all of the services at any time, at our sole discretion, with or without notice, and for any reason, including, but not limited to, if you violate any provision of this agreement or if we believe that your actions may expose us, you, or others to legal risk.",
                style: controller.body,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "9. Ownership. All rights, titles, and interests in and to the services, including but not limited to all copyrights, trademark rights, trade secrets, patent rights, moral rights, database rights, and other intellectual property rights therein, are completely and exclusively ours, and we will continue to hold them. Nothing in this Agreement grants you a license or permission to use any of our trademarks, service marks, or logos in any way, or any other license or permission under Artwork Marketplace's or any third party's copyright, trademark, or other intellectual property rights, whether by implication, estoppel, or otherwise. This includes the restricted use of the services provided to you under this Agreement. We reserve all rights that aren't explicitly granted to you in this agreement or in any written contract between us and you.",
                style: controller.body,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "10. Entire Agreement. This Agreement supersedes any and all previous written, oral, or electronic communications, statements, or understandings between you and us regarding the subject matter of this Agreement. It also complies with our Terms of Service, Privacy Policy, Terms of Sale, Listing Schedule, and any other written agreements you may have with us concerning the Services. This Agreement will remain in full force and effect if any provision is deemed illegal or unenforceable by a court of competent jurisdiction for any reason. That provision will instead be enforced to the fullest extent permitted by law.",
                style: controller.body,
              ),
              SizedBox(
                height: 2.h,
              ),
              InkWell(
                onTap: () {
                  Get.find<StorageServices>()
                      .alreadyReadFAQsAndTermsAndServices();
                  Get.offAll(() => LoginView());
                },
                child: Container(
                  height: 8.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black54)),
                  alignment: Alignment.center,
                  child: Text(
                    "Agree and Continue",
                    style: TextStyle(
                      letterSpacing: 3,
                      fontSize: 18.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
