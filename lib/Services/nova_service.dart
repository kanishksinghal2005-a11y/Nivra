import 'package:nivra/data/university_problems.dart';

class NovaResult {
  final bool isSupported;
  final UniversityProblem? problem;
  final String message;

  const NovaResult({
    required this.isSupported,
    required this.problem,
    required this.message,
  });
}

class NovaService {

  // ==========================================
  // NORMALIZE USER INPUT
  // ==========================================

  static String _normalize(String input) {
    return input
        .toLowerCase()
        .trim()
        .replaceAll(RegExp(r'[^\w\s-]'), ' ')
        .replaceAll(RegExp(r'\s+'), ' ');
  }

  // ==========================================
  // ANALYZE UNIVERSITY PROBLEM
  // ==========================================

  static NovaResult analyzeProblem(String input) {

    final String query = _normalize(input);

    if (query.isEmpty) {
      return const NovaResult(
        isSupported: false,
        problem: null,
        message:
            "Please describe the problem you are facing.",
      );
    }

    UniversityProblem? bestMatch;
    int highestScore = 0;

    // ==========================================
    // CHECK EVERY PROBLEM IN DATABASE
    // ==========================================

    for (final UniversityProblem problem
        in UniversityProblems.problems) {

      int score = 0;

      // ----------------------------------------
      // KEYWORD MATCHING
      // ----------------------------------------

      for (final String keyword
          in problem.keywords) {

        final String normalizedKeyword =
            _normalize(keyword);

        if (normalizedKeyword.isEmpty) {
          continue;
        }

        if (query.contains(normalizedKeyword)) {

          /*
           * Longer and more specific phrases
           * receive a higher score.
           */

          score += normalizedKeyword.length * 3;
        }
      }

      // ----------------------------------------
      // INDIVIDUAL WORD MATCHING
      // ----------------------------------------

      final List<String> words =
          query.split(' ');

      for (final String word in words) {

        if (word.isEmpty) {
          continue;
        }

        for (final String keyword
            in problem.keywords) {

          final String normalizedKeyword =
              _normalize(keyword);

          if (normalizedKeyword == word) {
            score += 2;
          }
        }
      }

      // ----------------------------------------
      // CATEGORY CONTEXT
      // ----------------------------------------

      score += _getCategoryContextScore(
        query,
        problem.category,
      );

      // ----------------------------------------
      // KEEP STRONGEST MATCH
      // ----------------------------------------

      if (score > highestScore) {
        highestScore = score;
        bestMatch = problem;
      }
    }

    // ==========================================
    // UNSUPPORTED PROBLEM
    // ==========================================

    if (bestMatch == null ||
        highestScore == 0) {

      return const NovaResult(
        isSupported: false,
        problem: null,
        message:
            "I'm sorry, this problem isn't currently "
            "supported by NIVRA's university problem system.\n\n"
            "Please describe a university-related issue "
            "such as academics, infrastructure, hostel, "
            "library, transport, security, or digital services.",
      );
    }

    // ==========================================
    // SUPPORTED PROBLEM
    // ==========================================

    return NovaResult(
      isSupported: true,
      problem: bestMatch,
      message: _buildResponse(bestMatch),
    );
  }

  // ==========================================
  // CATEGORY CONTEXT SCORE
  // ==========================================

  static int _getCategoryContextScore(
    String query,
    String category,
  ) {

    final String normalizedCategory =
        _normalize(category);

    // ========================================
    // ACADEMICS
    // ========================================

    if (normalizedCategory == "academics") {

      const List<String> academicTerms = [
        "academic",
        "academics",
        "academic issue",
        "academic-related",
        "academic related",
        "study issue",
        "studies",
        "attendance",
        "timetable",
        "exam",
        "examination",
        "result",
        "grade",
        "faculty",
        "assignment",
        "subject",
        "class",
      ];

      for (final String term in academicTerms) {

        if (query.contains(_normalize(term))) {
          return 100;
        }
      }
    }

    // ========================================
    // DIGITAL SERVICES
    // ========================================

    if (normalizedCategory == "digital services") {

      const List<String> digitalTerms = [
        "digital",
        "online service",
        "online services",
        "portal",
        "lms",
        "wifi",
        "internet",
        "online payment",
      ];

      for (final String term in digitalTerms) {

        if (query.contains(_normalize(term))) {
          return 50;
        }
      }
    }

    // ========================================
    // LIBRARY
    // ========================================

    if (normalizedCategory == "library") {

      const List<String> libraryTerms = [
        "library",
        "book",
        "books",
        "reading room",
      ];

      for (final String term in libraryTerms) {

        if (query.contains(_normalize(term))) {
          return 50;
        }
      }
    }

    // ========================================
    // TRANSPORT
    // ========================================

    if (normalizedCategory == "transport") {

      const List<String> transportTerms = [
        "transport",
        "bus",
        "parking",
        "vehicle",
      ];

      for (final String term in transportTerms) {

        if (query.contains(_normalize(term))) {
          return 50;
        }
      }
    }

    // ========================================
    // SECURITY
    // ========================================

    if (normalizedCategory == "security") {

      const List<String> securityTerms = [
        "security",
        "safety",
        "emergency",
        "unsafe",
      ];

      for (final String term in securityTerms) {

        if (query.contains(_normalize(term))) {
          return 50;
        }
      }
    }

    // ========================================
    // STUDENT SERVICES
    // ========================================

    if (normalizedCategory == "student services") {

      const List<String> studentServiceTerms = [
        "student service",
        "student services",
        "administrative",
        "administration",
        "scholarship",
        "student support",
      ];

      for (final String term in studentServiceTerms) {

        if (query.contains(_normalize(term))) {
          return 50;
        }
      }
    }    // ========================================
    // CAMPUS FACILITIES
    // ========================================

    if (normalizedCategory == "campus facilities") {

      const List<String> facilityTerms = [
        "campus facility",
        "campus facilities",
        "infrastructure",
        "water",
        "electricity",
        "cleanliness",
        "classroom",
        "washroom",
        "furniture",
        "canteen",
        "maintenance",
        "repair",
      ];

      for (final String term in facilityTerms) {

        if (query.contains(_normalize(term))) {
          return 50;
        }
      }
    }

    // ========================================
    // HOSTEL
    // ========================================

    if (normalizedCategory == "hostel") {

      const List<String> hostelTerms = [
        "hostel",
        "hostel issue",
        "hostel-related",
        "hostel related",
        "hostel room",
        "hostel water",
        "hostel electricity",
        "hostel cleanliness",
        "hostel food",
        "hostel mess",
        "hostel security",
      ];

      for (final String term in hostelTerms) {

        if (query.contains(_normalize(term))) {
          return 50;
        }
      }
    }

    // ========================================
    // SPORTS AND RECREATION
    // ========================================

    if (normalizedCategory == "sports and recreation") {

      const List<String> sportsTerms = [
        "sports",
        "sport",
        "recreation",
        "playground",
        "gym",
        "sports facility",
      ];

      for (final String term in sportsTerms) {

        if (query.contains(_normalize(term))) {
          return 50;
        }
      }
    }

    // ========================================
    // NO CATEGORY MATCH
    // ========================================

    return 0;
  }

  // ==========================================
  // BUILD NOVA RESPONSE
  // ==========================================

  static String _buildResponse(
    UniversityProblem problem,
  ) {

    return
        "I understand this as a "
        "${problem.title.toLowerCase()}.\n\n"
        "Category: ${problem.category}\n"
        "Department: ${problem.department}\n"
        "Priority: ${problem.defaultPriority}\n\n"
        "${problem.recommendation}\n\n"
        "Would you like to create a complaint "
        "for this issue?";
  }

  // ==========================================
  // CHECK CONFIRMATION
  // ==========================================

  static bool isConfirmation(String input) {

    final String query = _normalize(input);

    const List<String> confirmationWords = [

      "yes",
      "yeah",
      "yep",
      "yup",

      "sure",
      "okay",
      "ok",
      "alright",
      "fine",

      "yes please",
      "yeah please",
      "sure please",
      "okay please",
      "ok please",

      "please do",
      "do it",
      "go ahead",

      "create it",
      "create complaint",
      "create a complaint",

      "report it",
      "report this",
      "report the issue",

      "submit it",
      "submit complaint",
      "submit the complaint",

      "yes create it",
      "yes report it",
      "yes create a complaint",
    ];

    return confirmationWords.contains(query);
  }

  // ==========================================
  // CHECK DECLINE
  // ==========================================

  static bool isDeclined(String input) {

    final String query = _normalize(input);

    const List<String> declineWords = [

      "no",
      "nope",
      "nah",

      "not now",
      "not yet",

      "cancel",
      "cancel it",

      "don't",
      "do not",

      "no thanks",
      "no thank you",

      "not interested",
    ];

    return declineWords.contains(query);
  }

  // ==========================================
  // COMPLAINT CONFIRMATION MESSAGE
  // ==========================================

  static String getComplaintConfirmation(
    UniversityProblem problem,
  ) {

    return
        "Your ${problem.title.toLowerCase()} "
        "has been identified and is ready to be reported "
        "to ${problem.department}.";
  }

  // ==========================================
  // GET ALL CATEGORIES
  // ==========================================

  static List<String> getCategories() {

    return UniversityProblems.problems
        .map(
          (problem) => problem.category,
        )
        .toSet()
        .toList();
  }

  // ==========================================
  // GET PROBLEMS BY CATEGORY
  // ==========================================

  static List<UniversityProblem>
      getProblemsByCategory(
    String category,
  ) {

    return UniversityProblems.problems
        .where(
          (problem) =>
              problem.category == category,
        )
        .toList();
  }
}