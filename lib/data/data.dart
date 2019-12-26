class Course {
  final String name;
  final String linkLecture;
  final String linkTutorial;
  final String linkStream;
  final String linkWebsite;
  final Set<Day> daysLecture;
  final Day dayTutorial;
  final int dayHomework;
  final List<Task> tasks;

  const Course(
      {this.name,
      this.linkLecture,
      this.linkTutorial,
      this.linkStream,
      this.linkWebsite,
      this.daysLecture,
      this.dayTutorial,
      this.dayHomework,
      this.tasks});
}

class Task {
  final String name;
  final bool isSet;

  const Task({this.name, this.isSet});
}

class EventDisplay {
  final String title;
  final String content;
  final String start;

  const EventDisplay({this.title, this.content, this.start});
}

enum Day { Mon, Tue, Wed, Thu, Fri, Sat, Sun }

final week = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

final String username = "my friend";


final courses = [
  Course(
      name: "GDB",
      linkLecture: "https://www.moodle.tum.de/course/view.php?id=49531",
      linkTutorial: "https://www.moodle.tum.de/course/view.php?id=49531",
      linkStream: "https://live.rbg.tum.de/cgi-bin/streams",
      linkWebsite: "https://db.in.tum.de/teaching/ws1920/grundlagen/",
      daysLecture: {Day.Wed},
      dayTutorial: Day.Mon,
      dayHomework: 0,
      tasks: genericTasks),
  Course(
      name: "GBS",
      linkLecture: "https://www.moodle.tum.de/course/view.php?id=49592",
      linkTutorial: "http://gbs.cm.in.tum.de/",
      linkStream: "https://live.rbg.tum.de/cgi-bin/streams",
      linkWebsite: "http://gbs.cm.in.tum.de/",
      daysLecture: {Day.Mon, Day.Wed},
      dayTutorial: Day.Mon,
      dayHomework: 2,
      tasks: genericTasks),
  Course(
      name: "NumPro",
      linkLecture: "https://www.moodle.tum.de/course/view.php?id=49337",
      linkTutorial: "https://www.moodle.tum.de/course/view.php?id=49337",
      linkStream: "https://www.moodle.tum.de/mod/lti/view.php?id=940078",
      linkWebsite: "http://numpro.pproc-be.sccs.in.tum.de/",
      daysLecture: {Day.Tue},
      dayTutorial: Day.Thu,
      tasks: genericSimpleTasks),
  Course(
      name: "FPV",
      linkLecture: "https://www.moodle.tum.de/course/view.php?id=52268",
      linkTutorial: "https://www.moodle.tum.de/course/view.php?id=52268",
      linkStream:
          "https://streams.tum.de/Mediasite/Catalog/Full/183ec8021208486e8fbd698c1574bb9921?preview=o1lore21gnraxwdmijt0ahaz_catalogPreview",
      linkWebsite: "https://vmnipkow3.in.tum.de/web/",
      daysLecture: {Day.Fri},
      dayTutorial: Day.Mon,
      dayHomework: 0,
      tasks: genericSimpleTasks),
  Course(
      name: "EXP3",
      linkLecture: "https://www.moodle.tum.de/course/view.php?id=47219",
      linkTutorial: "https://www.moodle.tum.de/course/view.php?id=47219",
      daysLecture: {Day.Mon, Day.Thu},
      dayTutorial: Day.Mon,
      dayHomework: 6,
      tasks: basicTasks),
  Course(
      name: "ANA3",
      linkLecture: "https://www.moodle.tum.de/course/view.php?id=50848",
      linkTutorial: "https://www.moodle.tum.de/course/view.php?id=52214",
      linkWebsite:
          "https://www-m8.ma.tum.de/bin/view/Allgemeines/Analysis3fuerPhysik",
      daysLecture: {Day.Tue, Day.Thu},
      tasks: basicTasks),
  Course(
      name: "THEO2",
      linkLecture: "https://www.moodle.tum.de/course/view.php?id=47222",
      linkTutorial: "https://www.moodle.tum.de/course/view.php?id=47222",
      linkStream: "https://www.moodle.tum.de/mod/lti/view.php?id=992352",
      daysLecture: {Day.Tue, Day.Fri},
      tasks: minimalTasks),
];

final genericTasks = [
  Task(name: "Went to Tutorial", isSet: false),
  Task(name: "Did Homework", isSet: false),
  Task(name: "Went to first Lecture or Livestream", isSet: false),
  Task(name: "Went to second Lecture or Livestream", isSet: false),
];

final genericSimpleTasks = [
  Task(name: "Went to Tutorial", isSet: false),
  Task(name: "Did Homework", isSet: false),
  Task(name: "Went to Lecture or Livestream", isSet: false),
];

final basicTasks = [
  Task(name: "Went to Tutorial", isSet: false),
  Task(name: "Did Homework", isSet: false),
  Task(name: "Went to first Lecture", isSet: false),
  Task(name: "Went to second Lecture", isSet: false),
];

final simpleTasks = [
  Task(name: "Went to Tutorial", isSet: false),
  Task(name: "Did Homework", isSet: false),
  Task(name: "Went to Tutorial", isSet: false),
];

final minimalTasks = [
  Task(name: "Went to first Lecture", isSet: false),
  Task(name: "Went to second Lecture", isSet: false)
];
