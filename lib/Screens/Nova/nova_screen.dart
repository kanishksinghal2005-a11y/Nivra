import 'package:flutter/material.dart';
import 'package:nivra/services/nova_service.dart';

class NovaScreen extends StatefulWidget {
  const NovaScreen({super.key});

  @override
  State<NovaScreen> createState() => _NovaScreenState();
}

class _NovaScreenState extends State<NovaScreen> {

  final TextEditingController messageController =
      TextEditingController();

  final ScrollController scrollController =
      ScrollController();

  final List<Map<String, dynamic>> messages = [];

  bool isTyping = false;

  /// Stores the most recently detected problem.
  ///
  /// This allows NOVA to remember what the user
  /// was talking about when they answer:
  /// "Yes", "Sure", "Go ahead", etc.
  NovaResult? lastProblemResult;

  @override
  void dispose() {
    messageController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  // ==========================================
  // SEND MESSAGE
  // ==========================================

  void sendMessage() {

    final String message =
        messageController.text.trim();

    if (message.isEmpty) {
      return;
    }

    setState(() {
      messages.add({
        'message': message,
        'isUser': true,
      });

      messageController.clear();
      isTyping = true;
    });

    scrollToBottom();

    Future.delayed(
      const Duration(milliseconds: 700),
      () {

        if (!mounted) return;

        // ======================================
        // CHECK FOR YES / CONFIRMATION
        // ======================================

        if (NovaService.isConfirmation(message)) {

          handleComplaintConfirmation();

          return;
        }

        // ======================================
        // CHECK FOR NO / DECLINE
        // ======================================

        if (NovaService.isDeclined(message)) {

          handleComplaintDeclined();

          return;
        }

        // ======================================
        // ANALYZE NEW PROBLEM
        // ======================================

        final NovaResult result =
            NovaService.analyzeProblem(message);

        setState(() {

          messages.add({
            'message': result.message,
            'isUser': false,
            'isResult': result.isSupported,
            'problem': result.problem,
          });

          isTyping = false;

        });

        // Remember the detected problem only
        // when NOVA successfully identifies one.
        if (result.isSupported &&
            result.problem != null) {

          lastProblemResult = result;
        }

        scrollToBottom();
      },
    );
  }

  // ==========================================
  // HANDLE YES
  // ==========================================

  void handleComplaintConfirmation() {

    if (lastProblemResult?.problem == null) {

      setState(() {

        messages.add({
          'message':
              "Please describe the problem you want "
              "to report first.",
          'isUser': false,
        });

        isTyping = false;
      });

      scrollToBottom();

      return;
    }

    final problem =
        lastProblemResult!.problem!;

    setState(() {

      messages.add({
        'message':
            "Sure! Your ${problem.title.toLowerCase()} "
            "is ready to be reported to "
            "${problem.department}.\n\n"
            'Please tap the "Create Complaint" button above '
            "to continue with complaint registration.",
        'isUser': false,
      });

      isTyping = false;
    });

    scrollToBottom();

    // ==========================================
    // ACTUAL COMPLAINT SCREEN WILL BE CONNECTED
    // HERE AFTER WE HAVE YOUR SCREEN.
    // ==========================================

    /*
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ComplaintRegistrationScreen(
          problem: problem,
        ),
      ),
    );
    */
  }

  // ==========================================
  // HANDLE NO
  // ==========================================

  void handleComplaintDeclined() {

    setState(() {

      messages.add({
        'message':
            "No problem. Your complaint has not "
            "been created.\n\n"
            "If you need help with another "
            "university-related issue, just tell me.",
        'isUser': false,
      });

      isTyping = false;
    });

    // Clear the previous problem because
    // the user declined to create a complaint.
    lastProblemResult = null;

    scrollToBottom();
  }

  // ==========================================
  // SEND SUGGESTION
  // ==========================================

  void sendSuggestion(String suggestion) {

    messageController.text = suggestion;

    sendMessage();
  }

  // ==========================================
  // SCROLL TO BOTTOM
  // ==========================================

  void scrollToBottom() {

    Future.delayed(
      const Duration(milliseconds: 100),
      () {

        if (!scrollController.hasClients) {
          return;
        }

        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration:
              const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:
          const Color(0xffF8FAFC),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black87,
          ),
        ),

        title: Row(
          children: [

            Container(
              height: 42,
              width: 42,
              decoration: BoxDecoration(
                color:
                    const Color(0xffEDF3FF),
                borderRadius:
                    BorderRadius.circular(14),
              ),
              child: const Icon(
                Icons.auto_awesome,
                color:
                    Color(0xff2962FF),
                size: 23,
              ),
            ),

            const SizedBox(width: 12),

            const Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [

                Text(
                  "NOVA",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                Text(
                  "NIVRA AI Assistant",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 11,
                    fontWeight:
                        FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      body: Column(
        children: [          // ==========================================
          // NOVA INTRODUCTION
          // ==========================================

          if (messages.isEmpty)
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  20,
                  25,
                  20,
                  10,
                ),
                child: Column(
                  children: [

                    // NOVA Avatar
                    Container(
                      height: 78,
                      width: 78,
                      decoration: BoxDecoration(
                        color: const Color(0xffEDF3FF),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 15,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.auto_awesome,
                        color: Color(0xff2962FF),
                        size: 38,
                      ),
                    ),

                    const SizedBox(height: 22),

                    const Text(
                      "Hello! I'm NOVA 👋",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff212121),
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Your NIVRA AI Assistant",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff2962FF),
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      "I can help you understand and report "
                      "problems related to your university.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.5,
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 30),

                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "What can I help you with?",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff212121),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    suggestionCard(
                      icon: Icons.wifi_rounded,
                      title: "Wi-Fi or Internet Issue",
                      onTap: () {
                        sendSuggestion(
                          "I'm facing a Wi-Fi or internet issue.",
                        );
                      },
                    ),

                    suggestionCard(
                      icon: Icons.water_drop_outlined,
                      title: "Water Supply Issue",
                      onTap: () {
                        sendSuggestion(
                          "I'm facing a water supply issue.",
                        );
                      },
                    ),

                    suggestionCard(
                      icon: Icons.electrical_services_outlined,
                      title: "Electricity Issue",
                      onTap: () {
                        sendSuggestion(
                          "I'm facing an electricity issue.",
                        );
                      },
                    ),

                    suggestionCard(
                      icon: Icons.cleaning_services_outlined,
                      title: "Cleanliness Issue",
                      onTap: () {
                        sendSuggestion(
                          "I want to report a cleanliness issue.",
                        );
                      },
                    ),

                    suggestionCard(
                      icon: Icons.school_outlined,
                      title: "Academic Issue",
                      onTap: () {
                        sendSuggestion(
                          "I have an academic-related issue.",
                        );
                      },
                    ),

                    suggestionCard(
                      icon: Icons.home_work_outlined,
                      title: "Hostel Issue",
                      onTap: () {
                        sendSuggestion(
                          "I have a hostel-related issue.",
                        );
                      },
                    ),

                    const SizedBox(height: 20),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xffEDF3FF),
                        borderRadius:
                            BorderRadius.circular(18),
                      ),
                      child: const Row(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [

                          Icon(
                            Icons.info_outline,
                            color: Color(0xff2962FF),
                          ),

                          SizedBox(width: 12),

                          Expanded(
                            child: Text(
                              "NOVA currently focuses on "
                              "university-related problems "
                              "and services.",
                              style: TextStyle(
                                fontSize: 13,
                                height: 1.4,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),

          // ==========================================
          // CHAT MESSAGES
          // ==========================================

          if (messages.isNotEmpty)
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                padding: const EdgeInsets.all(20),
                itemCount:
                    messages.length +
                    (isTyping ? 1 : 0),
                itemBuilder: (context, index) {

                  if (isTyping &&
                      index == messages.length) {
                    return typingIndicator();
                  }

                  final Map<String, dynamic> message =
                      messages[index];

                  return messageBubble(
                    message['message'] as String,
                    message['isUser'] as bool,
                    problem: message['problem'],
                    isResult:
                        message['isResult'] ?? false,
                  );
                },
              ),
            ),

          // ==========================================
          // MESSAGE INPUT
          // ==========================================

          Container(
            padding: const EdgeInsets.fromLTRB(
              16,
              10,
              16,
              16,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 12,
                  offset: const Offset(0, -3),
                ),
              ],
            ),
            child: Row(
              children: [

                Expanded(
                  child: TextField(
                    controller:
                        messageController,
                    textInputAction:
                        TextInputAction.send,
                    onSubmitted: (_) {
                      sendMessage();
                    },
                    decoration:
                        InputDecoration(
                      hintText:
                          "Describe your problem...",
                      filled: true,
                      fillColor:
                          const Color(0xffF7F8FC),
                      contentPadding:
                          const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 15,
                      ),
                      border:
                          OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(18),
                        borderSide:
                            BorderSide.none,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                Container(
                  height: 52,
                  width: 52,
                  decoration: BoxDecoration(
                    color:
                        const Color(0xff2962FF),
                    borderRadius:
                        BorderRadius.circular(17),
                  ),
                  child: IconButton(
                    onPressed: sendMessage,
                    icon: const Icon(
                      Icons.arrow_upward_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),        ],
      ),
    );
  }

  // ==========================================
  // SUGGESTION CARD
  // ==========================================

  Widget suggestionCard({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 12,
        ),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(16),
          border: Border.all(
            color: Colors.grey.shade200,
          ),
          boxShadow: [
            BoxShadow(
              color:
                  Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [

            Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius:
                    BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: Colors.blue,
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight:
                      FontWeight.w600,
                ),
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios,
              size: 15,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  // ==========================================
  // MESSAGE BUBBLE
  // ==========================================

  Widget messageBubble(
    String message,
    bool isUser, {
    dynamic problem,
    bool isResult = false,
  }) {
    return Align(
      alignment: isUser
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 12,
          left: 8,
          right: 8,
        ),
        padding: const EdgeInsets.all(14),
        constraints: const BoxConstraints(
          maxWidth: 360,
        ),
        decoration: BoxDecoration(
          color: isUser
              ? Colors.blue
              : Colors.white,
          borderRadius:
              BorderRadius.circular(16),
          border: isUser
              ? null
              : Border.all(
                  color: Colors.grey.shade200,
                ),
          boxShadow: isUser
              ? null
              : [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.04),
                    blurRadius: 6,
                    offset:
                        const Offset(0, 2),
                  ),
                ],
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [

            Text(
              message,
              style: TextStyle(
                fontSize: 15,
                height: 1.4,
                color: isUser
                    ? Colors.white
                    : Colors.black87,
              ),
            ),

            // ==================================
            // ISSUE DETAILS
            // ==================================

            if (!isUser &&
                isResult &&
                problem != null) ...[

              const SizedBox(height: 14),

              Container(
                padding:
                    const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color:
                      Colors.grey.shade50,
                  borderRadius:
                      BorderRadius.circular(12),
                  border: Border.all(
                    color:
                        Colors.grey.shade200,
                  ),
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [

                    const Text(
                      "Issue Details",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(
                      height: 12,
                    ),

                    detailRow(
                      "Category",
                      problem.category,
                    ),

                    detailRow(
                      "Problem",
                      problem.title,
                    ),

                    detailRow(
                      "Department",
                      problem.department,
                    ),

                    detailRow(
                      "Priority",
                      problem.defaultPriority,
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    SizedBox(
                      width: double.infinity,
                      child:
                          ElevatedButton.icon(
                        onPressed: () {
                          showComplaintMessage(
                            problem,
                          );
                        },
                        icon: const Icon(
                          Icons
                              .report_problem_outlined,
                          size: 18,
                        ),
                        label: const Text(
                          "Create Complaint",
                        ),
                        style:
                            ElevatedButton
                                .styleFrom(
                          padding:
                              const EdgeInsets
                                  .symmetric(
                            vertical: 12,
                          ),
                          shape:
                              RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius
                                    .circular(
                              10,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  // ==========================================
  // DETAIL ROW
  // ==========================================

  Widget detailRow(
    String label,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8,
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [

          SizedBox(
            width: 85,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight:
                    FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ),

          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 13,
                fontWeight:
                    FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================
  // TEMPORARY COMPLAINT MESSAGE
  // ==========================================

  void showComplaintMessage(
    dynamic problem,
  ) {
    ScaffoldMessenger.of(context)
        .showSnackBar(
      SnackBar(
        content: Text(
          "${problem.title} is ready to be reported.",
        ),
        behavior:
            SnackBarBehavior.floating,
      ),
    );
  }

  // ==========================================
  // TYPING INDICATOR
  // ==========================================

  Widget typingIndicator() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(
          left: 8,
          right: 8,
          bottom: 12,
        ),
        padding:
            const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(16),
          border: Border.all(
            color: Colors.grey.shade200,
          ),
        ),
        child: Row(
          mainAxisSize:
              MainAxisSize.min,
          children: [

            Container(
              width: 7,
              height: 7,
              decoration:
                  const BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),

            const SizedBox(width: 5),

            Container(
              width: 7,
              height: 7,
              decoration:
                  const BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),

            const SizedBox(width: 5),

            Container(
              width: 7,
              height: 7,
              decoration:
                  const BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),

            const SizedBox(width: 8),

            const Text(
              "NOVA is typing...",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}