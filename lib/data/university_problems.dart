class UniversityProblem {
  final String category;
  final String subCategory;
  final String title;
  final List<String> keywords;
  final String department;
  final String defaultPriority;
  final String recommendation;

  const UniversityProblem({
    required this.category,
    required this.subCategory,
    required this.title,
    required this.keywords,
    required this.department,
    required this.defaultPriority,
    required this.recommendation,
  });
}

class UniversityProblems {
  static const List<UniversityProblem> problems = [

    // ==========================================
    // ACADEMICS
    // ==========================================

    UniversityProblem(
      category: "Academics",
      subCategory: "Attendance",
      title: "Attendance Issue",
      keywords: [
        "attendance",
        "absent",
        "present",
        "attendance shortage",
        "attendance percentage",
        "attendance not updated",
        "attendance is wrong",
        "low attendance",
        "attendance problem",
      ],
      department: "Academic Department",
      defaultPriority: "Medium",
      recommendation:
          "Please contact your academic department or concerned faculty member regarding the attendance issue.",
    ),

    UniversityProblem(
      category: "Academics",
      subCategory: "Timetable",
      title: "Timetable Issue",
      keywords: [
        "timetable",
        "time table",
        "schedule",
        "class timing",
        "class schedule",
        "lecture timing",
        "period",
        "class time",
        "timing problem",
      ],
      department: "Academic Department",
      defaultPriority: "Medium",
      recommendation:
          "Please contact the academic office regarding timetable or scheduling issues.",
    ),

    UniversityProblem(
      category: "Academics",
      subCategory: "Examination",
      title: "Examination Issue",
      keywords: [
        "exam",
        "examination",
        "exam form",
        "exam schedule",
        "exam center",
        "exam centre",
        "admit card",
        "hall ticket",
        "exam problem",
        "exam issue",
      ],
      department: "Examination Department",
      defaultPriority: "High",
      recommendation:
          "Please contact the examination department for assistance with examination-related issues.",
    ),

    UniversityProblem(
      category: "Academics",
      subCategory: "Results",
      title: "Result or Grade Issue",
      keywords: [
        "result",
        "results",
        "marks",
        "mark",
        "grade",
        "grades",
        "score",
        "result not showing",
        "wrong marks",
        "wrong result",
        "revaluation",
        "result problem",
      ],
      department: "Examination Department",
      defaultPriority: "High",
      recommendation:
          "Please contact the examination department regarding result or grading concerns.",
    ),

    UniversityProblem(
      category: "Academics",
      subCategory: "Faculty",
      title: "Faculty Related Issue",
      keywords: [
        "teacher",
        "faculty",
        "professor",
        "lecturer",
        "faculty issue",
        "teacher issue",
        "professor issue",
        "faculty problem",
        "teacher problem",
      ],
      department: "Academic Department",
      defaultPriority: "Medium",
      recommendation:
          "Please provide details of the faculty-related issue so it can be directed to the appropriate academic authority.",
    ),

    UniversityProblem(
      category: "Academics",
      subCategory: "Assignment",
      title: "Assignment Issue",
      keywords: [
        "assignment",
        "assignments",
        "submission",
        "project submission",
        "assignment submission",
        "deadline",
        "internal assessment",
        "coursework",
        "assignment problem",
      ],
      department: "Academic Department",
      defaultPriority: "Medium",
      recommendation:
          "Please contact the concerned faculty member or academic department regarding the assignment issue.",
    ),

    // ==========================================
    // DIGITAL SERVICES
    // ==========================================

    UniversityProblem(
      category: "Digital Services",
      subCategory: "Wi-Fi",
      title: "Wi-Fi or Internet Issue",
      keywords: [
        "wifi",
        "wi-fi",
        "wi fi",
        "internet",
        "network",
        "internet not working",
        "wifi not working",
        "slow internet",
        "slow wifi",
        "no connection",
        "no internet",
        "network problem",
        "network issue",
        "cannot connect wifi",
        "can't connect wifi",
      ],
      department: "IT Support",
      defaultPriority: "Medium",
      recommendation:
          "Please report the Wi-Fi or internet issue to the university IT support team.",
    ),

    UniversityProblem(
      category: "Digital Services",
      subCategory: "Student Portal",
      title: "Student Portal Issue",
      keywords: [
        "student portal",
        "portal",
        "login portal",
        "student login",
        "portal not working",
        "portal error",
        "portal problem",
        "portal issue",
        "unable to login portal",
      ],
      department: "IT Support",
      defaultPriority: "Medium",
      recommendation:
          "Please contact IT support regarding the student portal issue.",
    ),

    UniversityProblem(
      category: "Digital Services",
      subCategory: "Learning Management System",
      title: "LMS Issue",
      keywords: [
        "lms",
        "learning management system",
        "online class",
        "course portal",
        "course material",
        "online assignment",
        "lms problem",
        "lms issue",
        "online learning",
      ],
      department: "IT Support",
      defaultPriority: "Medium",
      recommendation:
          "Please report the LMS or online learning issue to IT support.",
    ),

    UniversityProblem(
      category: "Digital Services",
      subCategory: "Fee Payment",
      title: "Online Fee Payment Issue",
      keywords: [
        "fee payment",
        "fees",
        "fee",
        "payment",
        "online payment",
        "payment failed",
        "transaction failed",
        "fee problem",
        "fee issue",
        "payment problem",
        "payment issue",
      ],
      department: "Accounts Department",
      defaultPriority: "High",
      recommendation:
          "Please contact the accounts department regarding the fee or payment issue.",
    ),

    UniversityProblem(
      category: "Digital Services",
      subCategory: "ID Card",
      title: "Student ID Card Issue",
      keywords: [
        "id card",
        "idcard",
        "identity card",
        "student card",
        "college id",
        "university id",
        "lost id",
        "lost id card",
        "id card not received",
        "id card problem",
      ],
      department: "Student Services",
      defaultPriority: "Medium",
      recommendation:
          "Please contact student services regarding your ID card issue.",
    ),

    // ==========================================
    // LIBRARY
    // ==========================================

    UniversityProblem(
      category: "Library",
      subCategory: "Book Availability",
      title: "Book Availability Issue",
      keywords: [
        "book",
        "library book",
        "book unavailable",
        "book not available",
        "textbook",
        "reference book",
        "book availability",
        "book problem",
      ],
      department: "Library Department",
      defaultPriority: "Low",
      recommendation:
          "Please contact the library staff regarding book availability.",
    ),

    UniversityProblem(
      category: "Library",
      subCategory: "Library Facilities",
      title: "Library Facility Issue",
      keywords: [
        "library",
        "library computer",
        "library chair",
        "library table",
        "library light",
        "library ac",
        "library fan",
        "library facility",
        "library facilities",
        "library problem",
      ],
      department: "Library Department",
      defaultPriority: "Medium",
      recommendation:
          "Please report the library facility issue to the library administration.",
    ),    // ==========================================
    // TRANSPORT
    // ==========================================

    UniversityProblem(
      category: "Transport",
      subCategory: "Bus Service",
      title: "University Bus Issue",
      keywords: [
        "bus",
        "college bus",
        "university bus",
        "bus timing",
        "bus timings",
        "bus route",
        "bus not coming",
        "bus late",
        "bus delayed",
        "transport",
        "transport problem",
        "transport issue",
        "bus problem",
      ],
      department: "Transport Department",
      defaultPriority: "Medium",
      recommendation:
          "Please contact the university transport department regarding the bus service issue.",
    ),

    UniversityProblem(
      category: "Transport",
      subCategory: "Parking",
      title: "Parking Issue",
      keywords: [
        "parking",
        "parking space",
        "parking problem",
        "parking issue",
        "vehicle",
        "bike parking",
        "car parking",
        "parking area",
        "no parking space",
      ],
      department: "Campus Administration",
      defaultPriority: "Low",
      recommendation:
          "Please report the parking-related issue to campus administration.",
    ),

    // ==========================================
    // SECURITY
    // ==========================================

    UniversityProblem(
      category: "Security",
      subCategory: "Campus Security",
      title: "Campus Security Issue",
      keywords: [
        "security",
        "security guard",
        "guard",
        "safety",
        "campus safety",
        "security concern",
        "security problem",
        "security issue",
        "unauthorized person",
        "suspicious person",
        "campus security",
      ],
      department: "Campus Security",
      defaultPriority: "High",
      recommendation:
          "For security concerns, please contact campus security immediately.",
    ),

    UniversityProblem(
      category: "Security",
      subCategory: "Emergency",
      title: "Emergency or Safety Issue",
      keywords: [
        "emergency",
        "danger",
        "unsafe",
        "accident",
        "fire",
        "injury",
        "medical emergency",
        "urgent",
        "life threatening",
        "safety emergency",
      ],
      department: "Campus Emergency Services",
      defaultPriority: "Critical",
      recommendation:
          "This appears to be an urgent safety issue. Please contact the appropriate campus emergency service immediately.",
    ),

    // ==========================================
    // STUDENT SERVICES
    // ==========================================

    UniversityProblem(
      category: "Student Services",
      subCategory: "Administrative Services",
      title: "Administrative Issue",
      keywords: [
        "administration",
        "administrative",
        "office",
        "document",
        "documents",
        "certificate",
        "bonafide",
        "bonafide certificate",
        "student service",
        "administrative problem",
        "administrative issue",
        "office problem",
      ],
      department: "Student Services",
      defaultPriority: "Medium",
      recommendation:
          "Please contact student services or the concerned administrative office.",
    ),

    UniversityProblem(
      category: "Student Services",
      subCategory: "Scholarship",
      title: "Scholarship Issue",
      keywords: [
        "scholarship",
        "scholarship payment",
        "scholarship form",
        "scholarship status",
        "financial aid",
        "scholarship problem",
        "scholarship issue",
        "scholarship money",
      ],
      department: "Student Services",
      defaultPriority: "Medium",
      recommendation:
          "Please contact student services or the scholarship administration regarding your scholarship issue.",
    ),

    UniversityProblem(
      category: "Student Services",
      subCategory: "General Support",
      title: "General Student Support",
      keywords: [
        "student support",
        "student help",
        "guidance",
        "support",
        "information",
        "student assistance",
        "general help",
        "general support",
      ],
      department: "Student Services",
      defaultPriority: "Low",
      recommendation:
          "Please contact student services for assistance with your request.",
    ),

    // ==========================================
    // CAMPUS FACILITIES
    // ==========================================

    UniversityProblem(
      category: "Campus Facilities",
      subCategory: "Water Supply",
      title: "Water Supply Issue",
      keywords: [
        "water",
        "water supply",
        "water problem",
        "water issue",
        "no water",
        "water shortage",
        "water not available",
        "water is not available",
        "drinking water",
        "tap water",
        "water leakage",
        "water leak",
      ],
      department: "Maintenance Department",
      defaultPriority: "High",
      recommendation:
          "Please report the water supply issue to the university maintenance department.",
    ),

    UniversityProblem(
      category: "Campus Facilities",
      subCategory: "Electricity",
      title: "Electricity Issue",
      keywords: [
        "electricity",
        "electric",
        "power",
        "power cut",
        "power outage",
        "electricity problem",
        "electricity issue",
        "no electricity",
        "light not working",
        "lights not working",
        "fan not working",
        "switch not working",
        "electrical problem",
      ],
      department: "Electrical Maintenance",
      defaultPriority: "High",
      recommendation:
          "Please report the electricity or electrical equipment issue to the university electrical maintenance team.",
    ),

    UniversityProblem(
      category: "Campus Facilities",
      subCategory: "Cleanliness",
      title: "Cleanliness Issue",
      keywords: [
        "cleanliness",
        "cleaning",
        "dirty",
        "dirt",
        "unclean",
        "filthy",
        "garbage",
        "trash",
        "waste",
        "litter",
        "dust",
        "dirty washroom",
        "dirty bathroom",
        "washroom cleaning",
        "toilet cleaning",
        "cleanliness problem",
        "cleanliness issue",
      ],
      department: "Housekeeping Department",
      defaultPriority: "Medium",
      recommendation:
          "Please report the cleanliness issue to the university housekeeping department.",
    ),

    UniversityProblem(
      category: "Campus Facilities",
      subCategory: "Classroom Infrastructure",
      title: "Classroom Infrastructure Issue",
      keywords: [
        "classroom",
        "class room",
        "classroom problem",
        "classroom issue",
        "desk",
        "bench",
        "chair",
        "board",
        "blackboard",
        "whiteboard",
        "projector",
        "classroom projector",
        "classroom fan",
        "classroom light",
        "broken desk",
        "broken chair",
        "broken bench",
      ],
      department: "Campus Maintenance",
      defaultPriority: "Medium",
      recommendation:
          "Please report the classroom infrastructure issue to campus maintenance.",
    ),

    // ==========================================
    // HOSTEL
    // ==========================================

    UniversityProblem(
      category: "Hostel",
      subCategory: "Room Maintenance",
      title: "Hostel Room Maintenance Issue",
      keywords: [
        "hostel",
        "hostel room",
        "hostel maintenance",
        "hostel repair",
        "room repair",
        "room maintenance",
        "broken bed",
        "broken fan",
        "broken light",
        "room problem",
        "room issue",
        "hostel problem",
        "hostel issue",
        "hostel room problem",
      ],
      department: "Hostel Administration",
      defaultPriority: "Medium",
      recommendation:
          "Please report the hostel room maintenance issue to the hostel administration.",
    ),

    UniversityProblem(
      category: "Hostel",
      subCategory: "Water Supply",
      title: "Hostel Water Supply Issue",
      keywords: [
        "hostel water",
        "hostel water supply",
        "hostel water problem",
        "hostel water issue",
        "no water hostel",
        "water in hostel",
        "hostel tap",
        "hostel bathroom water",
        "hostel washroom water",
      ],
      department: "Hostel Administration",
      defaultPriority: "High",
      recommendation:
          "Please report the hostel water supply issue to the hostel administration.",
    ),

    UniversityProblem(
      category: "Hostel",
      subCategory: "Electricity",
      title: "Hostel Electricity Issue",
      keywords: [
        "hostel electricity",
        "hostel electric",
        "hostel power",
        "hostel power cut",
        "hostel power outage",
        "hostel light",
        "hostel fan",
        "hostel electricity problem",
        "hostel electricity issue",
      ],
      department: "Hostel Administration",
      defaultPriority: "High",
      recommendation:
          "Please report the hostel electricity issue to the hostel administration or maintenance team.",
    ),

    UniversityProblem(
      category: "Hostel",
      subCategory: "Cleanliness",
      title: "Hostel Cleanliness Issue",
      keywords: [
        "hostel cleanliness",
        "hostel cleaning",
        "hostel dirty",
        "dirty hostel",
        "hostel garbage",
        "hostel waste",
        "hostel washroom",
        "hostel bathroom",
        "hostel toilet",
        "hostel cleanliness problem",
      ],
      department: "Hostel Administration",
      defaultPriority: "Medium",
      recommendation:
          "Please report the hostel cleanliness issue to the hostel administration.",
    ),

    UniversityProblem(
      category: "Hostel",
      subCategory: "Mess",
      title: "Hostel Mess or Food Issue",
      keywords: [
        "mess",
        "hostel mess",
        "mess food",
        "hostel food",
        "food quality",
        "bad food",
        "food problem",
        "food issue",
        "mess problem",
        "mess issue",
        "food hygiene",
      ],
      department: "Hostel Administration",
      defaultPriority: "Medium",
      recommendation:
          "Please report the hostel mess or food-related issue to the hostel administration.",
    ),

    UniversityProblem(
      category: "Hostel",
      subCategory: "Hostel Security",
      title: "Hostel Security Issue",
      keywords: [
        "hostel security",
        "hostel guard",
        "hostel safety",
        "hostel security problem",
        "hostel security issue",
        "unauthorized hostel entry",
        "unknown person hostel",
      ],
      department: "Hostel Administration",
      defaultPriority: "High",
      recommendation:
          "Please report the hostel security concern to the hostel administration or security team immediately.",
    ),    // ==========================================
    // CAMPUS FACILITIES - GENERAL INFRASTRUCTURE
    // ==========================================

    UniversityProblem(
      category: "Campus Facilities",
      subCategory: "Building Maintenance",
      title: "Building Maintenance Issue",
      keywords: [
        "building",
        "building maintenance",
        "building repair",
        "building problem",
        "building issue",
        "wall damage",
        "ceiling damage",
        "roof leakage",
        "water leakage",
        "leakage",
        "door broken",
        "window broken",
        "floor damage",
        "campus infrastructure",
        "infrastructure problem",
        "infrastructure issue",
      ],
      department: "Campus Maintenance",
      defaultPriority: "Medium",
      recommendation:
          "Please report the building or infrastructure issue to the campus maintenance department.",
    ),

    UniversityProblem(
      category: "Campus Facilities",
      subCategory: "Washroom",
      title: "Washroom Facility Issue",
      keywords: [
        "washroom",
        "bathroom",
        "toilet",
        "washroom problem",
        "washroom issue",
        "bathroom problem",
        "bathroom issue",
        "toilet problem",
        "toilet issue",
        "washroom maintenance",
        "bathroom maintenance",
        "toilet maintenance",
      ],
      department: "Housekeeping Department",
      defaultPriority: "Medium",
      recommendation:
          "Please report the washroom facility issue to the housekeeping or campus maintenance department.",
    ),

    UniversityProblem(
      category: "Campus Facilities",
      subCategory: "Furniture",
      title: "Campus Furniture Issue",
      keywords: [
        "furniture",
        "broken furniture",
        "broken chair",
        "broken table",
        "broken desk",
        "broken bench",
        "chair broken",
        "table broken",
        "desk broken",
        "bench broken",
        "furniture problem",
        "furniture issue",
      ],
      department: "Campus Maintenance",
      defaultPriority: "Medium",
      recommendation:
          "Please report the damaged furniture to the campus maintenance department.",
    ),

    // ==========================================
    // HOSTEL
    // ==========================================

    UniversityProblem(
      category: "Hostel",
      subCategory: "Room Maintenance",
      title: "Hostel Room Maintenance Issue",
      keywords: [
        "hostel room",
        "hostel maintenance",
        "hostel repair",
        "room repair",
        "room maintenance",
        "broken bed",
        "broken fan",
        "broken light",
        "broken cupboard",
        "room problem",
        "room issue",
        "hostel problem",
        "hostel issue",
      ],
      department: "Hostel Administration",
      defaultPriority: "Medium",
      recommendation:
          "Please report the hostel room maintenance issue to the hostel administration.",
    ),

    UniversityProblem(
      category: "Hostel",
      subCategory: "Water Supply",
      title: "Hostel Water Supply Issue",
      keywords: [
        "hostel water",
        "hostel water supply",
        "hostel water problem",
        "hostel water issue",
        "no water hostel",
        "water in hostel",
        "hostel tap",
        "hostel bathroom water",
        "hostel washroom water",
      ],
      department: "Hostel Administration",
      defaultPriority: "High",
      recommendation:
          "Please report the hostel water supply issue to the hostel administration.",
    ),

    UniversityProblem(
      category: "Hostel",
      subCategory: "Electricity",
      title: "Hostel Electricity Issue",
      keywords: [
        "hostel electricity",
        "hostel electric",
        "hostel power",
        "hostel power cut",
        "hostel power outage",
        "hostel light",
        "hostel fan",
        "hostel electricity problem",
        "hostel electricity issue",
      ],
      department: "Hostel Administration",
      defaultPriority: "High",
      recommendation:
          "Please report the hostel electricity issue to the hostel administration or maintenance team.",
    ),

    UniversityProblem(
      category: "Hostel",
      subCategory: "Cleanliness",
      title: "Hostel Cleanliness Issue",
      keywords: [
        "hostel cleanliness",
        "hostel cleaning",
        "hostel dirty",
        "dirty hostel",
        "hostel garbage",
        "hostel waste",
        "hostel washroom",
        "hostel bathroom",
        "hostel toilet",
        "hostel cleanliness problem",
      ],
      department: "Hostel Administration",
      defaultPriority: "Medium",
      recommendation:
          "Please report the hostel cleanliness issue to the hostel administration.",
    ),

    UniversityProblem(
      category: "Hostel",
      subCategory: "Mess",
      title: "Hostel Mess or Food Issue",
      keywords: [
        "mess",
        "hostel mess",
        "mess food",
        "hostel food",
        "food quality",
        "bad food",
        "food problem",
        "food issue",
        "mess problem",
        "mess issue",
        "food hygiene",
      ],
      department: "Hostel Administration",
      defaultPriority: "Medium",
      recommendation:
          "Please report the hostel mess or food-related issue to the hostel administration.",
    ),

    UniversityProblem(
      category: "Hostel",
      subCategory: "Security",
      title: "Hostel Security Issue",
      keywords: [
        "hostel security",
        "hostel guard",
        "hostel safety",
        "hostel security problem",
        "hostel security issue",
        "unauthorized hostel entry",
        "unknown person hostel",
      ],
      department: "Hostel Administration",
      defaultPriority: "High",
      recommendation:
          "Please report the hostel security concern to the hostel administration or security team immediately.",
    ),

    // ==========================================
    // CANTEEN
    // ==========================================

    UniversityProblem(
      category: "Campus Facilities",
      subCategory: "Canteen",
      title: "Canteen Issue",
      keywords: [
        "canteen",
        "canteen problem",
        "canteen issue",
        "canteen food",
        "food quality",
        "food hygiene",
        "canteen cleanliness",
        "canteen service",
        "canteen price",
        "food complaint",
      ],
      department: "Campus Administration",
      defaultPriority: "Medium",
      recommendation:
          "Please report the canteen-related issue to campus administration.",
    ),

    // ==========================================
    // SPORTS AND RECREATION
    // ==========================================

    UniversityProblem(
      category: "Sports and Recreation",
      subCategory: "Sports Facilities",
      title: "Sports Facility Issue",
      keywords: [
        "sports",
        "sports facility",
        "sports facilities",
        "sports ground",
        "playground",
        "gym",
        "gym equipment",
        "sports equipment",
        "sports problem",
        "sports issue",
        "ground problem",
      ],
      department: "Sports Department",
      defaultPriority: "Low",
      recommendation:
          "Please report the sports facility issue to the university sports department.",
    ),

    // ==========================================
    // GENERAL CAMPUS
    // ==========================================

    UniversityProblem(
      category: "Campus Facilities",
      subCategory: "General Infrastructure",
      title: "General Campus Infrastructure Issue",
      keywords: [
        "campus",
        "campus problem",
        "campus issue",
        "infrastructure",
        "facility",
        "facilities",
        "maintenance",
        "repair",
        "broken",
        "damaged",
        "campus maintenance",
      ],
      department: "Campus Administration",
      defaultPriority: "Medium",
      recommendation:
          "Please provide the specific location and details so the issue can be directed to the appropriate campus maintenance authority.",
    ),
  ];
}